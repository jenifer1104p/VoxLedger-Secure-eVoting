package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

/** Central JDBC connection factory. Configure credentials through environment variables. */
public final class dbconn {
    private dbconn() { }

    public static Connection create() {
        String host = env("DB_HOST", "localhost");
        String port = env("DB_PORT", "3306");
        String database = env("DB_NAME", "studentvoute");
        String username = env("DB_USER", "root");
        String password = System.getenv("Jeni@123");
        if (password == null) password = "";
        String url = "jdbc:mysql://" + host + ":" + port + "/" + database
                + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, username, password);
        } catch (Exception ex) {
            throw new IllegalStateException("Database connection failed. Check DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD and MySQL Connector/J.", ex);
        }
    }

    private static String env(String name, String fallback) {
        String value = System.getenv(name);
        return value == null || value.trim().isEmpty() ? fallback : value.trim();
    }
}
