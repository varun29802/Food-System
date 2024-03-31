<%@ page import="com.FoodSystem.FoodSystem.Model.FoodProduct" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
// Check if user is logged in
jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
if (userSession == null || userSession.getAttribute("manageremail") == null) {
    // User is not logged in, display a message using JavaScript
%>
<!DOCTYPE html>
<html lang="en">


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
    <title>Product Details Form</title>
    
</head>

<body>


    <div class="container">
        <h2>Product Details Form</h2>
        <form action="/productDetailForm" method="post" enctype="multipart/form-data">

            <label for="pname">Product Name</label>
            <input type="text" id="pname" name="pname" placeholder="Enter Product Name" required>

            <label for="pprice">Product Price</label>
            <input type="number" id="pprice" name="pprice" placeholder="Enter Product Price" required>

            <label for="pdesc">Product Description</label>
            <input type="text" id="pdesc" name="pdesc" placeholder="Enter Product Description" required>

            <label for="pimage">Product Image</label>
            <input type="file" id="pimage" name="pimage" accept="image/*" required>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>

</html>
<%
    }
%>

</body>
</html>


    <style>
        /* CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            background-color: #66cdaa;
            color: #fff;
            transition: opacity 0.3s;
        }

        input[type="submit"]:hover {
            opacity: 0.8;
        }
    </style>
