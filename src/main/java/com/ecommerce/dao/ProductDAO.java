package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.model.Product;
import com.ecommerce.util.DBConnection;

public class ProductDAO {

    // Get all products
    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products");
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Product product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));

                product.setSellerId(rs.getInt("seller_id"));
                product.setImageUrl(rs.getString("image_url"));

                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    // Get products uploaded by a specific seller
    public List<Product> getProductsBySeller(int sellerId) {

        List<Product> products = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM products WHERE seller_id = ?")
        ) {

            ps.setInt(1, sellerId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Product product = new Product();

                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDescription(rs.getString("description"));

                    product.setSellerId(rs.getInt("seller_id"));
                    product.setImageUrl(rs.getString("image_url"));

                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    // Add a new product by seller
    public boolean addSellerProduct(Product product) {

        boolean status = false;

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO products(name, price, description, seller_id, image_url) VALUES (?, ?, ?, ?, ?)"
            )
        ) {

            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setInt(4, product.getSellerId());
            ps.setString(5, product.getImageUrl());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Delete seller product
    public boolean deleteProduct(int productId) {

        boolean status = false;

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement("DELETE FROM products WHERE id = ?")
        ) {

            ps.setInt(1, productId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get product by ID
    // Get product by ID
public Product getProductById(int productId) {

    Product product = null;

    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement(
                "SELECT * FROM products WHERE id = ?"
            )
    ) {

        ps.setInt(1, productId);

        try(ResultSet rs = ps.executeQuery()) {

            if(rs.next()) {

                product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));

                product.setSellerId(
                    rs.getInt("seller_id")
                );

                product.setImageUrl(
                    rs.getString("image_url")
                );
            }
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return product;
}
 // Search products by name
    public List<Product> searchProducts(String keyword) {

        List<Product> products = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(
                        "SELECT * FROM products WHERE name LIKE ?"
                    )
        ) {

            ps.setString(1, "%" + keyword + "%");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Product product = new Product();

                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDescription(rs.getString("description"));
                    product.setSellerId(rs.getInt("seller_id"));
                    product.setImageUrl(rs.getString("image_url"));

                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    // Update seller product
public boolean updateProduct(Product product) {

    boolean status = false;

    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE products SET name=?, price=?, description=? WHERE id=?"
        )
    ) {

        ps.setString(1, product.getName());
        ps.setDouble(2, product.getPrice());
        ps.setString(3, product.getDescription());
        ps.setInt(4, product.getId());

        int rows = ps.executeUpdate();

        if(rows > 0) {
            status = true;
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return status;
}
}