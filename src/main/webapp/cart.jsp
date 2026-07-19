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
<link rel="stylesheet" href="css/security.css">
<link rel="stylesheet" href="css/cart.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<tr data-cart-id="<%= rs.getInt("id") %>" data-price="<%= rs.getDouble("price") %>">
    <td><%= rs.getString("name") %></td>
    <td>&#8377;<%= rs.getDouble("price") %></td>

    <td>
        <a href="DecreaseQuantityServlet?cartId=<%= rs.getInt("id") %>">➖</a>

        <span class="quantity-value"><%= rs.getInt("quantity") %></span>

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

<div class="action-group">
    <a href="products.jsp" class="continue-link">Continue Shopping</a>
    <%
    session.setAttribute("cartTotal", total);
    %>
    <a href="CartCheckoutServlet" class="checkout-link">Proceed to Checkout</a>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {

    // ---- Helper: Recalculate Grand Total from the DOM ----
    function updateGrandTotal() {
        let grandTotal = 0;
        document.querySelectorAll('table tbody tr').forEach(row => {
            // Skip the grand total row itself (it doesn't have a remove link)
            if (!row.querySelector('td:last-child a')) return;

            const price = parseFloat(row.dataset.price) || 0;
            const qtySpan = row.querySelector('.quantity-value');
            const qty = parseInt(qtySpan ? qtySpan.textContent : 0) || 0;
            const itemTotal = price * qty;

            // Update the "Total" column for this row
            const totalCell = row.querySelector('td:nth-child(4)');
            if (totalCell) {
                totalCell.textContent = '₹' + itemTotal.toFixed(2);
            }

            grandTotal += itemTotal;
        });

        // Update the Grand Total footer
        const grandTotalCell = document.querySelector('table tbody tr:last-child td:last-child');
        if (grandTotalCell) {
            grandTotalCell.textContent = '₹' + grandTotal.toFixed(2);
        }
    }

    // ---- Handle +/- clicks ----
    function handleQuantityClick(e) {
        e.preventDefault(); // Stop the browser from navigating

        const link = this;
        const row = link.closest('tr');
        const price = parseFloat(row.dataset.price) || 0;
        const qtySpan = row.querySelector('.quantity-value');
        let currentQty = parseInt(qtySpan.textContent) || 0;

        // Determine new quantity (Optimistic!)
        let newQty;
        if (link.textContent.trim() === '➕') {
            newQty = currentQty + 1;
        } else if (link.textContent.trim() === '➖') {
            newQty = currentQty - 1;
            if (newQty < 1) newQty = 1; // Prevent going below 1
        } else {
            return; // Safety guard
        }

        // --- OPTIMISTIC UPDATE: Change the DOM immediately ---
        qtySpan.textContent = newQty;
        updateGrandTotal(); // Recalculate totals instantly

        // --- Send the actual request to the server (in background) ---
        const url = link.href;
        fetch(url)
            .then(response => {
                // If the server fails (e.g., out of stock), it might return an error.
                // We check if the response is ok, else we throw.
                if (!response.ok) throw new Error('Server update failed');
                return response.text();
            })
            .then(html => {
                // Success! Our optimistic update is now confirmed.
                // (We don't need to replace the table because we already updated it.)
                // Optional: Parse the returned HTML to double-check the server's quantity,
                // but for performance, we trust our update.
            })
            .catch(err => {
                // --- REVERT on error ---
                console.warn('Update failed, reverting...', err);
                qtySpan.textContent = currentQty;
                updateGrandTotal();
                alert('Failed to update quantity. Please check your connection and try again.');
            });
    }

    // ---- Bind click events to all +/- buttons ----
    document.querySelectorAll('td:nth-child(3) a').forEach(link => {
        link.addEventListener('click', handleQuantityClick);
    });

});
</script>
</body>
</html>