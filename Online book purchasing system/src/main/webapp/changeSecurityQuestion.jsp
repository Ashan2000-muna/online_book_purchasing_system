<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Change Security Question</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f5f7fa;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 550px;
      margin: 50px auto;
      background: #fff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #2d3e50;
      font-weight: 600;
    }

    h3 {
      margin-top: 20px;
      margin-bottom: 10px;
      color: #333;
      font-size: 16px;
      font-weight: 500;
    }

    select, input[type="text"], input[type="password"] {
      width: 100%;
      padding: 12px 15px;
      font-size: 15px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      transition: 0.3s border;
    }

    select:focus, input:focus {
      border-color: #2d3e50;
      background-color: #f0fff0;
      outline: none;
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
      font-weight: 500;
    }

    .alert.success {
      color: #27ae60;
    }

    .alert.error {
      color: #e74c3c;
    }
  </style>
</head>
<body>

<div class="container">
  <h2><i class="fas fa-shield-alt"></i> Change Security Question</h2>

  <%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
  %>
      <div class="alert success">Your security question was successfully changed!</div>
  <% } else if ("wrong".equals(msg)) { %>
      <div class="alert error">Your password is incorrect!</div>
  <% } %>

  <form action="changeSecurityQestionAction.jsp" method="post">
    <h3>Select Your New Security Question</h3>
    <select name="securityQuestion" required>
      <option value="">-- Choose a question --</option>
      <option value="What was the name of your first school?">What was the name of your first school?</option>
      <option value="What was the make and model of your first car?">What was the make and model of your first car?</option>
      <option value="In what city or town was your first job?">In what city or town was your first job?</option>
      <option value="What is the name of the street you grew up on?">What is the name of the street you grew up on?</option>
      <option value="What is the name of your childhood best friend?">What is the name of your childhood best friend?</option>
      <option value="What was the name of your favorite teacher in school?">What was the name of your favorite teacher in school?</option>
      <option value="What was the name of your first pet?">What was the name of your first pet?</option>
      <option value="What is the title of your favorite novel book?">What is the title of your favorite novel book?</option>
    </select>

    <h3>Enter Your New Answer</h3>
    <input type="text" name="newAnswer" placeholder="Enter your new answer" required>

    <h3>Enter Password (For Security)</h3>
    <input type="password" name="password" placeholder="Enter your password" required>

    <button class="btn-submit" type="submit">
      Save <i class="fas fa-save" style="margin-left: 8px;"></i>
    </button>
  </form>
</div>

</body>
</html>
