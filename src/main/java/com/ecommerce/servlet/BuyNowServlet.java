package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BuyNowServlet")
public class BuyNowServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int productId =
                Integer.parseInt(request.getParameter("productId"));

        ProductDAO dao = new ProductDAO();

        Product product = dao.getProductById(productId);

        if(product == null){

            response.sendRedirect("home.jsp");

            return;
        }

        HttpSession session = request.getSession();

        session.setAttribute("buyNowProduct", product);

        session.setAttribute("buyNowTotal", product.getPrice());

        response.sendRedirect("checkout.jsp");
    }
}