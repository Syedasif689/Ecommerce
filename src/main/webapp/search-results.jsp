<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>
<%
String keyword = (String) request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Search Results</title>

<link rel="stylesheet" href="css/search-result.css">
<link rel="stylesheet" href="css/security.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="container">

    <div class="header">
        

    <h1>
        <i class="fa-solid fa-magnifying-glass"></i>
        Search Results
    </h1>

    <form action="SearchServlet" method="get" class="search-form">

        <input
            type="text"
            name="keyword"
            value="<%= keyword != null ? keyword : "" %>"
            placeholder="Search products..."
            required>

        <button type="submit">
            <i class="fa-solid fa-search"></i>
        </button>

    </form>

    <a href="home.jsp" class="back-btn">
        <i class="fa-solid fa-house"></i>
        Home
    </a>

</div>

<div class="search-info">

    <h2>
        Search Results for
        <span>"<%= keyword %>"</span>
    </h2>

   <p>
    <%= (products != null) ? products.size() : 0 %> product(s) found
</p>

</div>
<%
if(products != null && !products.isEmpty()){
%>

<div class="products">

<%
for(Product product : products){
%>

<div class="product-card"
     onclick="window.location='product-details.jsp?id=<%= product.getId() %>'">

    <img src="<%= product.getImageUrl() %>">

    <div class="card-content">

        <h3>
            <%= product.getName() %>
        </h3>

        <div class="price">

            ₹<%= product.getPrice() %>

        </div>

        <p>
            <%= product.getDescription() %>
        </p>

       <a href="product-details.jsp?id=<%= product.getId() %>" class="view-btn">

            <i class="fa-solid fa-eye"></i>

            View Product

        </a>

    </div>

</div>

<%
}
%>

</div>

<%
}else{
%>

<div class="empty-state">

    <i class="fa-solid fa-box-open"></i>

    <h2>No Products Found</h2>

<p>

No results found for
<strong>"<%= keyword %>"</strong>.

Try searching with another keyword.

</p>

    <a href="home.jsp" class="view-btn">
    Browse All Products
</a>
</div>

<%
}
%>

</div>

</body>
</html>