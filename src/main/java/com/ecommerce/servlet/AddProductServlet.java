package com.ecommerce.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import com.cloudinary.Cloudinary;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;
import com.ecommerce.model.Seller;
import com.ecommerce.util.CloudinaryUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20
)
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("seller") == null) {
                response.sendRedirect("seller-login.jsp");
                return;
            }

            Seller seller = (Seller) session.getAttribute("seller");

            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");

            Part imagePart = request.getPart("productImage");

            String tempPath = System.getProperty("java.io.tmpdir")
                    + File.separator
                    + imagePart.getSubmittedFileName();

            imagePart.write(tempPath);

            File imageFile = new File(tempPath);
             
            Cloudinary cloudinary = CloudinaryUtil.getCloudinary();

            Map<?, ?> uploadResult =
                    cloudinary.uploader().upload(imageFile, Map.of());

            String imageUrl =
                    uploadResult.get("secure_url").toString();

            Product product = new Product();

            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setSellerId(seller.getSellerId());
            product.setImageUrl(imageUrl);

            ProductDAO dao = new ProductDAO();

            boolean status = dao.addSellerProduct(product);

            imageFile.delete();

            if (status) {
                response.sendRedirect("seller-dashboard.jsp");
            } else {
                response.sendRedirect("add-product.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-product.jsp");
        }
    }
}