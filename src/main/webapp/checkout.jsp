<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.util.List" %>

<%
Product product =
(Product)session.getAttribute("buyNowProduct");

List<Product> cartProducts =
(List<Product>)session.getAttribute("cartItems");

// TOTAL CALCULATION
double total = 0;

if(product != null){
    total = product.getPrice();
}
else if(cartProducts != null){
    for(Product p : cartProducts){
        total += p.getPrice();
    }
}

if(product == null && cartProducts == null){
    response.sendRedirect("home.jsp");
    return;
}

%>
<%
String productIds = "";

if(product != null){
    productIds = String.valueOf(product.getId());
}
else if(cartProducts != null){
    for(Product p : cartProducts){

        if(!productIds.isEmpty()){
            productIds += ",";
        }

        productIds += p.getId();
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet" href="css/checkout.css">
</head>
<body>

<h2>Order Summary</h2>

<h3>Total Amount: ₹<%= total %></h3>


<%

if(product != null){

%>


<div class="checkout-product">

    <img src="<%= product.getImageUrl() %>">

    <div>

        <h2><%= product.getName() %></h2>

        <p>
            <%= product.getDescription() %>
        </p>


        <h3>
            ₹<%= product.getPrice() %>
        </h3>


    </div>

</div>


<%

}

else if(cartProducts != null){

    for(Product p : cartProducts){

%>


<div class="checkout-product">

    <img src="<%=p.getImageUrl()%>">

    <div>

        <h2>
            <%=p.getName()%>
        </h2>


        <p>
            <%=p.getDescription()%>
        </p>


        <h3>
            ₹<%=p.getPrice()%>
        </h3>


    </div>

</div>


<%

    }

}

%>
<form action="PlaceOrderServlet" method="post">
   <%
if(product != null){
%>

<input type="hidden"
name="productId"
value="<%=product.getId()%>">

<%
}
else if(cartProducts != null){

    for(Product p : cartProducts){
%>

<input type="hidden"
name="productId"
value="<%=p.getId()%>">

<%
    }

}
%>

    <label>Full Name</label><br>
    <input type="text"
           name="customerName"
           required>

    <br><br>

    <label>Address</label><br>
    <textarea name="address"
              required></textarea>

    <br><br>

    <label>Phone Number</label><br>
    <input type="text"
           name="phone"
           required>

    <br><br>

    <h3>Select Payment Method</h3>

    <input type="radio"
           name="paymentMethod"
           value="COD"
           checked>
    Cash On Delivery

    <br><br>

    <input type="radio"
           name="paymentMethod"
           value="ONLINE">
    Online Payment

    <br><br>

    <button type="submit">
    Place COD Order
</button>

<button type="button"
        onclick="payNow()">
    Pay Online
</button>

</form>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
const totalAmount = parseFloat('<%= total %>') || 0.0;

function payNow() {

    const name =
        document.querySelector(
        'input[name="customerName"]').value;

    const address =
        document.querySelector(
        'textarea[name="address"]').value;

    const phone =
        document.querySelector(
        'input[name="phone"]').value;

    if(!name || !address || !phone){
        alert("Please fill all details first.");
        return;
    }

    fetch("createRazorpayOrder", {
        method: "POST",
        headers: {
            "Content-Type":
            "application/x-www-form-urlencoded"
        },
        body: "amount=" + totalAmount
    })
    .then(response => response.json())
    .then(order => {

    	var options = {

    		    key: "rzp_test_T9Ub23vOjXebYi",

    		    amount: order.amount,

    		    currency: "INR",

    		    order_id: order.id,

    		    name: "ECommerce Store",

    		    description: "Order Payment",

    		    modal: {
    		        ondismiss: function () {
    		            alert("Payment cancelled.");
    		        }
    		    },

    		    handler: function(response) {

    		        const form = document.createElement("form");

    		        form.method = "POST";
    		        form.action = "VerifyPaymentServlet";

    		        form.innerHTML =
                        
    		            '<input type="hidden" name="paymentId" value="' +
    		            response.razorpay_payment_id + '">' +

    		            '<input type="hidden" name="orderId" value="' +
    		            response.razorpay_order_id + '">' +

    		            '<input type="hidden" name="signature" value="' +
    		            response.razorpay_signature + '">' +

    		            '<input type="hidden" name="customerName" value="' +
    		            name + '">' +

    		            '<input type="hidden" name="address" value="' +
    		            address + '">' +

    		           '<input type="hidden" name="phone" value="' +
                        phone + '">' +

                      '<input type="hidden" name="productId" value="<%=productIds%>">'; 
   		               document.body.appendChild(form);
    		        form.submit();
    		    }
    		};
        var rzp = new Razorpay(options);

        rzp.open();
    });
}
document.querySelector("form")
.addEventListener("submit", function(e){

    const online =
        document.querySelector(
            'input[value="ONLINE"]');

    if(online.checked){
        e.preventDefault();
        payNow();
    }
});
</script>
<script>
console.log("Razorpay Loaded:", typeof Razorpay);
</script>
</body>
</html>