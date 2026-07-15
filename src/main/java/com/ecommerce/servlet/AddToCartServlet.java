package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        int productId = Integer.parseInt(
                request.getParameter("productId"));

        CartDAO dao = new CartDAO();

        boolean added = dao.addToCart(user.getId(), productId);

        if (added) {
            response.sendRedirect("cart.jsp");
        } else {
            response.getWriter().println("Failed to add product to cart!");
        }
    }
}