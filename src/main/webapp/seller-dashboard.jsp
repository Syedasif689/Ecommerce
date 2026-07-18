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
<link rel="stylesheet" href="css/security.css">

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
        <a href="products.jsp" class="view-btn">
        <i class="fa-solid fa-eye"></i>
         Check Your Products in Online store
        </a>

    </div>

</div>
<h2 class="products-title">My Products</h2>

<%
if(products != null && !products.isEmpty()){
%>

<div class="table-wrapper">

<table class="product-table">

<thead>

<tr>

<th>Image</th>
<th>Product</th>
<th>Price</th>
<th>Description</th>
<th>Actions</th>

</tr>

</thead>

<tbody>

<%
for(Product product : products){
%>

<tr>

<td class="image-cell">

<img src="<%=product.getImageUrl()%>"
     alt="Product">

</td>

<td>
<%=product.getName()%>
</td>

<td class="price">
₹<%=product.getPrice()%>
</td>

<td>
<%=product.getDescription()%>
</td>

<td>

<a href="edit-product.jsp?id=<%=product.getId()%>"
   class="edit-btn">

<i class="fa-solid fa-pen"></i>

Edit

</a>

<a href="deleteProduct?id=<%=product.getId()%>"
   class="delete-btn"
   onclick="return confirm('Delete this product?')">

<i class="fa-solid fa-trash"></i>

Delete

</a>

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<%
}else{
%>

<div class="empty-products">

<i class="fa-solid fa-box-open"></i>

<h2>No Products Yet</h2>

<p>Add your first product to start selling.</p>

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