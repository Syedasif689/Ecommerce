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

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("========== RegisterServlet Called ==========");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Name: " + name);
        System.out.println("Email: " + email);

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        boolean exists = dao.isUserExists(name, email);

        System.out.println("User Exists = " + exists);

        if (exists) {

            request.setAttribute("error",
                    "Username or Email already exists.");

            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
            return;
        }

        boolean status = dao.registerUser(user);

        System.out.println("Register Status = " + status);

        if (status) {
            System.out.println("Redirecting to login.jsp");
            response.sendRedirect("login.jsp");
            return;
        }

        System.out.println("Registration Failed");

        request.setAttribute("error",
                "Registration Failed.");

        request.getRequestDispatcher("register.jsp")
               .forward(request, response);
    }
}
