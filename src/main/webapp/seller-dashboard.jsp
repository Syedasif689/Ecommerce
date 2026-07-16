<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="com.ecommerce.model.*" %>
<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%
Seller seller =
(Seller) session.getAttribute("seller");

if(seller == null){
    response.sendRedirect("seller-login.jsp");
    return;
}

ProductDAO dao = new ProductDAO();

List<Product> products =
dao.getProductsBySeller(seller.getSellerId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1>Seller Dashboard</h1>

<h3>Welcome,
<%= seller.getSellerName() %>
</h3>

<p>
Shop:
<%= seller.getShopName() %>
</p>

<p>
Industry:
<%= seller.getIndustry() %>
</p>

<a href="add-product.jsp">
Add Product
</a>

&nbsp;&nbsp;

<a href="sellerLogout">
Logout
</a>

<hr>

<h2>My Products</h2>
<table border="1">

<tr>
    <th>ID</th>
    <th>Image</th>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
</tr>

<%
for(Product product : products){
%>

<tr>

<td>
<%= product.getId() %>
</td>

<td>
<img src="<%= product.getImageUrl() %>"
     width="100">
</td>

<td>
<%= product.getName() %>
</td>

<td>
₹<%= product.getPrice() %>
</td>

<td>
<%= product.getDescription() %>
</td>

</tr>

<%
}
%>

</table>

</body>
</html>