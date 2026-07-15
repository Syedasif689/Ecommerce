package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ecommerce.util.DBConnection;

public class CartDAO {

    public boolean addToCart(int userId, int productId) {

        try {
            Connection con = DBConnection.getConnection();

            String sql =
                "INSERT INTO cart(user_id, product_id, quantity) VALUES(?,?,1)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public ResultSet getCartItems(int userId) {

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT c.id, p.name, p.price, c.quantity " +
                "FROM cart c JOIN products p " +
                "ON c.product_id = p.id " +
                "WHERE c.user_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}