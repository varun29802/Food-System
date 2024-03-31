<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            color: #4caf50;
            font-weight: bold;
        }
        .error-message {
            color: #f44336;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Product</h2>
        <form action="/update-product" method="post">
            <label for="pid">ID:</label>
            <input type="text" id="pid" name="pid" required="required"><br>
            <label for="pname">Name:</label>
            <input type="text" id="pname" name="pname" required="required"><br>
            <label for="pprice">Price:</label>
            <input type="text" id="pprice" name="pprice" required="required"><br>
            <label for="pdesc">Description:</label>
            <input type="text" id="pdesc" name="pdesc" required="required"><br>
            <input type="submit" value="Update">
        </form>
        
        <%-- Display success or error messages --%>
        <div class="message">
            <c:if test="${not empty message}">
                ${message}
            </c:if>
        </div>
        <div class="error-message">
            <c:if test="${not empty errorMessage}">
                ${errorMessage}
            </c:if>
        </div>
    </div>
</body>
</html>
