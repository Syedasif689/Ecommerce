package com.ecommerce.filter;

import java.io.IOException;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AutoLoginFilter implements Filter {

    @Override
    public void doFilter(jakarta.servlet.ServletRequest request,
                         jakarta.servlet.ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;

        String path = req.getRequestURI();

        // Skip static resources and logout
        if (path.endsWith(".css") ||
            path.endsWith(".js") ||
            path.endsWith(".png") ||
            path.endsWith(".jpg") ||
            path.endsWith(".jpeg") ||
            path.endsWith(".gif") ||
            path.endsWith(".ico") ||
            path.endsWith("LogoutServlet")) {

            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            Cookie[] cookies = req.getCookies();

            if (cookies != null) {

                UserDAO dao = new UserDAO();

                for (Cookie cookie : cookies) {

                    if ("rememberToken".equals(cookie.getName())) {

                        User user =
                            dao.getUserByRememberToken(cookie.getValue());

                        if (user != null) {

                            session = req.getSession(true);

                            session.setAttribute("user", user);
                            session.setAttribute("username", user.getName());
                        }

                        break;
                    }
                }
            }
        }

        chain.doFilter(request, response);
    }
}