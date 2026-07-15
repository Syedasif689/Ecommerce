<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addProduct"
      method="post"
      enctype="multipart/form-data">

    <input type="text"
           name="name"
           placeholder="Product Name"
           required>

    <input type="number"
           name="price"
           step="0.01"
           placeholder="Price"
           required>

    <textarea name="description"
              placeholder="Description"
              required></textarea>

    <input type="file"
           name="productImage"
           accept="image/*"
           required>

    <button type="submit">
        Add Product
    </button>

</form>

</body>
</html>