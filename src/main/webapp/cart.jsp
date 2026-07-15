<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.ecommerce.dao.CartDAO" %>
<%@ page import="com.ecommerce.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
    return;
}

User user = (User)session.getAttribute("user");

CartDAO dao = new CartDAO();

ResultSet rs = dao.getCartItems(user.getId());

double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
</head>
<body>

<h2>Shopping Cart</h2>

<table border="1">
<tr>
    <th>Product</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Total</th>
    <th>Action</th>
</tr>

<%
while(rs.next()){

double itemTotal =
rs.getDouble("price") *
rs.getInt("quantity");

total += itemTotal;
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td>&#8377;<%= rs.getDouble("price") %></td>

    <td>
        <a href="DecreaseQuantityServlet?cartId=<%= rs.getInt("id") %>">➖</a>

        <%= rs.getInt("quantity") %>

        <a href="IncreaseQuantityServlet?cartId=<%= rs.getInt("id") %>">➕</a>
    </td>

    <td>&#8377;<%= itemTotal %></td>

    <td>
        <a href="RemoveCartServlet?cartId=<%= rs.getInt("id") %>">
            Remove
        </a>
    </td>
</tr>

<%
}
%>

<tr>
    <td colspan="3"><b>Grand Total</b></td>
    <td><b>&#8377;<%= total %></b></td>
</tr>

</table>

<br>

<a href="products.jsp">Continue Shopping</a>
<%
session.setAttribute("cartTotal", total);
%>
<%
session.setAttribute("cartTotal", total);
%>

<a href="checkout.jsp">Proceed to Checkout</a>
</body>
</html>