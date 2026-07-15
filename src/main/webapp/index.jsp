<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Commerce Store</title>
<link rel="stylesheet" href="css/index.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/security.css">

</head>
<div class="floating-icons">
    <i class="fas fa-shopping-cart"></i>
    <i class="fas fa-box"></i>
    <i class="fas fa-credit-card"></i>
    <i class="fas fa-gift"></i>
</div>
<body>

<section class="hero">

    <div class="hero-text">

        <span class="tagline">
            Online Shopping Platform
        </span>

        <h1>
            Shop Smart, Save More,
            Live Better.
        </h1>

        <p>
            Explore thousands of quality products from trusted sellers.
            Enjoy secure payments, fast delivery, easy returns, and
            exclusive deals—all in one place.
        </p>

        <div class="hero-buttons">
           <a href="login.jsp" class="btn login-btn">
    <i class="fa-solid fa-right-to-bracket"></i>
    Login
</a>

<a href="register.jsp" class="btn register-btn">
    <i class="fa-solid fa-user-plus"></i>
    Register
</a>
        </div>

    </div>

   <div class="hero-image">
    <video autoplay muted loop playsinline>
        <source src="images/shop.mp4" type="video/mp4">
    </video>
</div>

</section>

<section class="features">

    <div class="feature-card">
        <i class="fas fa-truck"></i>
        <h3>Fast Delivery</h3>
        <p>Reliable shipping and quick order fulfillment.</p>
    </div>

    <div class="feature-card">
        <i class="fas fa-lock"></i>
        <h3>Secure Payments</h3>
        <p>Protected transactions with trusted payment gateways.</p>
    </div>

    <div class="feature-card">
        <i class="fas fa-tags"></i>
        <h3>Exclusive Deals</h3>
        <p>Discover exciting discounts and seasonal offers.</p>
    </div>

</section>

</body>
</html>