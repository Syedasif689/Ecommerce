<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.ecommerce.model.*" %>
<%@ page import="com.ecommerce.dao.ProductDAO" %>

<%
Seller seller = (Seller)session.getAttribute("seller");

if(seller == null){
    response.sendRedirect("seller-login.jsp");
    return;
}

ProductDAO dao = new ProductDAO();
List<Product> products = dao.getProductsBySeller(seller.getSellerId());
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Seller Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet"
href="css/seller-dashboard.css">

</head>

<body>

<div class="dashboard-header">

    <div>

        <h1>Seller Dashboard</h1>

        <h3>
            Welcome,
            <%= seller.getSellerName() %>
        </h3>

        <p>
            <strong>Shop:</strong>
            <%= seller.getShopName() %>
        </p>

        <p>
            <strong>Industry:</strong>
            <%= seller.getIndustry() %>
        </p>

    </div>

    <div class="dashboard-buttons">

        <a href="add-product.jsp" class="add-btn">
            <i class="fa-solid fa-plus"></i>
            Add Product
        </a>

        <a href="sellerLogout" class="logout-btn">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </div>

</div>

<h2 class="products-title">My Products</h2>

<div class="product-grid">

<%
if(products != null && !products.isEmpty()){

    for(Product product : products){
%>

<div class="product-card">

    <img src="<%= product.getImageUrl() %>" alt="Product Image">

    <h3><%= product.getName() %></h3>

    <div class="price">
        ₹<%= product.getPrice() %>
    </div>

    <p>
        <%= product.getDescription() %>
    </p>

    <div class="card-buttons">

        <a href="edit-product.jsp?id=<%=product.getId()%>" class="edit-btn">
            <i class="fa-solid fa-pen"></i>
            Edit
        </a>

        <a href="deleteProduct?id=<%=product.getId()%>"
           class="delete-btn"
           onclick="return confirm('Delete this product?')">

            <i class="fa-solid fa-trash"></i>
            Delete

        </a>

    </div>

</div>

<%
    }
}else{
%>

<div class="empty-products">

    <i class="fa-solid fa-box-open"></i>

    <h2>No Products Yet</h2>

    <p>
        Start growing your store by adding your first product.
    </p>

    <a href="add-product.jsp" class="add-btn">

        <i class="fa-solid fa-plus"></i>

        Add Product

    </a>

</div>

<%
}
%>

</div>

</body>
</html>