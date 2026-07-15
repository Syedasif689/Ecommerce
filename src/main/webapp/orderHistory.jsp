<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.ecommerce.dao.OrderDAO" %>
<%@ page import="com.ecommerce.model.User" %>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
    return;
}

User user = (User)session.getAttribute("user");

OrderDAO dao = new OrderDAO();

ResultSet rs = dao.getOrdersByUser(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
</head>
<body>

<h2>My Orders</h2>

<table border="1">

<tr>
    <th>Order ID</th>
    <th>Total Amount</th>
    <th>Order Date</th>
</tr>

<%
while(rs.next()){
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td>&#8377;<%= rs.getDouble("total_amount") %></td>
    <td><%= rs.getTimestamp("order_date") %></td>
</tr>

<%
}
%>

</table>

<br>

<a href="products.jsp">Continue Shopping</a>

</body>
</html>