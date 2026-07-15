package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ecommerce.util.DBConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DecreaseQuantityServlet")
public class DecreaseQuantityServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int cartId =
            Integer.parseInt(request.getParameter("cartId"));

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
             "UPDATE cart SET quantity=quantity-1 " +
             "WHERE id=? AND quantity>1";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, cartId);

            ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("cart.jsp");
    }
}