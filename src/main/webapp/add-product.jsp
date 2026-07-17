<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Product</title>

<link rel="stylesheet" href="css/add-product.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="add-wrapper">

    <!-- Left Section -->

    <div class="image-section">

        <h1>Add New Products</h1>

        <p>
            Upload quality products, reach thousands of customers,
            and grow your online business.
        </p>

        <img src="images/add-product-banner.png"
             alt="Add Product">

        <div class="features">

            <div class="feature">
                <i class="fa-solid fa-box-open"></i>
                <span>Unlimited Products</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-cloud-arrow-up"></i>
                <span>Image Upload</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-chart-line"></i>
                <span>Increase Sales</span>
            </div>

            <div class="feature">
                <i class="fa-solid fa-store"></i>
                <span>Grow Your Store</span>
            </div>

        </div>

    </div>

    <!-- Right Section -->

    <div class="form-card">

        <h2>Add Product</h2>

        <form action="addProduct"
              method="post"
              enctype="multipart/form-data">

            <div class="input-box">

                <i class="fa-solid fa-tag"></i>

                <input
                    type="text"
                    name="name"
                    placeholder="Product Name"
                    required>

            </div>

            <div class="input-box">

                <i class="fa-solid fa-indian-rupee-sign"></i>

                <input
                    type="number"
                    name="price"
                    step="0.01"
                    placeholder="Price"
                    required>

            </div>

            <div class="input-box textarea">

                <i class="fa-solid fa-align-left"></i>

                <textarea
                    name="description"
                    placeholder="Product Description"
                    required></textarea>

            </div>

            <div class="file-box">

                <i class="fa-solid fa-image"></i>

                <input
                    type="file"
                    name="productImage"
                    accept="image/*"
                    required>

            </div>

            <button type="submit">

                <i class="fa-solid fa-plus"></i>

                Add Product

            </button>

        </form>

    </div>

</div>

</body>
</html>