<!DOCTYPE html>
<%@page import="com.FoodSystem.FoodSystem.Model.FoodProduct"%>
<%@page import="java.util.List"%>

<html lang="en">
 <%
    // Check if user is logged in
    jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
    if (userSession == null || userSession.getAttribute("useremail") == null) {
        // User is not logged in, display a message using JavaScript
%>
<head>
<script>
    window.onload = function() {
        alert("You need to log in first to access this page.");
        window.location.href = "/";
    };
</script>
  
    <%
    } else {
        // User is logged in, serve the page content
        
%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
     href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />

<!-- JavaScript Bundle with Popper -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>Product Details</title>
  
   
    <style>
        /* Your existing styles here */
        
        .grid-container {
            display: grid;
            
            grid-template-columns: repeat(4, 1fr);
            gap: 20px; /* Adjust the gap between images */
        }

        .resume-card {
            /* Remove margin-top and padding */
            border: 1px solid #ccc;
            border-radius: 8px;
            text-align: center; /* Center align content */
        }

        .resume-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .resume-details {
            margin-bottom: 10px;
            color: #666;
        }

        .resume-iframe {
            width: 100%;
            height: 200px; /* Adjust height as needed */
            border: none;
        }

        .add-to-cart-button {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-to-cart-button:hover {
            background-color: #0056b3;
        }

        /* Cart icon */
        .cart-icon {
            position: fixed;
            top: 10px;
            right: 10px;
            z-index: 9999; /* Ensure it's on top of other elements */
        }

        /* Cart details */
       .cart-details {
    position: fixed;
    top: 50px;
    right: 10px;
    padding: 10px;
    background-color: pink;
    border: 1px solid #ccc;
    border-radius: 4px;
    z-index: 9999;
    width: 300px; /* Adjust the width as needed */
    overflow: auto; /* Add this line */
    max-height: 400px; /* Add this line to limit the maximum height */
}


        .cart-details h3 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 20px;
        }

        .cart-details .form-group {
            margin-bottom: 15px;
        }

        .cart-details label {
            font-weight: bold;
        }

        .cart-details input[type="email"],
        .cart-details input[type="text"] {
            width: calc(100% - 20px); /* Adjust the width as needed */
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .cart-details input[type="submit"] {
            width: 100%;
            padding: 8px 0;
            background-color: green;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .cart-details input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .header {
    width: 100%;
    text-align: center;
    margin-top: 10px;
}

.image-container {
    overflow-x: auto;
    white-space: nowrap;
    padding-bottom: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.image-container::-webkit-scrollbar {
    width: 8px;
}

.image-container::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 4px;
}

.header-image {
    width: 100px;
    height: auto;
    margin: 0 30px;
    animation: slideAndRotate 10s linear infinite;
}

.image-wrapper {
    text-align: center;
}

.image-name {
    width: 100px;
    height: auto;
    animation: slideAndRotate 10s linear infinite;
    margin-top: 5px; /* Adjust as needed to create space between image and name */
}

@keyframes slideAndRotate {
    0% {
        transform: translateX(0) rotateY(0deg);
    }
    100% {
        transform: translateX(-100%) rotateY(360deg);
    }
}
        

    </style>
</head>
<body>
 <!-- Header -->
    <nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="header">
         <div class="image-container">
          <div class="image-wrapper">
            <a href="/viewBurger">
    <img src="images/rEyMLsj21Ooxk5mfhdeh7bSevaLGzUtczWXVDj4u.jpeg" alt="Image 1" class="header-image">
     </a>
      <div class="image-name">Burger</div>
     
        </div>
         <div class="image-wrapper">
         <a href="/viewIceCream">
    <img style="height: 130px" src="images/download (1).jpeg" alt="Image 2" class="header-image">
    </a>
     <div class="image-name">IceCream</div>
        </div>
          <div class="image-wrapper">
          <a href="/viewPizza">
    <img src="images/pizzaImage.jpeg" alt="Image 3" class="header-image">
    </a>
    <div class="image-name">Pizza</div>
        </div>
        
      <div class="image-wrapper">
      <a href="/viewMomos">
    <img style="height: 128px" src="images/Momos.jpg" alt="Image 3" class="header-image">
    </a>
    <div class="image-name">Momos</div>
        </div>
      <div class="image-wrapper">
      <a href="/viewBiryaani">
     <img style="height: 130px" src="images/biryaani.jpg" alt="Image 3" class="header-image">
     </a>
     <div class="image-name">Chiken Biryaani</div>
        </div>
       <div class="image-wrapper">
       <a href="/viewCakes">
     <img style="height: 130px" src="images/choco_almond_cake.jpg" alt="Image 3" class="header-image">
     </a>
     <div class="image-name">Cakes</div>
        </div>
        
    <!-- Add more images as needed -->
    </div>
</div>
    </div><!-- /.container-fluid -->
</nav>


 <!-- Cart icon -->
    <div class="cart-icon">
        <p style="margin-top: 5px; margin-right:10px" align="right">
            <button type="button" class="btn btn-default btn-sm" onclick="showCartDetails()">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                <b id="cartItemCount"> Add to Cart </b>
            </button>
        </p>
    </div>

    <!-- Cart details -->
    <div class="cart-details" id="cartDetails" style="display: none;">
        <h3>Cart</h3>
        <div id="cartProducts"></div>
        <p>Final Price: &#8377;<span id="finalPrice">0.00</span></p>

        <!-- Input for email -->
        <div class="form-group">
            <label for="inputEmail">Email:</label>
            <input type="email" class="form-control" id="inputEmail" placeholder="Enter LogIn email Only" required="">
        </div>

        <!-- Input for name -->
        <div class="form-group">
            <label for="inputName">Name:</label>
            <input type="text" class="form-control" id="inputName" placeholder="Enter name" required="">
        </div>
        
         <!-- Input for shipping address -->
<div class="form-group">
    <label for="inputAddress">Shipping Address:</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Enter shipping address" required="">
</div>
<span >Note: enter existing email only if you entered another email your order will<span style="color: red"> pending or cancel</span></span>
        <input type="submit" value="Order" onclick="submitOrder()">

    </div>
   
    

    <div class="container">
    <form action="/searchImages" method="post">
    <h1>
        <span style="color: Red; font-family: cursive; font-size: 35px;">Order Now</span>
        <img src="images/online-order.png" alt="Order Icon" style="vertical-align: middle;height:100px;">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="query" placeholder="Search items" required="required" style="padding: 8px; margin-right: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; width: 350px;">
        <input type="submit" value="Search" style="padding: 8px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; transition: background-color 0.3s;">
    </h1>
</form>


        <!-- Search filter -->
        <!-- Your existing search container -->

        <div class="grid-container">
            <%
            // Your Java code here to retrieve product list
            List<FoodProduct> productList = (List<FoodProduct>)request.getAttribute("indexList");
            if (productList != null && !productList.isEmpty()) {
                for (FoodProduct product : productList) {
                    String productImage = product.getPimagepath(); // Assuming you have a method to get the image path
            %>
                <div class="resume-card">
                    <div class="resume-title">Product</div>
                    <!-- Image -->
                    <img src="<%= productImage %>" class="resume-iframe">
                    <!-- Product details -->
                    <div class="resume-details">
                <span style="color: red;">      <% out.print("Name: " + product.getPname()); %><br></span>
                        <% out.print("Product ID: " + product.getPid()); %>
                        <% out.print("Price:" + product.getPprice()); %><br>
                       
                        <% out.print("Description: " + product.getPdesc()); %><br>
                    </div>
                 <button class="add-to-cart-button" onclick="addToCart('<%= product.getPid() %>', '<%= product.getPname() %>', '<%= product.getPprice() %>')">Add to Cart</button>
                </div>
            <% 
                } 
            } else { 
            %>
            <div>No product information available.</div>
            <% } %>
        </div>
    </div>

    <!-- Your existing script -->
   <script>
    var cartItemCount = 0; // Initialize cart item count
    var finalPrice = 0; // Initialize final price

    function addToCart(productId, productName, productPrice) {
        // Prompt the user to enter the quantity
        var quantity = prompt("Enter quantity for " + productName + ":");

        // Check if quantity is valid
        if (quantity === null || quantity === "" || isNaN(quantity) || parseInt(quantity) <= 0) {
            alert("Please enter a valid quantity.");
            return;
        }

        // Calculate total price
        var totalPrice = parseFloat(productPrice) * parseInt(quantity);

        // Increment cart item count
        cartItemCount++;

        // Update cart item count text
        document.getElementById("cartItemCount").textContent = "Add to Cart (" + cartItemCount + ")";

        // Add logic here to add the product with the given productId and quantity to the cart
        // For demonstration purposes, we'll just display the added product in the cart details
        var name = document.getElementById("inputName").value; // Get the value of the input field for name
        var address = document.getElementById("inputAddress").value; // Get the value of the input field for address

        var productDetails = "Product ID: " + productId + ", Name: " + productName + ", Price: " + productPrice + ", Quantity: " + quantity + ", Total Price: " + totalPrice.toFixed(2) + ", Buyer Name: " + name + ", Shipping Address: " + address;

        // Create cart item element
        var cartItem = document.createElement("div");
        cartItem.textContent = productDetails;

        // Create delete button with styles
        var deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.className = "btn btn-danger btn-sm"; // Bootstrap button styles
        deleteButton.style.marginLeft = "5px"; // Add some margin between the delete button and other content
        deleteButton.onclick = function() {
            deleteCartItem(cartItem, totalPrice);
        };

        // Append delete button to cart item
        cartItem.appendChild(deleteButton);

        // Append cart item to cart products
        document.getElementById("cartProducts").appendChild(cartItem);

        // Update final price
        finalPrice += totalPrice;
        document.getElementById("finalPrice").textContent = finalPrice.toFixed(2);

        // Include productId in orderData
        var orderData = {
            productId: productId,
            productName: productName,
            productPrice: productPrice,
            quantity: quantity,
            totalPrice: totalPrice,
            name: name,
            address: address // Include the shipping address in orderData
        };
    }

    function deleteCartItem(cartItem, totalPrice) {
        // Decrement cart item count
        cartItemCount--;

        // Update cart item count text
        document.getElementById("cartItemCount").textContent = "Add to Cart (" + cartItemCount + ")";

        // Update final price
        finalPrice -= totalPrice;
        document.getElementById("finalPrice").textContent = finalPrice.toFixed(2);

        // Remove cart item from cart products
        cartItem.remove();
    }

    function showCartDetails() {
        var cartDetailsElement = document.getElementById("cartDetails");
        if (cartDetailsElement.style.display === "none") {
            cartDetailsElement.style.display = "block";
        } else {
            cartDetailsElement.style.display = "none";
        }
    }

    function submitOrder() {
    	
        console.log("Submitting order..."); // Add this line for debugging
        var cartItems = document.querySelectorAll("#cartProducts > div");
        var finalPrice = parseFloat(document.getElementById("finalPrice").textContent.trim());
        var email = document.getElementById("inputEmail").value.trim();
        var name = document.getElementById("inputName").value.trim();
        var address = document.getElementById("inputAddress").value.trim(); // Get the shipping address
        var cartProducts = [];

        // Loop through cart items and construct product strings
        cartItems.forEach(function(cartItem) {
            var productDetails = cartItem.textContent.split(", ");
            var productId = productDetails[0].split(": ")[1];
            var productName = productDetails[1].split(": ")[1];
            var productPrice = parseFloat(productDetails[2].split(": ")[1]);
            var quantity = parseInt(productDetails[3].split(": ")[1]);
            var totalPrice = parseFloat(productDetails[4].split(": ")[1]);

            // Construct product string
            var productString = "productId=" + encodeURIComponent(productId) +
                                "&productName=" + encodeURIComponent(productName) +
                                "&productPrice=" + encodeURIComponent(productPrice) +
                                "&quantity=" + encodeURIComponent(quantity) +
                                "&totalPrice=" + encodeURIComponent(totalPrice);

            // Add product string to cartProducts array
            cartProducts.push(productString);
        });

        // Prepare cartProducts string
        var cartProductsString = cartProducts.join("&");

        // Prepare data to send in the request
        var requestData = "finalPrice=" + encodeURIComponent(finalPrice) +
                          "&email=" + encodeURIComponent(email) +
                          "&name=" + encodeURIComponent(name) +
                          "&address=" + encodeURIComponent(address) + // Include the shipping address
                          "&" + cartProductsString;

        // Make a POST request to submit the order
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/submitOrder", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                	
                    console.log("Order submitted successfully");
                    // Show success message
                    window.location.href = "/payment";
                    showSuccessMessage();
                    // Optionally, redirect or perform any other actions
                } else {
                    console.error("Error submitting order:", xhr.responseText);
                }
            }
        };
        xhr.send(requestData);
    }

   

</script>

       

   
    <%
    }
%>
</body>
</html>
