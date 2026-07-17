<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Customer Registration</title>

<link rel="stylesheet" href="css/register.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="register-wrapper">

    <!-- Left Side (Desktop) -->

    <div class="animation-section">

        <h1>Create Your Account</h1>

        <p>
            Join thousands of happy customers and enjoy secure
            shopping, exclusive offers, and fast delivery.
        </p>
<video
    autoplay
    muted
    loop
    playsinline
    disablePictureInPicture
    controlsList="nodownload nofullscreen noplaybackrate"
    preload="auto">

    <source src="images/customer-animation.mp4" type="video/mp4">

</video>
        <div class="features">

            <div class="feature">
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Easy Shopping</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-truck-fast"></i>
                <span>Fast Delivery</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-credit-card"></i>
                <span>Secure Payments</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-gift"></i>
                <span>Exclusive Offers</span>
            </div>

        </div>

    </div>

    <!-- Right Side -->

    <div class="register-card">

        <!-- Mobile Hero -->

        <div class="mobile-hero">

            <h1>Create Your Account</h1>

            <p>
                Shop smarter with thousands of products at your fingertips.
            </p>

            <div class="mobile-video">

                <video autoplay muted loop playsinline>

                    <source src="images/customer-animation.mp4"
                    type="video/mp4">

                </video>

            </div>

        </div>

        <h2>Customer Registration</h2>

        <form action="RegisterServlet" method="post">

            <input
                type="text"
                name="name"
                placeholder="Full Name"
                required>

            <input
                type="email"
                name="email"
                placeholder="Email Address"
                required>

            <input
                type="password"
                name="password"
                placeholder="Create a Password"
                required>

            <button type="submit">
                Register
            </button>

        </form>

        <p>

            Already have an account?

            <a href="login.jsp">
                Login Here
            </a>

        </p>

        <!-- Mobile Features -->

        <div class="mobile-features">

            <div class="feature">
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Easy Shopping</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-truck-fast"></i>
                <span>Fast Delivery</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-credit-card"></i>
                <span>Secure Payments</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-gift"></i>
                <span>Exclusive Offers</span>
            </div>

        </div>

    </div>

</div>

</body>

</html>