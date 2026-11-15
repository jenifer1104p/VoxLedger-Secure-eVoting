
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration | VoxLedger</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
 rel="stylesheet">

<style>
:root {
    --primary: #2c3e50;
    --secondary: #3498db;
    --accent: #e74c3c;
    --success: #2ecc71;
    --light: #ecf0f1;
    --dark: #2c3e50;
    --gradient: linear-gradient(135deg, #3498db, #2c3e50);
    --shadow: 0 10px 30px rgba(0,0,0,0.1);
    --transition: all 0.3s ease;
}

* {
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
}

body {
    background: var(--gradient);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

.registration-container {
    display: flex;
    width: 100%;
    max-width: 1000px;
    background: white;
    border-radius: 20px;
    box-shadow: var(--shadow);
    overflow: hidden;
    min-height: 650px;
}

.illustration-section {
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

.illustration-section:before {
    content: '';
    position: absolute;
    inset: 0;
    background-image: radial-gradient(
        rgba(255,255,255,0.12) 1px, transparent 1px
    );
    background-size: 25px 25px;
}

.illustration-content {
    z-index: 1;
    max-width: 400px;
}

.illustration-icon {
    font-size: 90px;
    margin-bottom: 30px;
    color: white;
}

.illustration-section h2 {
    font-size: 1.8rem;
    margin-bottom: 15px;
}

.illustration-section p {
    font-size: 1rem;
    opacity: 0.9;
    line-height: 1.7;
}

.features-list {
    list-style: none;
    margin-top: 30px;
    text-align: left;
}

.features-list li {
    margin-bottom: 17px;
    display: flex;
    align-items: flex-start;
}

.features-list i {
    color: var(--light);
    margin-right: 12px;
    margin-top: 4px;
}

.form-section {
    flex: 1;
    padding: 45px 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.form-header {
    text-align: center;
    margin-bottom: 25px;
}

.form-header h1 {
    color: var(--primary);
    font-size: 2rem;
    margin-bottom: 10px;
    position: relative;
    padding-bottom: 15px;
}

.form-header h1:after {
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

.form-header p {
    color: #666;
    font-size: 0.95rem;
}

.form-group {
    margin-bottom: 17px;
    position: relative;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    color: var(--primary);
    font-weight: 500;
    font-size: 0.9rem;
}

.input-with-icon {
    position: relative;
}

.form-control {
    width: 100%;
    padding: 12px 15px 12px 45px;
    border: 2px solid #e1e5ee;
    border-radius: 10px;
    font-size: 0.95rem;
    transition: var(--transition);
    background: white;
    color: var(--dark);
}

.form-control:focus {
    outline: none;
    border-color: var(--secondary);
    box-shadow: 0 0 0 3px rgba(52,152,219,0.15);
}

.input-icon {
    position: absolute;
    top: 50%;
    left: 16px;
    transform: translateY(-50%);
    color: #a0a0a0;
    font-size: 1.05rem;
    pointer-events: none;
}

.form-control:focus ~ .input-icon {
    color: var(--secondary);
}

.error-message {
    color: var(--accent);
    font-size: 0.82rem;
    margin-top: 5px;
    display: none;
}

.server-message {
    background: rgba(231,76,60,0.08);
    border-left: 4px solid var(--accent);
    color: #c0392b;
    padding: 12px 15px;
    border-radius: 8px;
    margin-bottom: 18px;
    font-size: 0.9rem;
    overflow-wrap: anywhere;
}

.btn-submit {
    background: var(--gradient);
    color: white;
    border: none;
    border-radius: 10px;
    padding: 14px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: var(--transition);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
    box-shadow: 0 5px 15px rgba(52,152,219,0.3);
    width: 100%;
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(52,152,219,0.4);
}

.btn-submit i {
    margin-left: 10px;
}

.login-link {
    text-align: center;
    margin-top: 22px;
    font-size: 0.9rem;
    color: #666;
}

.login-link a {
    color: var(--secondary);
    font-weight: 600;
    text-decoration: none;
}

.login-link a:hover {
    color: var(--accent);
}

@media (max-width: 768px) {
    .registration-container {
        flex-direction: column;
    }

    .illustration-section {
        padding: 30px 20px;
    }

    .illustration-icon {
        font-size: 55px;
        margin-bottom: 15px;
    }

    .features-list {
        margin-top: 20px;
    }

    .form-section {
        padding: 35px 25px;
    }

    .form-header h1 {
        font-size: 1.7rem;
    }
}
</style>
</head>

<body>

<div class="registration-container">

    <!-- LEFT ILLUSTRATION SECTION -->
    <div class="illustration-section">
        <div class="illustration-content">

            <div class="illustration-icon">
                <i class="fas fa-vote-yea"></i>
            </div>

            <h2>Join Our Academic Community</h2>

            <p>
                Register now to become a student and participate
                in our secure online voting system.
            </p>

            <ul class="features-list">
                <li>
                    <i class="fas fa-shield-alt"></i>
                    <span>Secure registration process</span>
                </li>
                <li>
                    <i class="fas fa-user-check"></i>
                    <span>Quick verification and approval</span>
                </li>
                <li>
                    <i class="fas fa-mobile-alt"></i>
                    <span>Access your student portal anytime</span>
                </li>
                <li>
                    <i class="fas fa-clock"></i>
                    <span>Registration completed in minutes</span>
                </li>
            </ul>

        </div>
    </div>

    <!-- RIGHT REGISTRATION FORM -->
    <div class="form-section">

        <div class="form-header">
            <h1>Student Registration</h1>
            <p>Fill in your details to register as a student</p>
        </div>

        <% if (request.getAttribute("message") != null) { %>
            <div class="server-message">
                <i class="fas fa-exclamation-circle"></i>
                Registration could not be completed.
                Please check your details and try again.
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/studentreg"
              method="post"
              accept-charset="UTF-8"
              onsubmit="return validateForm()">

            <!-- NAME -->
            <div class="form-group">
                <label for="name">Full Name</label>
                <div class="input-with-icon">
                    <input type="text"
                           id="name"
                           name="name"
                           class="form-control"
                           placeholder="Enter your full name"
                           maxlength="45"
                           required>
                    <i class="fas fa-user input-icon"></i>
                </div>
            </div>

            <!-- EMAIL -->
            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-with-icon">
                    <input type="email"
                           id="email"
                           name="email"
                           class="form-control"
                           placeholder="Enter your email address"
                           maxlength="45"
                           required>
                    <i class="fas fa-envelope input-icon"></i>
                </div>
            </div>

            <!-- MOBILE -->
            <div class="form-group">
                <label for="phone-num">Mobile Number</label>
                <div class="input-with-icon">
                    <input type="tel"
                           id="phone-num"
                           name="mobile"
                           class="form-control"
                           placeholder="Enter your 10-digit mobile number"
                           maxlength="10"
                           inputmode="numeric"
                           required>
                    <i class="fas fa-phone input-icon"></i>
                </div>

                <span class="error-message" id="phone-error">
                    Please enter a valid 10-digit mobile number.
                </span>
            </div>

            <!-- COURSE -->
            <div class="form-group">
                <label for="course">Course</label>
                <div class="input-with-icon">
                    <select id="course"
                            name="course"
                            class="form-control"
                            required>
                        <option value="">Select your course</option>
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="EEE">EEE</option>
                        <option value="Mechanical">Mechanical</option>
                        <option value="Civil">Civil</option>
                    </select>
                    <i class="fas fa-book input-icon"></i>
                </div>
            </div>

            <!-- PASSWORD -->
            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-with-icon">
                    <input type="password"
                           id="password"
                           name="pass"
                           class="form-control"
                           placeholder="Enter your password"
                           minlength="6"
                           maxlength="45"
                           required>
                    <i class="fas fa-lock input-icon"></i>
                </div>

                <span class="error-message" id="password-error">
                    Password must contain at least 6 characters.
                </span>
            </div>

            <!-- SUBMIT -->
            <button type="submit" class="btn-submit">
                Complete Registration
                <i class="fas fa-arrow-right"></i>
            </button>

            <div class="login-link">
                Already registered?
                <a href="${pageContext.request.contextPath}/voterlogin.jsp">
                    Login
                </a>
            </div>

        </form>
    </div>
</div>

<script>
function validateForm() {

    var phoneInput = document.getElementById("phone-num");
    var phoneError = document.getElementById("phone-error");
    var password = document.getElementById("password");
    var passwordError = document.getElementById("password-error");

    var isValid = true;

    phoneError.style.display = "none";
    passwordError.style.display = "none";

    if (!/^[0-9]{10}$/.test(phoneInput.value)) {
        phoneError.style.display = "block";
        phoneInput.style.borderColor = "var(--accent)";
        isValid = false;
    } else {
        phoneInput.style.borderColor = "var(--success)";
    }

    if (password.value.length < 6) {
        passwordError.style.display = "block";
        password.style.borderColor = "var(--accent)";
        isValid = false;
    } else {
        password.style.borderColor = "var(--success)";
    }

    return isValid;
}

document.getElementById("phone-num").addEventListener("input", function() {

    this.value = this.value.replace(/[^0-9]/g, "").slice(0, 10);

    var phoneError = document.getElementById("phone-error");

    if (this.value.length === 10) {
        phoneError.style.display = "none";
        this.style.borderColor = "var(--success)";
    } else {
        this.style.borderColor = "#e1e5ee";
    }
});
</script>

</body>
</html>
