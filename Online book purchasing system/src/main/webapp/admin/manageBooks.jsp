<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Books</title>
    <link rel="stylesheet" href="../css/addNewBook-style.css">
    <style>
        h3 {
            color: green;
            text-align: center;
        }
        table {
            width: 95%;
            margin: auto;
            border-collapse: collapse;
            font-size: 14px;
        }
        th {
            background-color: #333;
            color: white;
            padding: 10px;
            border: 1px solid #ddd;
        }
        td {
            padding: 10px;
            border: 1px solid #ddd;
            color: black;
            background-color: #f4f4f4;
            text-align: center;
        }
        tr:hover td {
            background-color: #e0e0e0;
        }
        .edit-link {
            color: #007bff;
            text-decoration: none;
        }
        .edit-link:hover {
            text-decoration: underline;
        }
        .table-wrapper {
            overflow-x: auto;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div style="color: #333; text-align: center; font-size: 28px; margin: 20px 0;">
    All Books & Edit <i class='fab fa-elementor'></i>
</div>

<%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
%>
    <h3 class="alert">Book Successfully Updated!</h3>
<%
    } else if ("wrong".equals(msg)) {
%>
    <h3 class="alert">Something went wrong! Try again!</h3>
<%
    }
%>

<div class="table-wrapper">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>ISBN</th>
                <th>Category</th>
                <th>Language</th>
                <th>Edition</th>
                <th>Price (CNY)</th>
                <th>Quantity</th>
                <th>Discount (%)</th>
                <th>Sold</th>
                <th>Pages</th>
                <th>Publication Date</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM book");
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getString("publisher") %></td>
                <td><%= rs.getString("isbn") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("language") %></td>
                <td><%= rs.getString("edition") %></td>
                <td><%= rs.getBigDecimal("price") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getBigDecimal("discount") %></td>
                <td><%= rs.getInt("sold_count") %></td>
                <td><%= rs.getInt("page_count") %></td>
                <td><%= rs.getDate("publication_date") %></td>
                <td><a class="edit-link" href="editBook.jsp?id=<%= rs.getInt("book_id") %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='15'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

<br><br><br>
</body>
</html>
