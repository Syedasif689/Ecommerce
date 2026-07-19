<%@ page import="java.util.*" %>
<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
ProductDAO dao = new ProductDAO();
List<Product> products = dao.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet" href="css/security.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<title>Products</title>
</head>
<body>
<div class="products-container">

    <h2>
        <i class="fa-solid fa-store"></i>
        Available Products
    </h2>

    <div class="search-wrapper">

        <i class="fa-solid fa-magnifying-glass"></i>

        <input
            type="text"
            class="search-box"
            placeholder="Search Products">

    </div>

    <div class="table-wrapper">

        <table>

            <thead>

                <tr>

                    <th>
                        <i class="fa-solid fa-hashtag"></i>
                        ID
                    </th>

                    <th>
                        <i class="fa-solid fa-box-open"></i>
                        Product
                    </th>

                    <th>
                        <i class="fa-solid fa-indian-rupee-sign"></i>
                        Price
                    </th>

                    <th>
                        <i class="fa-solid fa-file-lines"></i>
                        Description
                    </th>

                    <th>
                        <i class="fa-solid fa-cart-shopping"></i>
                        Action
                    </th>

                </tr>

            </thead>

            <tbody>

            <%
            for(Product p : products){
            %>

            <tr>

                <td data-label="ID">
                    <i class="fa-solid fa-hashtag"></i>
                    <%= p.getId() %>
                </td>

                <td data-label="Product">
                    <i class="fa-solid fa-box"></i>
                    <%= p.getName() %>
                </td>

                <td data-label="Price">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                    <%= p.getPrice() %>
                </td>

                <td data-label="Description">
                    <i class="fa-solid fa-file-lines"></i>
                    <%= p.getDescription() %>
                </td>

                <td data-label="Action">

                    <a class="cart-btn"
                       href="AddToCartServlet?productId=<%= p.getId() %>">

                        <i class="fa-solid fa-cart-plus"></i>
                        Add to Cart

                    </a>

                </td>

            </tr>

            <%
            }
            %>

            </tbody>

        </table>

    </div>

</div>
</body>
</html>