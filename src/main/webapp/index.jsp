<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.ecommerce.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user != null){
    response.sendRedirect("home.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Commerce Store</title>
<link rel="stylesheet" href="css/index.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/security.css">

</head>

<body>
<div class="floating-icons">
    <i class="fas fa-shopping-cart"></i>
    <i class="fas fa-box"></i>
    <i class="fas fa-credit-card"></i>
    <i class="fas fa-gift"></i>
</div>
<section class="hero">

    <div class="hero-text">

        <span class="tagline">
            Online Shopping Platform
        </span>

       <h1>
            Discover Amazing Products
            From Trusted Sellers
      </h1>

       <p>
           Browse thousands of products across multiple categories,
           discover trusted sellers, and enjoy a seamless shopping
           experience with secure payments, fast delivery, and exciting offers.
       </p>

        <div class="hero-buttons">

    <a href="explore.jsp" class="btn explore-btn">
        <i class="fa-solid fa-compass"></i>
        Explore Products
    </a>

    <a href="seller-register.jsp" class="btn seller-btn">
        <i class="fa-solid fa-store"></i>
        Become Seller
    </a>

</div>
<div class="divider">
    <span>OR</span>
</div>

<div class="auth-buttons">

    <a href="login.jsp" class="btn login-btn">
        <i class="fa-solid fa-right-to-bracket"></i>
        User Login
    </a>

    <a href="seller-login.jsp" class="btn seller-login-btn">
        <i class="fa-solid fa-shop"></i>
        Seller Login
    </a>

    <a href="register.jsp" class="btn register-btn">
        <i class="fa-solid fa-user-plus"></i>
        Create Account
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