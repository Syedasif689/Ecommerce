package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ecommerce.model.User;
import com.ecommerce.util.DBConnection;

public class UserDAO {

    public boolean registerUser(User user) {

        try {
            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO users(name,email,password) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public User loginUser(String email, String password) {

        User user = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    public boolean isUserExists(String name, String email) {

    boolean exists = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM users WHERE name=? OR email=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, name);
        ps.setString(2, email);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            exists = true;
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return exists;
}
}