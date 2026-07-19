package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {


        int id = Integer.parseInt(
                request.getParameter("id")
        );


        String name =
                request.getParameter("name");


        double price =
                Double.parseDouble(
                    request.getParameter("price")
                );


        String description =
                request.getParameter("description");



        Product product = new Product();


        product.setId(id);
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);



        ProductDAO dao = new ProductDAO();


        boolean updated =
                dao.updateProduct(product);



        if(updated){

            response.sendRedirect(
                "seller-dashboard.jsp"
            );

        }
        else{

            response.getWriter()
            .println("Product update failed");

        }

    }

}