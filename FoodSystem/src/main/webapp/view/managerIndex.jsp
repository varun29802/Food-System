<!DOCTYPE html>
<html lang="en">
      
<%
// Check if user is logged in
jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
if (userSession == null || userSession.getAttribute("manageremail") == null) {
    // User is not logged in, display a message using JavaScript
%>
<head>
    <script>
        window.onload = function() {
            alert("You need to log in first to access this page.");
            window.location.href = "/managerLog";
        };
    </script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%
    } else {
        // User is logged in, serve the page content
        
%>
    <title>Manager Dashboard</title>
    <style>
        /* Header styles */
         .header {
            background-color: #333; /* Background color */
            color: #fff; /* Text color */
            padding: 20px; /* Padding */
            display: flex; /* Use flexbox */
            justify-content: space-between; /* Distribute items evenly */
            align-items: center; /* Center items vertically */
        }

        /* Style for the Log Out button */
        .logout-btn {
            background-color: red; /* Background color */
            color: #fff; /* Text color */
            border: none; /* Remove border */
            padding: 5px 20px; /* Padding */
            border-radius: 5px; /* Add border radius */
            cursor: pointer; /* Add cursor pointer */
            transition: background-color 0.3s; /* Add transition */
        }

        .logout-btn:hover {
            background-color: green; /* Darken background color on hover */
        }

        /* Body styles (optional) */
        body {
            font-family: Arial, sans-serif; /* Font family */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        /* Container for the three divs */
        .row {
            display: flex; /* Use flexbox */
            justify-content: space-between; /* Distribute items evenly */
            margin: 20px; /* Add margin */
        }

        .box {
           height: 320px;
            background-color: #f0f0f0; /* Background color */
            padding: 5px; /* Padding */
            flex: 1; /* Equal width */
            margin-right: 10px; /* Right margin */
            display: flex; /* Use flexbox */
            align-items: center; /* Center vertically */
            justify-content: center; /* Center horizontally */
            flex-direction: column; /* Stack items vertically */
        }

        /* Style for the SVG */
        .svg-icon {
            width: 100px; /* Set width */
            height: auto; /* Maintain aspect ratio */
        }

        /* Style for the span */
        .emoji-icon {
            font-size: 100px; /* Set font size */
        }

        /* Style for the h2 */
        .text-icon {
            font-size: 50px; /* Set font size */
            margin: 0; /* Remove default margin */
        }

        /* Style for the buttons */
        .btn {
            margin-top: 10px; /* Add top margin */
            padding: 5px 20px; /* Add padding */
            background-color: #ee8308ef; /* Background color */
            color: #eef9fd; /* Text color */
            border: none; /* Remove border */
            border-radius: 5px; /* Add border radius */
            cursor: pointer; /* Add cursor pointer */
            transition: background-color 0.3s; /* Add transition */
        }

        .btn:hover {
            background-color: green; /* Darken background color on hover */
        }

        /* Style for the button container */
        .button-container {
            display: flex; /* Use flexbox */
            flex-wrap: wrap; /* Allow wrapping */
            justify-content: center; /* Center horizontally */
        }

        /* Style for the button forms */
        .button-container form {
            margin: 5px; /* Add margin between buttons */
        }
    </style>
</head>
<body>

<div class="header">
    <h1 style="margin-left:400px">Manager Dashboard</h1>
   <form><input type="submit" value="Log Out "  class="logout-btn" formaction="/managerLogOut"></form>
</div>

<!-- Content goes here -->
<div class="row">
    <div class="box">
        <h1>USER</h1>
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="200" fill="currentColor" class="bi bi-person svg-icon" viewBox="0 0 16 16">
            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
        </svg>
        <div class="button-container">
        <form><input type="submit" value="LOGIN DATA" formaction="/customerLoginData" class="btn" style="margin-top: 1cap;"></form>
      <form>
    <input type="text" name="email" placeholder="Enter email" required="required" style="padding: 5px; width: 120px;  border: 1px solid #ccc; border-radius: 3px;">
    <input type="submit" value="DELETE USER" formaction="/delete-user" class="btn" style="background-color: red; color: white; padding: 5px 20px; border: none; border-radius: 5px; cursor: pointer;">
</form>
  
</div>

    </div>
    <div class="box">
        <h1>MANAGE ORDERS</h1>
        <span class="emoji-icon">&#9951;</span>
        <div class="button-container">
            <form><input type="submit" value="ORDERED DATA" formaction="/orderdData" class="btn"></form>
            <form><input type="submit" value="DELIVERED DATA" formaction="/deliveredCustomersData" class="btn"></form>
            <form><input type="submit" value="CANCELLED DATA" formaction="/cancelledCustomersData" class="btn"></form>
        </div>
    </div>
    
    <div class="box">
        <h1>PRODUCT</h1><br><br>
        <h2 class="text-icon">&prod;</h2><br><br>
         
        <div class="button-container"><br>
        
            <form><input type="submit" value="ADD PRODUCT" formaction="/addproduct" class="btn" ></form>
            <form><input type="submit" value="UPDATE PRODUCT" formaction="/upPage" class="btn" ></form>
          <form id="deleteProductForm">
   <input type="text" id="productId" name="pid" placeholder="Enter Product Id" required="required" style="width: 135px; padding: 5px; border: 1px solid #ccc; border-radius: 3px;">
  <button type="button" onclick="confirmDelete()" class="btn" style="background-color: red; color: white; padding: 5px 20px; border: none; border-radius: 5px; cursor: pointer;">DELETE PRODUCT</button>
    
</form>
            
</div>
    </div>
</div>

<script>
    function confirmDelete() {
        var productId = document.getElementById("productId").value;
        if (confirm("Are you sure you want to delete this product?")) {
            deleteProduct(productId);
            window.location.reload();
        }
    }
    

    function deleteProduct(productId) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/deleteProduct?pid=" + encodeURIComponent(productId), true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.message) {
                        alert("Product deleted successfully");
                        window.location.reload();
                    } else if (response.errorMessage) {
                        alert("Error deleting product: " + response.errorMessage);
                    }
                } else {
                    alert("Error: " + xhr.status);
                }
            }
        };
        xhr.send();
    }
</script>


<hr>
<marquee style="color: #da1212;"><strong>NOTE:-If we want to Manage Order, Add Product, Update Product, Delete Product, see Customer Data then this site is useful !!!</strong></marquee>
<%
    }
%>
</body>
</html>
