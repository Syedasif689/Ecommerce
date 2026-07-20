package com.ecommerce.servlet;

import java.io.IOException;
import java.util.List;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        ProductDAO dao = new ProductDAO();

        List<Product> products = dao.searchProducts(keyword);

        request.setAttribute("products", products);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("search-result.jsp")
               .forward(request, response);
    }

}