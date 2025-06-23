<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Message Us</title>
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
            max-width: 600px;
            margin: 60px auto;
            background: #ffffff;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            color: #2d3e50;
            font-weight: 600;
            margin-bottom: 20px;
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

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            resize: vertical;
            transition: border 0.3s;
        }

        input:focus,
        textarea:focus {
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
    <h2><i class="fas fa-comment-alt"></i> Message Us</h2>

    <% String msg = request.getParameter("msg"); %>
    <% if ("valid".equals(msg)) { %>
        <div class="alert success">Message successfully sent. Our team will contact you soon!</div>
    <% } else if ("invalid".equals(msg)) { %>
        <div class="alert">Something went wrong! Try again.</div>
    <% } %>

    <form action="messageUsAction.jsp" method="post">
        <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" placeholder="Enter subject" required>
        </div>

        <div class="form-group">
            <label for="body">Your Message</label>
            <textarea id="body" name="body" rows="6" placeholder="Type your message here..." required></textarea>
        </div>

        <button class="btn-submit" type="submit">
            Send <i class="fas fa-paper-plane" style="margin-left: 8px;"></i>
        </button>
    </form>
</div>

</body>
</html>
