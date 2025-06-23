<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orders Received</title>
    <link rel="stylesheet" href="../css/ordersReceived-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fdfdfd;
            color: #333;
        }

        .page-title {
            color: #2c3e50;
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            margin: 30px 0 10px;
        }

        .alert {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .invalid {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        #customers {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            font-size: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        #customers th, #customers td {
            border: 1px solid #ddd;
            padding: 12px 14px;
            text-align: center;
        }

        #customers th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }

        #customers tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="page-title">Orders Received <i class="fas fa-archive"></i></div>

<%
    String msg = request.getParameter("msg");
    if ("cancel".equals(msg)) {
%>
    <h3 class="alert">Order Cancelled Successfully!</h3>
<%
    } else if ("delivered".equals(msg)) {
%>
    <h3 class="alert">Order Delivered Successfully!</h3>
<%
    } else if ("error".equals(msg)) {
%>
    <h3 class="invalid">Something went wrong! Try Again!</h3>
<%
    }
%>

<table id="customers">
    <tr>
        <th>Mobile Number</th>
        <th>Book ID</th>
        <th>Quantity</th>
        <th>Total (CNY)</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Country</th>
        <th>Order Date</th>
        <th>Expected Delivery</th>
        <th>Payment Method</th>
        <th>Transaction ID</th>
        <th>Status</th>
        <th>Cancel</th>
        <th>Deliver</th>
    </tr>

    <%
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE orderDate IS NOT NULL AND status = 'Pending'");
            while (rs.next()) {
    %>
        <tr>
            <td><%= rs.getString("mobileNumber") %></td>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getInt("cart_quantity") %></td>
            <td>¥ <%= rs.getDouble("total") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("city") %></td>
            <td><%= rs.getString("state") %></td>
            <td><%= rs.getString("country") %></td>
            <td><%= rs.getDate("orderDate") %></td>
            <td><%= rs.getDate("deliveryDate") %></td>
            <td><%= rs.getString("paymentMethod") %></td>
            <td><%= rs.getString("transactionID") %></td>
            <td><%= rs.getString("status") %></td>
            <td><a href="cancelOrdersAction.jsp?id=<%= rs.getInt("cart_id") %>&email=<%= rs.getString("email") %>"><i class='fas fa-window-close'></i> Cancel</a></td>
            <td><a href="deliveredOrdersAction.jsp?id=<%= rs.getInt("cart_id") %>&email=<%= rs.getString("email") %>"><i class='fas fa-dolly'></i> Delivered</a></td>
        </tr>
    <%
            }
        } catch (Exception e) {
    %>
        <tr>
            <td colspan="15" class="invalid">Error: <%= e.getMessage() %></td>
        </tr>
    <%
        }
    %>
</table>

<br><br><br>
</body>
</html>
