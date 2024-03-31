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
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
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
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .table-name {
            color: #007bff;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .btn {
            background-color: #007bff;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
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
                <th>Deliver Order</th>
                <th>Cancel Order</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<OrderData> entityList = (List<OrderData>) request.getAttribute("orderDataList");
            if (entityList != null && !entityList.isEmpty()) {
                for (OrderData entity : entityList) {
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
               <td>
    <form id="deliverForm_<%= entity.getId() %>" method="post" action="/deliverOrder">
        <input type="hidden" name="orderId" value="<%= entity.getId() %>">
        <button type="submit" onclick="confirmAction('deliver', <%= entity.getId() %>)" class="btn">Deliver</button>
    </form>
</td>
<td>
    <form id="cancelForm_<%= entity.getId() %>" method="post" action="/cancelOrder">
        <input type="hidden" name="orderId" value="<%= entity.getId() %>">
        <button type="submit" onclick="confirmAction('cancel', <%= entity.getId() %>)" class="btn">Cancel</button>
    </form>
</td>

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

<script>
    function confirmAction(action, orderId) {
        var confirmationMessage;
        if (action === 'deliver') {
            confirmationMessage = "Are you sure you want to deliver this order?";
        } else if (action === 'cancel') {
            confirmationMessage = "Are you sure you want to cancel this order?";
        }

        if (confirm(confirmationMessage)) {
            if (action === 'deliver') {
                document.getElementById("deliverForm_" + orderId).submit();
            } else if (action === 'cancel') {
                document.getElementById("cancelForm_" + orderId).submit();
            }
            // Redirect to the /orderedData action after form submission
            window.location.href = "/orderdData";
        }
    }
</script>


</body>
</html>
