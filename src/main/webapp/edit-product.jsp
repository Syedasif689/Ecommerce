<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.ecommerce.model.Product" %>


<%

Product product = 
(Product) request.getAttribute("product");

if(product == null){
    response.sendRedirect("sellerDashboard.jsp");
    return;
}

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/edit-product.css">
<title>Edit Product</title>

</head>


<body>

<div class="edit-container"></div>
<h2>Edit Product</h2>


<form action="UpdateProductServlet" method="post">


<input type="hidden" 
name="id"
value="<%=product.getId()%>">



<label>
Product Name
</label>

<br>

<input type="text"
name="name"
value="<%=product.getName()%>"
required>


<br><br>



<label>
Price
</label>

<br>

<input type="text"
name="price"
value="<%=product.getPrice()%>"
required>


<br><br>



<label>
Description
</label>

<br>

<textarea name="description"
rows="5"
cols="30"><%=product.getDescription()%></textarea>


<br><br>


<button type="submit">
Update Product
</button>


</form>
</div>

</body>

</html>