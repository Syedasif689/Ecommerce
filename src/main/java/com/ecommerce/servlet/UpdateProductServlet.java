package com.ecommerce.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import com.cloudinary.Cloudinary;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;
import com.ecommerce.util.CloudinaryUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws IOException, ServletException {

    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    double price = Double.parseDouble(request.getParameter("price"));
    String description = request.getParameter("description");

    // Keep old image if no new image is selected
    String imageUrl = request.getParameter("oldImage");

    Part imagePart = request.getPart("productImage");

    if (imagePart != null && imagePart.getSize() > 0) {

        String tempPath = System.getProperty("java.io.tmpdir")
                + File.separator
                + imagePart.getSubmittedFileName();

        imagePart.write(tempPath);

        File imageFile = new File(tempPath);

        Cloudinary cloudinary = CloudinaryUtil.getCloudinary();

        try {

            Map<?, ?> uploadResult =
                    cloudinary.uploader().upload(imageFile, Map.of());

            imageUrl = uploadResult.get("secure_url").toString();

        } catch (Exception e) {
            e.printStackTrace();
        }

        imageFile.delete();
    }

    Product product = new Product();

    product.setId(id);
    product.setName(name);
    product.setPrice(price);
    product.setDescription(description);
    product.setImageUrl(imageUrl);

    ProductDAO dao = new ProductDAO();

    boolean updated = dao.updateProduct(product);

    if (updated) {
        response.sendRedirect("seller-dashboard.jsp");
    } else {
        response.getWriter().println("Product update failed");
    }
}

}