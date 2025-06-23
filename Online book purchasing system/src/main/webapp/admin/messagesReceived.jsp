<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Messages Received</title>
    <link rel="stylesheet" href="../css/addNewBook-style.css">
    <style>
        .back {
            color: #333;
            margin-left: 2.5%;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-weight: 600;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
            background-color: #fff;
        }

        thead {
            background-color: transparent;
        }

        th {
            color: #333;
            font-weight: bold;
            border-bottom: 2px solid #ccc;
            padding: 14px 16px;
            text-align: left;
        }

        td {
            padding: 12px 16px;
            border-bottom: 1px solid #eee;
            color: #555;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .no-data {
            text-align: center;
            color: #999;
            padding: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<h2><a class="back" href="adminHome.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>

<div class="container">
    <h2><i class="fas fa-comment-dots"></i> Messages Received</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Subject</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody>
        <%
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM message");
            boolean hasData = false;
            while (rs.next()) {
                hasData = true;
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("body") %></td>
            </tr>
        <%
            }
            if (!hasData) {
        %>
            <tr>
                <td colspan="4" class="no-data">No messages found.</td>
            </tr>
        <%
            }
        } catch (Exception e) {
        %>
            <tr>
                <td colspan="4" class="no-data">Error loading messages: <%= e.getMessage() %></td>
            </tr>
        <%
        }
        %>
        </tbody>
    </table>
</div>

<br><br><br>
</body>
</html>
