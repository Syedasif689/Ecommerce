<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.ecommerce.dao.ProductDAO"%>
<%@ page import="com.ecommerce.model.Product"%>

<%
String id = request.getParameter("id");

if(id == null){
    response.sendRedirect("home.jsp");
    return;
}

ProductDAO dao = new ProductDAO();

Product product =
dao.getProductById(Integer.parseInt(id));

if(product == null){
    out.println("<h2>Product Not Found</h2>");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title><%= product.getName() %></title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet"
href="css/product-details.css">

</head>

<body>

<div class="container">

    <div class="image-section">

        <img src="<%= product.getImageUrl() %>">

    </div>

    <div class="details-section">

        <h1>
            <%= product.getName() %>
        </h1>

        <h2>
            ₹<%= product.getPrice() %>
        </h2>

        <p class="description">
            <%= product.getDescription() %>
        </p>

        <div class="info">

            <p>

                <i class="fa-solid fa-store"></i>

                <strong>Shop :</strong>

                <%= product.getShopName() %>

            </p>

            <p>

                <i class="fa-solid fa-user"></i>

                <strong>Seller :</strong>

                <%= product.getSellerName() %>

            </p>

        </div>

        <div class="features">

            <p>
                <i class="fa-solid fa-circle-check"></i>
                In Stock
            </p>

            <p>
                <i class="fa-solid fa-truck-fast"></i>
                Fast Delivery
            </p>

            <p>
                <i class="fa-solid fa-credit-card"></i>
                Secure Payment
            </p>

            <p>
                <i class="fa-solid fa-arrow-rotate-left"></i>
                Easy Returns
            </p>

        </div>

        <div class="buttons">

            <a href="AddToCartServlet?productId=<%= product.getId() %>"
               class="cart-btn">

                <i class="fa-solid fa-cart-shopping"></i>

                Add to Cart

            </a>

            <a href="BuyNowServlet?productId=<%= product.getId() %>"
             class="buy-btn">

             <i class="fa-solid fa-bolt"></i>

                Buy Now

            </a>

        </div>

    </div>

</div>

</body>

</html>