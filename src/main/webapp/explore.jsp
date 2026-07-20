<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%@ page import="com.ecommerce.model.Product" %>
<%
ProductDAO dao = new ProductDAO();
List<Product> products = dao.getAllProducts();

%>
<%
for(Product p : products){
    out.println("<p>" + p.getId() + " - " + p.getName() + "</p>");
}
%>
<h1 style="color:red;">THIS IS EXPLORE PAGE</h1>
<p>Total Products: <%= products.size() %></p><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Home</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/home.css?v=3">

<link rel="stylesheet"
href="<%= request.getContextPath() %>/css/security.css">

</head>
<body>

<div class="navbar">

    <div class="logo">
    <i class="fas fa-store"></i>
    Online Store
</div>

<form action="SearchServlet" method="get" class="nav-search">

    <input
        type="text"
        name="keyword"
        placeholder="Search products..."
        required>

    <button type="submit">
        <i class="fas fa-search"></i>
    </button>

</form>

<div class="nav-actions">

    <div class="search-icon">
        <i class="fas fa-search"></i>
    </div>

    <div class="menu-toggle">
        <i class="fas fa-bars"></i>
    </div>

</div>

    <div class="nav-links">

   <a href="index.jsp">
    <i class="fas fa-house"></i> Home
</a>

<a href="explore.jsp" class="active">
    <i class="fas fa-compass"></i> Explore
</a>
    <a href="login.jsp">
        <i class="fas fa-user"></i> User Login
    </a>

    <a href="register.jsp">
        <i class="fas fa-user-plus"></i> Register
    </a>

    <a href="seller-register.jsp">
        <i class="fas fa-store"></i> Become Seller
    </a>

    <a href="seller-login.jsp">
        <i class="fas fa-store-alt"></i> Seller Login
    </a>

</div>

</div>
<div class="container">

    <h1>Welcome to Online Store</h1>

<h3>Explore Amazing Products</h3>

<p>
Browse thousands of quality products from trusted sellers.
Sign in to add products to your cart, place orders, and enjoy a personalized shopping experience.
</p>
</div>
<section class="hero-banner">

    <h2>Discover Amazing Products</h2>

    <p>
        Shop from thousands of trusted sellers with secure payments,
        fast delivery, and exclusive offers.
    </p>

    <video
         autoplay
         muted
         loop
         playsinline
         disablePictureInPicture
         controlsList="nodownload noplaybackrate nofullscreen">
        <source src="images/sale.mp4" type="video/mp4">
    </video>

    <div class="hero-features">

        <div>
            <i class="fas fa-truck-fast"></i>
            <span>Fast Delivery</span>
        </div>

        <div>
            <i class="fas fa-credit-card"></i>
            <span>Secure Payments</span>
        </div>

        <div>
            <i class="fas fa-rotate-left"></i>
            <span>Easy Returns</span>
        </div>

        <div>
            <i class="fas fa-tags"></i>
            <span>Best Deals</span>
        </div>

    </div>

</section>

<h2>Featured Products</h2>

<div class="products">

<%
for(Product product : products){
%>

<div class="product-card"
onclick="location.href='product-details.jsp?id=<%= product.getId() %>'">
    <img src="<%= product.getImageUrl() %>" width="200" height="200">

    <h3><%= product.getName() %></h3>

    <p>₹<%= product.getPrice() %></p>

    <p><%= product.getDescription() %></p>

    <a href="product-details.jsp?id=<%= product.getId() %>">
    View Product
</a>

</div>

<%
}
%>

</div>
<div class="search-modal" id="searchModal">

    <div class="search-box">

        <span class="close-search">&times;</span>

        <h2>Search Products</h2>

        <p>Find your favourite products instantly.</p>

        <form action="SearchServlet" method="get" class="modal-search-form">

    <input
        type="text"
        name="keyword"
        placeholder="Search products..."
        required>

    <button type="submit">
        <i class="fas fa-search"></i>
    </button>

</form>
    </div>

</div>

<script>

const menu = document.querySelector(".menu-toggle");
const nav = document.querySelector(".nav-links");
const icon = menu.querySelector("i");


menu.onclick = function(){

    nav.classList.toggle("active");

    menu.classList.toggle("active");


    if(nav.classList.contains("active")){

        icon.classList.replace("fa-bars","fa-xmark");

    }
    else{

        icon.classList.replace("fa-xmark","fa-bars");

    }

};
const searchIcon = document.querySelector(".search-icon");
const searchModal = document.querySelector(".search-modal");
const closeSearch = document.querySelector(".close-search");

searchIcon.onclick = () => {

    searchModal.classList.add("active");

    document.querySelector(".search-box input").focus();

};

closeSearch.onclick = () => {

    searchModal.classList.remove("active");

};

searchModal.onclick = function(e){

    if(e.target === searchModal){

        searchModal.classList.remove("active");

    }

};

document.addEventListener("keydown", function(e){

    if(e.key === "Escape"){

        searchModal.classList.remove("active");

    }

});
</script>

</body>
</html>