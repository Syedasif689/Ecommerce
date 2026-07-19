<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.ecommerce.model.Product" %>

<%
Product product = (Product) request.getAttribute("product");

if(product == null){
    response.sendRedirect("seller-dashboard.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Product</title>

<link rel="stylesheet" href="css/edit-product.css">

</head>

<body>

<div class="edit-container">

    <h2>Edit Product</h2>

    <form action="UpdateProductServlet"
          method="post"
          enctype="multipart/form-data">

        <!-- Product ID -->
        <input type="hidden"
               name="id"
               value="<%=product.getId()%>">

        <!-- Old Image URL -->
        <input type="hidden"
               name="oldImage"
               value="<%=product.getImageUrl()%>">

        <!-- Current Image -->
        <label>Current Product Image</label>
        <br><br>

        <img src="<%=product.getImageUrl()%>"
             alt="Product Image"
             width="150"
             height="150">

        <br><br>

        <!-- Upload New Image -->
        <label>Change Product Image</label>
        <br>

        <input type="file"
               name="productImage"
               accept="image/*">

        <br><br>

        <!-- Product Name -->
        <label>Product Name</label>
        <br>

        <input type="text"
               name="name"
               value="<%=product.getName()%>"
               required>

        <br><br>

        <!-- Price -->
        <label>Price</label>
        <br>

        <input type="number"
               name="price"
               step="0.01"
               value="<%=product.getPrice()%>"
               required>

        <br><br>

        <!-- Description -->
        <label>Description</label>
        <br>

        <textarea
            name="description"
            rows="5"
            required><%=product.getDescription()%></textarea>

        <br><br>

        <button type="submit">
            Update Product
        </button>

    </form>

</div>

</body>

</html>