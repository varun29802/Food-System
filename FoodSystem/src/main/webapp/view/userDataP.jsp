<%@page import="com.FoodSystem.FoodSystem.Model.User"%>
<%
// Check if user is logged in
jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
if (userSession == null || userSession.getAttribute("manageremail") == null) {
    // User is not logged in, display a message using JavaScript
%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <title>User Data</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>User Data</h2>

<table>
    <thead>
        <tr>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>User Name</th>
            <th>Password</th>
        </tr>
    </thead>
    <tbody>
        <% 
        List<User> userList = (List<User>) request.getAttribute("userData");
        if (userList != null && !userList.isEmpty()) {
            for (User user : userList) {
        %>
        <tr>
            <td><%= user.getEmail() %></td>
            <td><%= user.getMobNo() %></td>
            <td><%= user.getUserName() %></td>
            <td><%= user.getPassword() %></td>
        </tr>
        <% 
            } 
        } else { 
        %>
        <tr>
            <td colspan="4">No user data available.</td>
        </tr>
        <% } %>
    </tbody>
</table>
<%
    }
%>
</body>
</html>
