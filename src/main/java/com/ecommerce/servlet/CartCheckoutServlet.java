package com.ecommerce.servlet;

import java.io.IOException;
import java.util.List;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartCheckoutServlet")
public class CartCheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null){

            response.sendRedirect("login.jsp");
            return;

        }

        CartDAO dao = new CartDAO();

        List<Product> cartProducts =
                dao.getCartProducts(user.getId());

        // IMPORTANT
        session.removeAttribute("buyNowProduct");
        session.removeAttribute("buyNowTotal");

        session.setAttribute("cartItems", cartProducts);

        response.sendRedirect("checkout.jsp");

    }

}