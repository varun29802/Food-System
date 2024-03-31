<!DOCTYPE html>
<%@page import="com.FoodSystem.FoodSystem.Model.OrderData"%>
<%@page import="java.util.List"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DataList</title>
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .container {
            width: 95%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd; /* Adding border */
        }

        th,
        td {
            padding: 6px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            border-right: 1px solid #ddd; /* Adding border to table headers */
        }

        .table-name {
            color: #007bff;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .apply-button {
            background-color: #007bff;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .apply-button:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #343a40;
            text-align: center;
            color: #fff;
            margin: 1rem 0 0 0;
            padding: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-name">DataList</div>
        <table>
            <thead>
                <tr>
                    <th>Customer Id</th>
                    <th>Customer Name</th>
                    <th>Customer Email</th>
                    <th>Product Id's</th>
                    <th>Shipping Address</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Final Price</th>
                    <th>Order Status</th>
                   
                </tr>
            </thead>
            <tbody>
                <% 
                List<OrderData> entityList = (List<OrderData>) request.getAttribute("orderDataList");
                if (entityList != null && !entityList.isEmpty()) {
                    for (OrderData entity : entityList) {
                        // Assuming you have a method to get the receipt path
                %>
                <tr>
                    <td><%= entity.getId() %></td>
                    <td><%= entity.getName() %></td>
                    <td><%= entity.getEmail() %></td>
                    <td><%= entity.getProductIds() %></td>
                    <td><%= entity.getShippingaddress() %></td>
                    <td><%= entity.getProductName() %></td>
                    <td><%= entity.getQuantity() %></td>
                    <td><%= entity.getFinalPrice() %></td>
                    <td><%= entity.getOrderStatus() %></td>
                   
                </tr>
                <% 
                    } 
                } else { 
                %>
                <tr>
                    <td colspan="11">No data listings available.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <!-- Footer -->
</body>
</html>
