<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Registration</title>
<link rel="stylesheet" href="css/seller-register.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body>

<div class="register-wrapper">

    <!-- Left Side -->
    <div class="register-card">
         <div class="mobile-hero">

    <h1>Grow Your Business</h1>

    <p>
        Join thousands of trusted sellers and reach customers
        across the country with our powerful marketplace.
    </p>

    <div class="mobile-video">

        <video
         autoplay
         muted
         loop
         playsinline
         disablePictureInPicture
         controlsList="nodownload noplaybackrate nofullscreen">
         
            <source src="images/seller-animation.mp4" type="video/mp4">
        </video>

    </div>

</div>

        <h2>Seller Registration</h2>
     

        <form action="sellerRegister" method="post">

            <input type="text" name="sellerName" placeholder="Seller Name" required>

            <input type="text" name="shopName" placeholder="Shop Name" required>

            <input type="text" name="industry" placeholder="Industry" required>

            <input type="email" name="email" placeholder="Email" required>

            <input type="text" name="phone" placeholder="Phone Number" required>

            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Register</button>

        </form>

        <p>
            Already a seller?
            <a href="seller-login.jsp">Login Here</a>
        </p>

    </div>
    <div class="mobile-features">

    <div class="feature">
        <i class="fa-solid fa-shield-halved"></i>
        <span>Secure Payments</span>
    </div>

    <div class="feature">
        <i class="fa-solid fa-chart-line"></i>
        <span>Business Analytics</span>
    </div>

    <div class="feature">
        <i class="fa-solid fa-box"></i>
        <span>Easy Product Management</span>
    </div>

    <div class="feature">
        <i class="fa-solid fa-headset"></i>
        <span>24×7 Seller Support</span>
    </div>

</div>

    <!-- Right Side -->
    <div class="animation-section">
      <h1>Grow Your Business</h1>

    <p>
        Join thousands of trusted sellers and reach customers
        across the country with our powerful marketplace.
    </p>

        <video
         autoplay
         muted
         loop
         playsinline
         disablePictureInPicture
         controlsList="nodownload noplaybackrate nofullscreen">

            <source src="images/seller-animation.mp4" type="video/mp4">
        </video>
        <div class="features">

        <div class="feature">
            <i class="fa-solid fa-shield-halved"></i>
            <span>Secure Payments</span>
        </div>

        <div class="feature">
            <i class="fa-solid fa-chart-line"></i>
            <span>Business Analytics</span>
        </div>

        <div class="feature">
            <i class="fa-solid fa-box"></i>
            <span>Easy Product Management</span>
        </div>

        <div class="feature">
            <i class="fa-solid fa-headset"></i>
            <span>24×7 Seller Support</span>
        </div>

    </div>
    </div>

</div>

</body>
</html>