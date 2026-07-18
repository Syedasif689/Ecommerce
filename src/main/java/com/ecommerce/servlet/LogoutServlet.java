package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if(session != null){

            User user = (User) session.getAttribute("user");

            if(user != null){

                UserDAO dao = new UserDAO();

                dao.clearRememberToken(user.getId());
            }

            session.invalidate();
        }

        Cookie cookie = new Cookie("rememberToken", "");

        cookie.setMaxAge(0);
        cookie.setPath("/");

        response.addCookie(cookie);

        response.sendRedirect("login.jsp");
    }
}