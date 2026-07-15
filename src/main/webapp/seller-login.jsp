<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Login</title>
</head>
<body>

<h2>Seller Login</h2>

<form action="sellerLogin" method="post">

    <input type="email"
           name="email"
           placeholder="Email"
           required>

    <br><br>

    <input type="password"
           name="password"
           placeholder="Password"
           required>

    <br><br>

    <button type="submit">
        Login
    </button>

</form>

<p>
New Seller?
<a href="seller-register.jsp">Register Here</a>
</p>

</body>
</html>