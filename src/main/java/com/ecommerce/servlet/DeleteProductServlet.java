package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        ProductDAO dao = new ProductDAO();

        if (dao.deleteProduct(productId)) {
            response.sendRedirect("seller-dashboard.jsp");
        } else {
            response.getWriter().println("Product deletion failed!");
        }
    }
}