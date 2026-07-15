package com.ecommerce.dao;

import java.sql.*;
import com.ecommerce.model.Seller;
import com.ecommerce.util.DBConnection;

public class SellerDAO {

    public boolean registerSeller(Seller seller) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "INSERT INTO sellers(seller_name,shop_name,industry,email,password,phone) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, seller.getSellerName());
            ps.setString(2, seller.getShopName());
            ps.setString(3, seller.getIndustry());
            ps.setString(4, seller.getEmail());
            ps.setString(5, seller.getPassword());
            ps.setString(6, seller.getPhone());

            int rows = ps.executeUpdate();

            status = rows > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public Seller loginSeller(String email,String password) {

        Seller seller = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT * FROM sellers WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                seller = new Seller();

                seller.setSellerId(rs.getInt("seller_id"));
                seller.setSellerName(rs.getString("seller_name"));
                seller.setShopName(rs.getString("shop_name"));
                seller.setIndustry(rs.getString("industry"));
                seller.setEmail(rs.getString("email"));
                seller.setPhone(rs.getString("phone"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return seller;
    }
}