package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ecommerce.model.User;
import com.ecommerce.util.DBConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response)
	        throws IOException{
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        Double total =
            (Double) session.getAttribute("cartTotal");

        if (total == null) {
            total = 0.0;
        }

        try {

            Connection con = DBConnection.getConnection();

            // Create Order
            String customerName =
                    request.getParameter("customerName");

            String address =
                    request.getParameter("address");

            String phone =
                    request.getParameter("phone");

            String paymentMethod =
                    request.getParameter("paymentMethod");

            String orderSql =
            "INSERT INTO orders(user_id,total_amount,customer_name,address,phone,payment_method,payment_status,order_status) VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement orderPs =
                con.prepareStatement(orderSql,
                        PreparedStatement.RETURN_GENERATED_KEYS);

            orderPs.setInt(1, user.getId());
            orderPs.setDouble(2, total);
            orderPs.setString(3, customerName);
            orderPs.setString(4, address);
            orderPs.setString(5, phone);
            orderPs.setString(6, paymentMethod);

            if ("COD".equals(paymentMethod)) {
                orderPs.setString(7, "PENDING");
            } else {
                orderPs.setString(7, "PAID");
            }

            orderPs.setString(8, "PLACED");

            orderPs.executeUpdate();

            ResultSet rs =
                orderPs.getGeneratedKeys();

            int orderId = 0;

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Copy Cart Items to Order Items
            String cartSql =
                "SELECT c.product_id,c.quantity,p.price " +
                "FROM cart c JOIN products p " +
                "ON c.product_id=p.id " +
                "WHERE c.user_id=?";

            PreparedStatement cartPs =
                con.prepareStatement(cartSql);

            cartPs.setInt(1, user.getId());

            ResultSet cartRs =
                cartPs.executeQuery();

            while (cartRs.next()) {

                String itemSql =
                    "INSERT INTO order_items(order_id,product_id,quantity,price) " +
                    "VALUES(?,?,?,?)";

                PreparedStatement itemPs =
                    con.prepareStatement(itemSql);

                itemPs.setInt(1, orderId);
                itemPs.setInt(2,
                        cartRs.getInt("product_id"));
                itemPs.setInt(3,
                        cartRs.getInt("quantity"));
                itemPs.setDouble(4,
                        cartRs.getDouble("price"));

                itemPs.executeUpdate();
            }

            // Clear Cart
            String clearSql =
                "DELETE FROM cart WHERE user_id=?";

            PreparedStatement clearPs =
                con.prepareStatement(clearSql);

            clearPs.setInt(1, user.getId());

            clearPs.executeUpdate();

            response.sendRedirect("orderHistory.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}