package com.ecommerce.servlet;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.ecommerce.dao.SellerDAO;
import com.ecommerce.model.Seller;
@WebServlet("/sellerRegister")
public class SellerRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        Seller seller = new Seller();

        seller.setSellerName(request.getParameter("sellerName"));
        seller.setShopName(request.getParameter("shopName"));
        seller.setIndustry(request.getParameter("industry"));
        seller.setEmail(request.getParameter("email"));
        seller.setPassword(request.getParameter("password"));
        seller.setPhone(request.getParameter("phone"));

        SellerDAO dao = new SellerDAO();

        if(dao.registerSeller(seller)) {

            response.sendRedirect("seller-login.jsp");

        } else {

            response.sendRedirect("seller-register.jsp");
        }
    }
}