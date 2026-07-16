<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body{
    font-family:Arial,sans-serif;
    margin:20px;
}

.products{
    display:flex;
    flex-wrap:wrap;
    gap:20px;
}

.product-card{
    width:250px;
    border:1px solid #ddd;
    border-radius:10px;
    padding:15px;
}

.product-card img{
    width:100%;
    height:220px;
    object-fit:cover;
    border-radius:8px;
}

.price{
    color:green;
    font-weight:bold;
}
</style>

</head>
<body>

<h2>Search Results</h2>

<div class="products">

<%
if(products != null && !products.isEmpty()){

    for(Product product : products){
%>

<div class="product-card">

    <img src="<%= product.getImageUrl() %>">

    <h3><%= product.getName() %></h3>

    <p class="price">
        ₹<%= product.getPrice() %>
    </p>

    <p>
        <%= product.getDescription() %>
    </p>

</div>

<%
    }
}else{
%>

<h3>No products found.</h3>

<%
}
%>

</div>

</body>
</html>