package com.ecommerce.servlet;

import java.io.IOException;

import org.json.JSONObject;

import com.ecommerce.util.RazorpayConfig;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/createRazorpayOrder")
public class CreateRazorpayOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
	                      HttpServletResponse response)
	        throws IOException {

        try {

            double total =
                Double.parseDouble(
                    request.getParameter("amount"));

            RazorpayClient client =
                new RazorpayClient(
                    RazorpayConfig.KEY_ID,
                    RazorpayConfig.KEY_SECRET);

            JSONObject orderRequest =
                new JSONObject();

            orderRequest.put(
                "amount",
                (int)(total * 100));

            orderRequest.put(
                "currency",
                "INR");

            Order order =
                client.orders.create(orderRequest);

            response.setContentType(
                "application/json");

            response.getWriter().print(
                order.toString());

        }catch (Exception e) {

            e.printStackTrace();

            response.setStatus(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            response.getWriter().write(
                "{\"error\":\"Unable to create Razorpay order\"}");
        }
    }
}