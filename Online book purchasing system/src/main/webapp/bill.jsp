<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Bill - Online Bookstore</title>
    <link rel="stylesheet" href="css/bill.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            color: #2d3e50;
            margin: 0;
            padding: 20px;
        }

        h3 {
            color: #2d3e50;
            font-weight: 600;
        }

        .bill-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            max-width: 1000px;
            margin: auto;
        }

        .info-grid {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .info-box {
            width: 33.33%;
            padding: 10px;
            box-sizing: border-box;
        }

        .info-box h4 {
            margin: 5px 0;
            font-size: 16px;
            font-weight: 500;
            color: #2d3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 14px;
        }

        table thead {
            background-color: #2d3e50;
            color: #ffffff;
        }

        table th, table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tbody tr:hover {
            background-color: #e3e8ee;
        }

        .total-amount {
            text-align: right;
            font-size: 18px;
            margin-top: 20px;
            font-weight: 600;
            color: #2d3e50;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .button {
            background-color: #2d3e50;
            color: white;
            padding: 12px 24px;
            margin: 5px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        .button:hover {
            background-color: #1f2d3a;
        }
    </style>
</head>
<body>

<div class="bill-container">
<%
String email = session.getAttribute("email").toString();

try {
    int total = 0;
    int sno = 0;
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();

    ResultSet rsTotal = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND status='bill'");
    if (rsTotal.next()) {
        total = rsTotal.getInt(1);
    }

    ResultSet rsInfo = st.executeQuery("SELECT * FROM users INNER JOIN cart ON users.email = cart.email WHERE cart.email='" + email + "' AND cart.status='bill' LIMIT 1");
    if (rsInfo.next()) {
%>

    <h3>Order Summary</h3>
    <hr>
    <div class="info-grid">
        <div class="info-box"><h4>Name: <%= rsInfo.getString("name") %></h4></div>
        <div class="info-box"><h4>Email: <%= email %></h4></div>
        <div class="info-box"><h4>Mobile: <%= rsInfo.getString("mobileNumber") %></h4></div>

        <div class="info-box"><h4>Order Date: <%= rsInfo.getString("orderDate") %></h4></div>
        <div class="info-box"><h4>Payment: <%= rsInfo.getString("paymentMethod") %></h4></div>
        <div class="info-box"><h4>Delivery: <%= rsInfo.getString("deliveryDate") %></h4></div>

        <div class="info-box"><h4>Transaction ID: <%= rsInfo.getString("transactionID") %></h4></div>
        <div class="info-box"><h4>City: <%= rsInfo.getString("city") %></h4></div>
        <div class="info-box"><h4>Address: <%= rsInfo.getString("address") %></h4></div>

        <div class="info-box"><h4>State: <%= rsInfo.getString("state") %></h4></div>
        <div class="info-box"><h4>Country: <%= rsInfo.getString("country") %></h4></div>
    </div>

<%
    }
%>

    <h3>Product Details</h3>
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>Book Title</th>
                <th>Category</th>
                <th>Price (¥)</th>
                <th>Quantity</th>
                <th>Subtotal (¥)</th>
            </tr>
        </thead>
        <tbody>
<%
    ResultSet rsBooks = st.executeQuery("SELECT * FROM cart INNER JOIN book ON cart.book_id = book.book_id WHERE cart.email='" + email + "' AND cart.status='bill'");
    while (rsBooks.next()) {
        sno++;
%>
            <tr>
                <td><%= sno %></td>
                <td><%= rsBooks.getString("title") %></td>
                <td><%= rsBooks.getString("category") %></td>
                <td><%= rsBooks.getString("price") %></td>
                <td><%= rsBooks.getString("cart_quantity") %></td>
                <td><%= rsBooks.getString("total") %></td>
            </tr>
<%
    }
%>
        </tbody>
    </table>

    <div class="total-amount"><strong>Total Amount: ¥<%= total %></strong></div>

    <div class="button-container">
        <a href="home.jsp"><button class="button">Continue Shopping</button></a>
        <button class="button" onclick="window.print();">Print Bill</button>
    </div>

<%
} catch (Exception e) {
    e.printStackTrace();
}
%>
</div>

</body>
</html>
