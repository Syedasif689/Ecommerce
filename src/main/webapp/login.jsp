
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

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

            <h1>Welcome!</h1>

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

            <button class="login-btn" type="submit">
                Login
            </button>
            <br><br>

             <label class="remember">
              <input type="checkbox" name="rememberMe">
                 Remember Me
               </label>

        </form>

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

</body>
</html>
