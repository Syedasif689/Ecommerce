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
<title>Products</title>
</head>
<body>


<h2>Available Products</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
    <th>Add to Cart</th>
</tr>
<input type="text" placeholder="Search Products">
<%
for(Product p : products){
%>

<tr>
    <td><%= p.getId() %></td>
    <td><%= p.getName() %></td>
    <td>₹<%= p.getPrice() %></td>
    <td><%= p.getDescription() %></td>
    <td>
    <a href="AddToCartServlet?productId=<%= p.getId() %>">
        Add to Cart
    </a>
</td>
</tr>

<%
}
%>

</table>

</body>
</html>