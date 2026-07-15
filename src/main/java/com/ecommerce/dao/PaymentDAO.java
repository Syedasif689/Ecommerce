package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ecommerce.util.DBConnection;

public class PaymentDAO {

    public boolean savePayment(
            int userId,
            int orderId,
            String razorpayOrderId,
            String paymentId,
            String signature,
            double amount) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "INSERT INTO payments(order_id,user_id,razorpay_order_id,razorpay_payment_id,razorpay_signature,amount,payment_status) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, orderId);
            ps.setInt(2, userId);
            ps.setString(3, razorpayOrderId);
            ps.setString(4, paymentId);
            ps.setString(5, signature);
            ps.setDouble(6, amount);
            ps.setString(7, "PAID");

            int rows = ps.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}