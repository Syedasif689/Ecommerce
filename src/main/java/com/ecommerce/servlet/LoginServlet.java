package com.ecommerce.servlet;

import java.io.IOException;
import java.util.UUID;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(email, password);

       if (user != null) {

    HttpSession session = request.getSession();

    session.setAttribute("user", user);
    session.setAttribute("username", user.getName());

   String remember = request.getParameter("rememberMe");

if(remember != null){

    String token = UUID.randomUUID().toString();

    dao.updateRememberToken(user.getId(), token);

    Cookie cookie = new Cookie("rememberToken", token);

    cookie.setMaxAge(60 * 60 * 24 * 30);

    cookie.setPath("/");

    response.addCookie(cookie);
}

    response.sendRedirect("home.jsp");

}
else {

    response.getWriter().println("Invalid Email or Password");

}
        
    }
}