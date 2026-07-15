package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ecommerce.util.DBConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VerifyPaymentServlet")
public class VerifyPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String paymentId =
                request.getParameter("paymentId");

        String razorpayOrderId =
                request.getParameter("orderId");

        String signature =
                request.getParameter("signature");

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "INSERT INTO payments(order_id,user_id,razorpay_order_id,razorpay_payment_id,razorpay_signature,amount,payment_status) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, 0); // temporary order id
            ps.setInt(2, 1); // temporary user id
            ps.setString(3, razorpayOrderId);
            ps.setString(4, paymentId);
            ps.setString(5, signature);
            ps.setDouble(6, 1.0);
            ps.setString(7, "SUCCESS");

            int rows = ps.executeUpdate();

            System.out.println(
                    "Payment inserted: " + rows);

            ps.close();
            con.close();

            response.getWriter().println(
                    "Payment Saved Successfully");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Payment Save Failed");
        }
    }
}