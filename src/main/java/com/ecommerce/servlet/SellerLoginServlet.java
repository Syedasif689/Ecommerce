package com.ecommerce.servlet;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.ecommerce.dao.SellerDAO;
import com.ecommerce.model.Seller;
@WebServlet("/sellerLogin")
public class SellerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        SellerDAO dao = new SellerDAO();

        Seller seller = dao.loginSeller(email,password);

        if(seller != null) {

            HttpSession session = request.getSession();

            session.setAttribute("seller", seller);

            response.sendRedirect("seller-dashboard.jsp");

        } else {

            response.sendRedirect("seller-login.jsp");
        }
    }
}