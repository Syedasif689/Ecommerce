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
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AutoLoginFilter implements Filter {

    @Override
    public void doFilter(jakarta.servlet.ServletRequest request,
                         jakarta.servlet.ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse res =
                (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            Cookie[] cookies = req.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if ("rememberEmail".equals(cookie.getName())) {

                        UserDAO dao = new UserDAO();

                        User user =
                                dao.getUserByEmail(cookie.getValue());

                        if (user != null) {

                            session = req.getSession();

                            session.setAttribute("user", user);
                            session.setAttribute("username",
                                    user.getName());
                        }

                        break;
                    }
                }
            }
        }

        chain.doFilter(request, response);
    }

}