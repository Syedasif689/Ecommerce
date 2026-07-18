package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

User user = new User();

user.setName(name);
user.setEmail(email);
user.setPassword(password);

UserDAO dao = new UserDAO();

// Check if user already exists
if (dao.isUserExists(name, email)) {

    request.setAttribute("error",
            "Username or Email already exists.");

    request.getRequestDispatcher("register.jsp")
           .forward(request, response);

    return;
}

// Register new user
boolean status = dao.registerUser(user);

if (status) {

    response.sendRedirect("login.jsp");

} else {

    request.setAttribute("error",
            "Registration Failed.");

    request.getRequestDispatcher("register.jsp")
           .forward(request, response);
}
    }
}