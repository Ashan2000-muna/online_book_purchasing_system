<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
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
            max-width: 500px;
            margin: 50px auto;
            background: #ffffff;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2d3e50;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 6px;
            color: #444;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border 0.3s;
        }

        input[type="password"]:focus {
            border-color: #2d3e50;
            outline: none;
            background-color: #f0fff0;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #2d3e50;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #1a2733;
        }

        .alert {
            text-align: center;
            font-size: 15px;
            margin-bottom: 20px;
            color: #e74c3c;
            font-weight: 500;
        }

        .success {
            color: #27ae60;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-key"></i> Change Password</h2>

    <% String msg = request.getParameter("msg"); %>
    <% if ("notMatch".equals(msg)) { %>
        <div class="alert">New password and Confirm password do not match!</div>
    <% } else if ("wrong".equals(msg)) { %>
        <div class="alert">Your old password is incorrect!</div>
    <% } else if ("done".equals(msg)) { %>
        <div class="alert success">Password changed successfully!</div>
    <% } else if ("invalid".equals(msg)) { %>
        <div class="alert">Something went wrong. Please try again!</div>
    <% } %>

    <form action="changePassowrdAction.jsp" method="post">
        <div class="form-group">
            <label for="oldPassword">Old Password</label>
            <input type="password" id="oldPassword" name="oldPassword" placeholder="Enter old password" required>
        </div>

        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>
        </div>

        <button class="btn-submit" type="submit">
            Save <i class="fas fa-check-circle" style="margin-left: 8px;"></i>
        </button>
    </form>
</div>

</body>
</html>
