
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Login | VoxLedger</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>
:root {
    --primary: #2c3e50;
    --secondary: #3498db;
    --accent: #e74c3c;
    --light: #ecf0f1;
    --dark: #2c3e50;
    --success: #2ecc71;
    --gradient: linear-gradient(135deg, #3498db, #2c3e50);
    --shadow: 0 10px 30px rgba(0,0,0,0.1);
    --transition: all 0.3s ease;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background: var(--gradient);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

a {
    text-decoration: none;
    color: var(--secondary);
    transition: var(--transition);
}

a:hover {
    color: var(--accent);
}

.wrapper {
    background: white;
    border-radius: 20px;
    box-shadow: var(--shadow);
    overflow: hidden;
    width: 100%;
    max-width: 1000px;
    display: flex;
    min-height: 600px;
}

.inner {
    display: flex;
    width: 100%;
}

.image-holder {
    flex: 1;
    background: var(--gradient);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 40px;
    color: white;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.image-holder:before {
    content: '';
    position: absolute;
    inset: 0;
    background-image: radial-gradient(
        rgba(255,255,255,0.12) 1px,
        transparent 1px
    );
    background-size: 25px 25px;
}

.image-holder .content {
    position: relative;
    z-index: 1;
}

.image-holder .main-icon {
    font-size: 90px;
    margin-bottom: 30px;
}

.image-holder h2 {
    font-size: 1.8rem;
    margin-bottom: 15px;
}

.image-holder p {
    font-size: 1rem;
    opacity: 0.9;
    max-width: 300px;
    line-height: 1.7;
}

.features {
    list-style: none;
    margin-top: 30px;
    text-align: left;
}

.features li {
    margin-bottom: 15px;
}

.features i {
    margin-right: 10px;
}

form {
    flex: 1;
    padding: 60px 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

h3 {
    color: var(--primary);
    font-size: 2rem;
    margin-bottom: 10px;
    text-align: center;
    position: relative;
    padding-bottom: 15px;
}

h3:after {
    content: '';
    position: absolute;
    width: 70px;
    height: 4px;
    background: var(--secondary);
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 2px;
}

.subtitle {
    text-align: center;
    color: #666;
    margin-bottom: 30px;
    font-size: 1rem;
}

.form-wrapper {
    position: relative;
    margin-bottom: 25px;
}

.form-control {
    width: 100%;
    padding: 15px 20px 15px 50px;
    border: 2px solid #e1e5ee;
    border-radius: 10px;
    font-size: 1rem;
    transition: var(--transition);
    background: white;
    color: var(--dark);
}

.form-control:focus {
    outline: none;
    border-color: var(--secondary);
    box-shadow: 0 0 0 3px rgba(52,152,219,0.2);
}

.form-wrapper i {
    position: absolute;
    top: 50%;
    left: 20px;
    transform: translateY(-50%);
    color: #a0a0a0;
    font-size: 1.2rem;
    pointer-events: none;
}

.form-control:focus + i {
    color: var(--secondary);
}

button {
    background: var(--gradient);
    color: white;
    border: none;
    border-radius: 10px;
    padding: 15px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: var(--transition);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
    box-shadow: 0 5px 15px rgba(52,152,219,0.4);
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(52,152,219,0.6);
}

button i {
    margin-left: 10px;
}

.register-link {
    text-align: center;
    margin-top: 25px;
    font-size: 0.95rem;
}

.register-link a {
    font-weight: 600;
}

.alert {
    padding: 12px 18px;
    border-radius: 10px;
    margin-bottom: 20px;
    font-size: 0.88rem;
    display: none;
}

.alert-error {
    background: rgba(231,76,60,0.1);
    border-left: 4px solid var(--accent);
    color: #c0392b;
}

.alert-success {
    background: rgba(46,204,113,0.1);
    border-left: 4px solid var(--success);
    color: #218c54;
}

@media (max-width: 768px) {
    .inner {
        flex-direction: column;
    }

    .image-holder {
        padding: 35px 20px;
    }

    .image-holder .main-icon {
        font-size: 55px;
        margin-bottom: 15px;
    }

    .features {
        margin-top: 20px;
    }

    form {
        padding: 40px 30px;
    }
}
</style>
</head>

<body>

<div class="wrapper">

    <div class="inner">

        <!-- LEFT SECTION -->
        <div class="image-holder">

            <div class="content">

                <div class="main-icon">
                    <i class="zmdi zmdi-shield-check"></i>
                </div>

                <h2>Welcome Back, Student</h2>

                <p>
                    Login securely to access your student portal
                    and participate in the online voting system.
                </p>

                <ul class="features">

                    <li>
                        <i class="zmdi zmdi-lock"></i>
                        Secure student authentication
                    </li>

                    <li>
                        <i class="zmdi zmdi-account"></i>
                        Personalized student access
                    </li>

                    <li>
                        <i class="zmdi zmdi-check-circle"></i>
                        Secure online voting experience
                    </li>

                </ul>

            </div>

        </div>

        <!-- RIGHT LOGIN FORM -->
        <form action="${pageContext.request.contextPath}/studentlog"
              method="post">

            <h3>Student Login</h3>

            <p class="subtitle">
                Enter your details to access the portal
            </p>

            <!-- SUCCESS MESSAGE -->
            <div id="success-alert" class="alert alert-success">
                <i class="zmdi zmdi-check-circle"></i>
                Registration successful! You can now login.
            </div>

            <!-- ERROR MESSAGE -->
            <div id="error-alert" class="alert alert-error">
                <i class="zmdi zmdi-alert-circle"></i>
                <span id="error-text">
                    Login failed. Please check your details.
                </span>
            </div>

            <!-- EMAIL -->
            <div class="form-wrapper">

                <input type="email"
                       placeholder="Email Address"
                       name="email"
                       class="form-control"
                       maxlength="45"
                       autocomplete="username"
                       required>

                <i class="zmdi zmdi-email"></i>

            </div>

            <!-- PASSWORD -->
            <div class="form-wrapper">

                <input type="password"
                       placeholder="Password"
                       name="password"
                       class="form-control"
                       autocomplete="current-password"
                       required>

                <i class="zmdi zmdi-lock"></i>

            </div>

            <!-- LOGIN BUTTON -->
            <button type="submit">

                Login

                <i class="zmdi zmdi-arrow-right"></i>

            </button>

            <!-- REGISTER LINK -->
            <div class="register-link">

                New student?

                <a href="${pageContext.request.contextPath}/voterreg.jsp">
                    Register here
                </a>

            </div>

        </form>

    </div>

</div>

<script>

document.addEventListener("DOMContentLoaded", function() {

    const params = new URLSearchParams(window.location.search);

    const successAlert = document.getElementById("success-alert");
    const errorAlert = document.getElementById("error-alert");
    const errorText = document.getElementById("error-text");

    if (params.get("msg") === "registered") {
        successAlert.style.display = "block";
    }

    const error = params.get("error");

    if (error === "user_not_found") {
        errorText.textContent = "User not found. Please register first.";
        errorAlert.style.display = "block";
    }

    if (error === "invalid_credentials") {
        errorText.textContent = "Incorrect email or password.";
        errorAlert.style.display = "block";
    }

    if (error === "server_error") {
        errorText.textContent = "Unable to process login. Please try again.";
        errorAlert.style.display = "block";
    }

});

</script>

</body>
</html>
