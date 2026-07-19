package com.ecommerce.servlet;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(GoogleLoginServlet.class.getName());

    private static final String CLIENT_ID =
            System.getenv("GOOGLE_CLIENT_ID");

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String credential = request.getParameter("credential");

        if (credential == null || credential.isBlank()) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {

            GoogleIdTokenVerifier verifier =
                    new GoogleIdTokenVerifier.Builder(
                            new NetHttpTransport(),
                            GsonFactory.getDefaultInstance())
                            .setAudience(Collections.singletonList(CLIENT_ID))
                            .build();

            GoogleIdToken idToken = verifier.verify(credential);

            if (idToken == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            GoogleIdToken.Payload payload = idToken.getPayload();

           Boolean emailVerified = payload.getEmailVerified();

if (emailVerified == null || !emailVerified) {
    response.sendRedirect("login.jsp?error=google");
    return;
}

// Extract Google user information
String googleId = payload.getSubject();
String email = payload.getEmail();
String name = (String) payload.get("name");

// Create DAO
UserDAO dao = new UserDAO();

// Check if user already exists
User user = dao.getUserByEmail(email);

if (user == null) {

    // First Google Login

    user = new User();
    user.setName(name);
    user.setEmail(email);
    user.setGoogleId(googleId);
    user.setAuthProvider("GOOGLE");

    boolean status = dao.registerGoogleUser(user);

    if (!status) {
      request.setAttribute("error",
        "Google authentication failed. Please try again.");

        request.getRequestDispatcher("login.jsp")
       .forward(request, response);
        return;
    }

    user = dao.getUserByEmail(email);

} else {

    // Existing account registered using email/password

    if (user.getGoogleId() == null || user.getGoogleId().isBlank()) {

        dao.updateGoogleAccount(
                user.getId(),
                googleId,
                "GOOGLE");

        user.setGoogleId(googleId);
        user.setAuthProvider("GOOGLE");
    }
}

HttpSession session = request.getSession(true);

session.setAttribute("user", user);
session.setAttribute("username", user.getName());

response.sendRedirect("home.jsp");

        } catch (GeneralSecurityException e) {
            LOGGER.log(Level.SEVERE, "Google ID token verification failed", e);
            response.sendRedirect("login.jsp?error=google");
        }
    }
}