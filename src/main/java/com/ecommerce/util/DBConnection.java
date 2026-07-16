package com.ecommerce.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = System.getenv("DB_URL");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            return DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}