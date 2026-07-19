package com.ecommerce.servlet;

import java.io.IOException;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {


        int id = Integer.parseInt(
                request.getParameter("id")
        );


        ProductDAO dao = new ProductDAO();


        Product product =
                dao.getProductById(id);


        request.setAttribute(
                "product",
                product
        );


        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "/edit-product.jsp"
                );


        rd.forward(request, response);

    }

}