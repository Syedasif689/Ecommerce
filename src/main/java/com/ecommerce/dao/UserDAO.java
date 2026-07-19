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

            String sql =
             "SELECT * FROM users WHERE LOWER(email)=LOWER(?) AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email.trim());

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
public boolean isEmailExists(String email) {

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT id FROM users WHERE LOWER(email)=LOWER(?)";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, email.trim());

        ResultSet rs = ps.executeQuery();

        return rs.next();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return false;
}
public boolean isNameExists(String name) {

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT id FROM users WHERE LOWER(name)=LOWER(?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, name.trim());

        ResultSet rs = ps.executeQuery();

        return rs.next();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return false;
}

public User getUserByEmail(String email) {

    User user = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
                "SELECT * FROM users WHERE email=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setString(1, email.trim());


        ResultSet rs = ps.executeQuery();

        if(rs.next()){

            user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));

        }

    } catch(Exception e){

        e.printStackTrace();

    }

    return user;
}
public User getUserByRememberToken(String token) {

    User user = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
            "SELECT * FROM users WHERE remember_token=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, token);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){

            user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRememberToken(rs.getString("remember_token"));
        }

    } catch(Exception e){

        e.printStackTrace();

    }

    return user;
}
public boolean updateRememberToken(int userId, String token) {

    try {

        Connection con = DBConnection.getConnection();

        String sql =
                "UPDATE users SET remember_token=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, token);
        ps.setInt(2, userId);

        return ps.executeUpdate() > 0;

    } catch(Exception e) {

        e.printStackTrace();

    }

    return false;
}
public boolean clearRememberToken(int userId){

    return updateRememberToken(userId, null);

}
}