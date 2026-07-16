<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Double total = (Double) session.getAttribute("cartTotal");

if(total == null){
    total = 0.0;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
</head>
<body>

<h2>Order Summary</h2>

<h3>Total Amount: ₹<%= total %></h3>

<form action="PlaceOrderServlet" method="post">

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
    		            phone + '">';

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