<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
    h3 {
        color: yellow;
        text-align: center;
    }
    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        color: white;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
        text-align: center;
    }
    img {
        height: 100px;
        border-radius: 8px;
        box-shadow: 0 0 5px rgba(0,0,0,0.2);
    }
    .alert {
        font-weight: bold;
    }
</style>
</head>
<body>

<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<%
String msg = request.getParameter("msg");
if ("added".equals(msg)) {
%>
    <h3 class="alert">Product added successfully!</h3>
<% } else if ("exist".equals(msg)) { %>
    <h3 class="alert">Product already exists in your cart! Quantity increased!</h3>
<% } else if ("invalid".equals(msg)) { %>
    <h3 class="alert">Something went wrong! Try again!</h3>
<% } %>

<table>
    <thead>
        <tr>
            <th>Cover</th>
            <th>Title</th>
            <th>Author</th>
            <th><i class="fa fa-inr"></i> Price</th>
            <th>Discount (%)</th>
            <th>Add to Cart</th>
        </tr>
    </thead>
    <tbody>
<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM book WHERE quantity != 0");
    while (rs.next()) {
%>
        <tr>
            <td><img src="<%= rs.getString("cover_image_url") %>" alt="Book Cover"></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getBigDecimal("price") %></td>
            <td><%= rs.getBigDecimal("discount") %></td>
            <td>
                <a href="addToCart.jsp?book_id=<%= rs.getString("book_id") %>">Add to cart <i class='fas fa-cart-plus'></i></a>
            </td>
        </tr>
<%
    }
} catch (Exception e) {
    System.out.println(e);
}
%>
    </tbody>
</table>

<br><br><br>
</body>
</html>
