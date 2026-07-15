package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ecommerce.util.DBConnection;

public class OrderDAO {

    public ResultSet getOrdersByUser(int userId) {

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, userId);

            return ps.executeQuery();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}