
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String googleClientId = System.getenv("GOOGLE_CLIENT_ID");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://accounts.google.com/gsi/client" async defer></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Login</title>

<link rel="stylesheet" href="css/login.css">

<link rel="stylesheet" href="css/security.css">
</head>

<body>


<div class="login-container">

    <!-- Left Video Section -->
    <div class="login-video">

        <video autoplay muted loop playsinline>
            <source src="images/login.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>

        <div class="video-overlay"></div>

        <div class="image-content">

            <h1>Welcome Back!</h1>

            <p>
                Shop smarter, faster, and securely.
                Login to access your orders, wishlist,
                and personalized shopping experience.
            </p>

        </div>

    </div>

    <!-- Right Login Section -->
    <div class="login-box">

        <h2>Customer Login</h2>
        <p>Client ID: <%= googleClientId %></p>

        <p class="subtitle">
            Sign in to continue shopping.
        </p>

        <form action="LoginServlet" method="post">

            <label>Email Address</label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email"
                required>

            <label>Password</label>

            <input
                type="password"
                name="password"
                placeholder="Enter your password"
                required>

               <button class="login-btn" type="submit" id="loginBtn">
                   Login
               </button>
            <br><br>

             <label class="remember">
              <input type="checkbox" name="rememberMe">
                 Remember Me
               </label>

        </form>
         <div class="divider">
    <span>OR</span>
</div>

<div id="g_id_onload"
     data-client_id="<%= googleClientId %>"
     data-callback="handleCredentialResponse"
     data-auto_prompt="false">
</div>

<div class="google-login">
    <div class="g_id_signin"
         data-type="standard"
         data-theme="outline"
         data-size="large"
         data-shape="pill"
         data-text="continue_with"
         data-logo_alignment="left"
         data-width="330">
    </div>
    <form id="googleForm"
      action="GoogleLoginServlet"
      method="post">

    <input
        type="hidden"
        id="credential"
        name="credential">

</form>
</div>

<div class="links">
    <a href="register.jsp">Create Customer Account</a>
</div>

        <div class="seller-section">

            <h3>Seller Portal</h3>

            <p>
                Join our marketplace and start selling your products.
            </p>

            <div class="seller-buttons">

                <a href="seller-register.jsp">
                    <button class="register-btn" type="button">
                        Become a Seller
                    </button>
                </a>

            </div>

        </div>

    </div>

</div>
<script>
document.querySelector('form[action="LoginServlet"]').addEventListener("submit", function (e) {
    const btn = document.getElementById("loginBtn");

    if (btn.disabled) {
        e.preventDefault();
        return;
    }

    btn.disabled = true;
    btn.innerHTML = "Logging In...";
});
</script>
<script>
function handleCredentialResponse(response) {

    document.getElementById("credential").value =
        response.credential;

    document.getElementById("googleForm").submit();
}
</script>
</body>
</html>
