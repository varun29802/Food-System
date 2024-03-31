<%@ page import="com.FoodSystem.FoodSystem.Model.FoodProduct" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <%
    // Check if user is logged in
    jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
    if (userSession == null || userSession.getAttribute("email") == null) {
        // User is not logged in, display a message using JavaScript
%>

<head>
<script>
        window.onload = function() {
            alert("You need to log in first to access this page.");
            window.location.href = "/adminLog";
        };
    </script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details Form</title>
</head>

<body>
<%
    } else {
        // User is logged in, serve the page content
        
%>


<%
    }
%>
</body>
</html>


