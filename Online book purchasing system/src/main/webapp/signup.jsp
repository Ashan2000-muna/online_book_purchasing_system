<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Signup - BookHub</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f2f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            background-color: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            overflow: hidden;
            max-width: 1000px;
            width: 95%;
        }

        .image-section {
            flex: 1;
            background: url('images/team3.jpg') no-repeat center center;
            background-size: cover;
        }

        .form-section {
            flex: 1;
            padding: 40px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h2 {
            margin-bottom: 30px;
            font-weight: 600;
            color: #2d3e50;
            text-align: center;
        }

        input[type=text],
        input[type=email],
        input[type=number],
        input[type=password],
        select {
            width: 100%;
            padding: 14px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #ff4081;
            background-color: #f9f9f9;
        }

        .submit-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        input[type=submit] {
            width: 50%;
            padding: 14px;
            background-color: #2d3e50;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type=submit]:hover {
            background-color: #ff4081;
        }

        .form-section a {
            display: block;
            margin-top: 12px;
            color: #2d3e50;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }

        .form-section a:hover {
            color: #ff4081;
        }

        .message {
            color: red;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
        }

        .success {
            color: green;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .image-section {
                display: none;
            }

            input[type=submit] {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="image-section"></div>

    <div class="form-section">
        <h2>Sign Up for BookHub</h2>
        <form action="signupAction.jsp" method="post">
            <input type="text" name="name" placeholder="Enter your name" required>
            <input type="email" name="email" placeholder="Enter your email address" required>
            <input type="number" name="mobileNumber" placeholder="Enter your mobile number" required>
            <select name="securityQuestion" required>
                <option value="" disabled selected>Select a security question</option>
                <option value="What was the name of your first school?">What was the name of your first school?</option>
                <option value="What was the make and model of your first car?">What was the make and model of your first car?</option>
                <option value="In what city or town was your first job?">In what city or town was your first job?</option>
                <option value="What is the name of the street you grew up on?">What is the name of the street you grew up on?</option>
                <option value="What is the name of your childhood best friend?">What is the name of your childhood best friend?</option>
                <option value="What was the name of your favorite teacher in school?">What was the name of your favorite teacher in school?</option>
                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                <option value="What is the title of your favorite novel book?">What is the title of your favorite novel book?</option>
            </select>
            <input type="text" name="answer" placeholder="Enter your answer" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <div class="submit-container">
                <input type="submit" value="Sign Up">
            </div>
        </form>

        <a href="login.jsp">Already have an account? Login</a>

        <%
        String msg = request.getParameter("msg");
        if ("valid".equals(msg)) {
        %>
            <div class="message success">Successfully Registered!</div>
        <% } else if ("invalid".equals(msg)) { %>
            <div class="message">Something went wrong! Try again!</div>
        <% } %>
    </div>
</div>

</body>
</html>
