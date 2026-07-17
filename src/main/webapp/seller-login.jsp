<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/seller-login.css">

<link rel="stylesheet" href="css/security.css">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
<div class="login-wrapper">

    <!-- Left Section -->

    <div class="animation-section">

        <h1>Welcome Back Seller</h1>

        <p>
            Manage your products, orders and grow your business with our marketplace.
        </p>

        <video autoplay muted loop playsinline>

            <source src="images/seller-animation.mp4" type="video/mp4">

        </video>

        <div class="features">

            <div class="feature">
                <i class="fa-solid fa-store"></i>
                <span>Manage Store</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-box"></i>
                <span>Manage Products</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-chart-line"></i>
                <span>Track Sales</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-money-bill-wave"></i>
                <span>Fast Payments</span>
            </div>

        </div>

    </div>

    <!-- Login Card -->

    <div class="login-card">

        <!-- Mobile Hero -->

        <div class="mobile-hero">

            <h1>Seller Login</h1>

            <p>Access your seller dashboard anywhere.</p>

            <div class="mobile-video">

                <video autoplay muted loop playsinline>

                    <source src="images/seller-animation.mp4" type="video/mp4">

                </video>

            </div>

        </div>

        <h2>Seller Login</h2>

        <form action="sellerLogin" method="post">

            <div class="input-box">

                <i class="fa-solid fa-envelope"></i>

                <input
                    type="email"
                    name="email"
                    placeholder="Email Address"
                    required>

            </div>

            <div class="input-box">

                <i class="fa-solid fa-lock"></i>

                <input
                    type="password"
                    name="password"
                    placeholder="Password"
                    required>

            </div>

            <button type="submit">

                <i class="fa-solid fa-right-to-bracket"></i>

                Login

            </button>

        </form>

        <p>

            New Seller?

            <a href="seller-register.jsp">
                Register Here
            </a>

        </p>

        <!-- Mobile Features -->

        <div class="mobile-features">

            <div class="feature">
                <i class="fa-solid fa-store"></i>
                <span>Manage Store</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-box"></i>
                <span>Products</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-chart-line"></i>
                <span>Sales</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-money-bill-wave"></i>
                <span>Payments</span>
            </div>

        </div>

    </div>

</div>

</body>
</html>