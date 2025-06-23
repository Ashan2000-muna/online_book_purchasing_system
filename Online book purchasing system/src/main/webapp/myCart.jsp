<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.text.DecimalFormat" %>
<%@include file="header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <style>
        body {
            background-color: #f4f4f4;
            color: #333;
            font-family: 'Poppins', sans-serif;
        }
        
        h1 {
            text-align: center;
            color: #2d3e50;
        }

        .alert {
            text-align: center;
            color: #e91e63;
            font-weight: 500;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 90%;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2d3e50;
            color: white;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            text-decoration: underline;
        }

        .total-row {
            font-weight: bold;
            background-color: white;
        }

        .proceed-btn {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #2ecc71;
            color: white;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
        }

        .proceed-btn:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <br>
    <h1>My Cart <i class="fas fa-cart-arrow-down"></i></h1>
    <%
        String email = session.getAttribute("email").toString();
        String msg = request.getParameter("msg");

        double total = 0;
        int sno = 0;
        DecimalFormat df = new DecimalFormat("#0.00");

        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();

            ResultSet rsTotal = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
            if (rsTotal.next()) {
                total = rsTotal.getDouble(1);
            }

            ResultSet rs = st.executeQuery(
                "SELECT * FROM book INNER JOIN cart ON book.book_id = cart.book_id " +
                "WHERE cart.email='" + email + "' AND cart.address IS NULL"
            );
    %>

    <table>
        <thead>
            <tr>
                <th>Serial Number</th>
                <th>Book Title</th>
                <th>Book Author</th>
                <th>Price (CNY)</th>
                <th>Quantity</th>
                <th>Line Total (CNY)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
                sno++;
        %>
            <tr>
                <td><%= sno %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= df.format(rs.getDouble("price")) %></td>
                <td>
                    <a href="incDecQuantityAction.jsp?book_id=<%= rs.getInt("book_id") %>&quantity=inc"><i class='fas fa-plus-circle'></i></a>
                    <%= rs.getInt("cart_quantity") %>
                    <a href="incDecQuantityAction.jsp?book_id=<%= rs.getInt("book_id") %>&quantity=dec"><i class='fas fa-minus-circle'></i></a>
                </td>
                <td><%= df.format(rs.getDouble("total")) %></td>
                <td><a href="removeFromCart.jsp?book_id=<%= rs.getInt("book_id") %>">Remove</a></td>
            </tr>
        <%
            }
        %>
        </tbody>
        <tfoot>
            <tr class="total-row">
                <td colspan="5">Grand Total</td>
                <td colspan="2">CNY <%= df.format(total) %></td>
            </tr>
        </tfoot>
    </table>

    <%
        if (total > 0) {
    %>
        <div style="text-align:center;">
            <a class="proceed-btn" href="addressPaymentForOrder.jsp">Proceed to Order</a>
        </div>
    <%
        }
    } catch (Exception e) {
        out.println("<div class='alert'>Error: " + e.getMessage() + "</div>");
    }
    %>
</body>
</html>
