<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    // Keep the search term to display in the input field
    String searchQuery = request.getParameter("search");
    if (searchQuery == null) {
        searchQuery = "";
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Search Results</title>

    <link rel="stylesheet" href="css/search-result.css">
    <link rel="stylesheet" href="css/security.css">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

    <div class="container">

        <div class="header">

            <div>

                <h1>
                    <i class="fa-solid fa-magnifying-glass"></i>
                    Search Results
                </h1>

                <p>
                    Browse products matching your search.
                </p>

            </div>

            <a href="home.jsp" class="back-btn">

                <i class="fa-solid fa-house"></i>

                Home

            </a>

        </div>

        <!-- ========================================================= -->
        <!--     SEARCH BAR (visible even after search, no inline CSS)   -->
        <!-- ========================================================= -->
        <div class="search-bar-container">

            <form action="search" method="get" class="search-form">

                <i class="fa-solid fa-search search-icon"></i>

                <input
                    type="text"
                    name="search"
                    placeholder="Search for products, brands, or categories..."
                    value="<%= searchQuery %>"
                    autofocus
                >

                <button type="submit">
                    <i class="fa-solid fa-arrow-right"></i> Search
                </button>

            </form>

            <% if (!searchQuery.isEmpty()) { %>
            <p class="search-hint">
                <i class="fa-solid fa-magnifying-glass"></i>
                Showing results for: <strong><%= searchQuery %></strong>
            </p>
            <% } %>

        </div>

        <%
        if (products != null && !products.isEmpty()){
        %>

        <div class="products">

            <%
            for(Product product : products){
            %>

            <div class="product-card">

                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">

                <div class="card-content">

                    <h3>
                        <%= product.getName() %>
                    </h3>

                    <div class="price">

                        ₹<%= product.getPrice() %>

                    </div>

                    <p>
                        <%= product.getDescription() %>
                    </p>

                    <a href="products.jsp" class="view-btn">

                        <i class="fa-solid fa-eye"></i>

                        View Product

                    </a>

                </div>

            </div>

            <%
            }
            %>

        </div>

        <%
        } else {
        %>

        <div class="empty-state">

            <i class="fa-solid fa-box-open"></i>

            <h2>No Products Found</h2>

            <p>
                Sorry! We couldn't find any matching products for "<strong><%= searchQuery %></strong>".
            </p>

            <a href="products.jsp">

                Browse All Products

            </a>

        </div>

        <%
        }
        %>

    </div>

</body>
</html>