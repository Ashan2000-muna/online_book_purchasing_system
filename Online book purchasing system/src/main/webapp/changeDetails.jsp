<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change Details</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background: #ffffff;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            font-weight: 600;
            margin-bottom: 25px;
            color: #2d3e50;
            text-align: center;
        }

        .info-row {
            margin-bottom: 25px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
        }

        .info-label {
            font-weight: 500;
            color: #444;
            margin-bottom: 5px;
        }

        .info-value {
            font-size: 16px;
            color: #2d3e50;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Account Details</h2>

    <%
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
        while (rs.next()) {
    %>
        <div class="info-row">
            <div class="info-label">Name:</div>
            <div class="info-value"><%= rs.getString(1) %></div>
        </div>
        <div class="info-row">
            <div class="info-label">Email:</div>
            <div class="info-value"><%= rs.getString(2) %></div>
        </div>
        <div class="info-row">
            <div class="info-label">Mobile Number:</div>
            <div class="info-value"><%= rs.getString(3) %></div>
        </div>
        <div class="info-row">
            <div class="info-label">Security Question:</div>
            <div class="info-value"><%= rs.getString(4) %></div>
        </div>
    <%
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    %>
</div>

</body>
</html>
