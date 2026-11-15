

package Servlet;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dbcon.dbconn;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.rekognition.AmazonRekognition;
import com.amazonaws.services.rekognition.AmazonRekognitionClientBuilder;
import com.amazonaws.services.rekognition.model.*;

@WebServlet("/face")
public class face extends HttpServlet {

    private static final long serialVersionUID = 1L;

	/*
	 * private String detectFaceToken(byte[] imageBytes) throws Exception {
	 * 
	 * String apiKey = "9_QtANJEy3_sK1PYrHZfNsykf12RMSn8"; String apiSecret =
	 * "PTDoJ9R2ytODF_ZGjHF21WHavpkW9e3x";
	 * 
	 * String url = "https://api-us.faceplusplus.com/facepp/v3/detect"; String
	 * boundary = "----DetectBoundaryFaceTokenXYZ";
	 * 
	 * java.net.URL apiURL = new java.net.URL(url); java.net.HttpURLConnection conn
	 * = (java.net.HttpURLConnection) apiURL.openConnection();
	 * 
	 * conn.setDoOutput(true); conn.setUseCaches(false);
	 * conn.setRequestMethod("POST"); conn.setRequestProperty("Content-Type",
	 * "multipart/form-data; boundary=" + boundary);
	 * 
	 * DataOutputStream out = new DataOutputStream(conn.getOutputStream());
	 * 
	 * 
	 * out.writeBytes("--" + boundary + "\r\n");
	 * out.writeBytes("Content-Disposition: form-data; name=\"api_key\"\r\n\r\n");
	 * out.writeBytes(apiKey + "\r\n");
	 * 
	 * 
	 * out.writeBytes("--" + boundary + "\r\n");
	 * out.writeBytes("Content-Disposition: form-data; name=\"api_secret\"\r\n\r\n"
	 * ); out.writeBytes(apiSecret + "\r\n");
	 * 
	 * 
	 * out.writeBytes("--" + boundary + "\r\n"); out.
	 * writeBytes("Content-Disposition: form-data; name=\"image_file\"; filename=\"camera.jpg\"\r\n"
	 * ); out.writeBytes("Content-Type: application/octet-stream\r\n\r\n");
	 * out.write(imageBytes); out.writeBytes("\r\n");
	 * 
	 * out.writeBytes("--" + boundary + "--\r\n"); out.flush(); out.close();
	 * 
	 * 
	 * BufferedReader reader = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream())); StringBuilder sb = new
	 * StringBuilder(); String line; while ((line = reader.readLine()) != null)
	 * sb.append(line); reader.close();
	 * 
	 * JSONObject json = new JSONObject(sb.toString());
	 * 
	 * if (json.has("faces") && json.getJSONArray("faces").length() > 0) { return
	 * json.getJSONArray("faces").getJSONObject(0).getString("face_token"); }
	 * 
	 * return null; }
	 * 
	 * 
	 * private double compareTokens(String storedToken, String detectedToken) throws
	 * Exception {
	 * 
	 * String apiKey = "ZvtwYjTMD4bUmTTR9lFrRcfCUNWQCySM"; String apiSecret =
	 * "L_UnywqlpTNBlr0vSraVM98WyZlWezMC";
	 * 
	 * String url = "https://api-us.faceplusplus.com/facepp/v3/compare";
	 * 
	 * java.net.URL apiURL = new java.net.URL(url); java.net.HttpURLConnection conn
	 * = (java.net.HttpURLConnection) apiURL.openConnection();
	 * 
	 * conn.setDoOutput(true); conn.setRequestMethod("POST");
	 * conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	 * 
	 * String params = "api_key=" + apiKey + "&api_secret=" + apiSecret +
	 * "&face_token1=" + storedToken + "&face_token2=" + detectedToken;
	 * 
	 * conn.getOutputStream().write(params.getBytes("UTF-8"));
	 * 
	 * 
	 * BufferedReader reader = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream())); StringBuilder sb = new
	 * StringBuilder(); String line; while ((line = reader.readLine()) != null)
	 * sb.append(line); reader.close();
	 * 
	 * JSONObject json = new JSONObject(sb.toString());
	 * 
	 * if (json.has("confidence")) { return json.getDouble("confidence"); }
	 * 
	 * return 0; }
	 */

    private static final String COLLECTION_ID = System.getenv("AWS_REKOGNITION_COLLECTION") == null ? "" : System.getenv("AWS_REKOGNITION_COLLECTION");

    /* ================= AWS CLIENT ================= */
    private AmazonRekognition getClient() {

        if (COLLECTION_ID.trim().isEmpty()) {
            throw new IllegalStateException("Set AWS_REKOGNITION_COLLECTION before using facial verification.");
        }
        return AmazonRekognitionClientBuilder.standard()
                .withRegion(Regions.US_EAST_1)
                .withCredentials(com.amazonaws.auth.DefaultAWSCredentialsProviderChain.getInstance())
                .build();
    }

    /* ================= AWS FACE SEARCH ================= */
    private FaceMatch searchFace(byte[] imageBytes) {

        AmazonRekognition client = getClient();

        Image image = new Image()
                .withBytes(ByteBuffer.wrap(imageBytes));

        SearchFacesByImageRequest request =
                new SearchFacesByImageRequest()
                        .withCollectionId(COLLECTION_ID)
                        .withImage(image)
                        .withFaceMatchThreshold(70F)
                        .withMaxFaces(1);

        SearchFacesByImageResult result =
                client.searchFacesByImage(request);

        List<FaceMatch> matches = result.getFaceMatches();

        if (!matches.isEmpty()) {
            return matches.get(0);
        }

        return null;
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            String email = request.getParameter("email");

            
            String base64Image = request.getParameter("capturedImage");

            if (base64Image == null || base64Image.length() < 100) {
                response.sendRedirect("faceauthentication.jsp?error=No image captured");
                return;
            }

            base64Image = base64Image.split(",")[1];
            byte[] cameraImageBytes = Base64.getDecoder().decode(base64Image);

           
            Connection con = dbconn.create();
            PreparedStatement ps = con.prepareStatement(
                "SELECT face_token FROM studentvoute.voteid WHERE studentmail = ?"
            );
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                response.sendRedirect("faceauthentication.jsp?error=User Not Found");
                return;
            }

            String storedFaceId = rs.getString("face_token");

            if (storedFaceId == null || storedFaceId.trim().isEmpty()) {
                response.sendRedirect(
                        "faceauthentication.jsp?error=No stored face token");
                return;
            }


           
            FaceMatch match = searchFace(cameraImageBytes);

            if (match == null) {
                response.sendRedirect(
                        "faceauthentication.jsp?error=Face Not Matched");
                return;
            }
            
            String matchedFaceId = match.getFace().getFaceId();
            float similarity = match.getSimilarity();

            System.out.println("Stored FaceID : " + storedFaceId);
            System.out.println("Matched FaceID: " + matchedFaceId);
            System.out.println("Similarity    : " + similarity);

            float threshold = 80F;

            if (storedFaceId.equals(matchedFaceId)
                    && similarity >= threshold) {

                response.sendRedirect(
                        "votehere.jsp?msg=Face Verified Successfully ("
                                + similarity + "%)");
            } else {

                response.sendRedirect(
                        "faceauthentication.jsp?error=Face Mismatch ("
                                + similarity + "%)");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("faceauthentication.jsp?error=Error: " + ex.getMessage());
        }
    }
}
