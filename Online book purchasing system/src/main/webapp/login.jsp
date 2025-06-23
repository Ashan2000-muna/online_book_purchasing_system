<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - BookHub</title>
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
            max-width: 900px;
            width: 95%;
        }

        .image-section {
            flex: 1;
            background: url('images/loginimage.jpg') no-repeat center center;
            background-size: cover;
        }

        .login-section {
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

        input[type=email],
        input[type=password] {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        input[type=email]:focus,
        input[type=password]:focus {
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

        .login-section a {
            display: block;
            margin-top: 12px;
            color: #2d3e50;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }

        .login-section a:hover {
            color: #ff4081;
        }

        .message {
            color: red;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
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

    <div class="login-section">
        <h2>Login to BookHub</h2>
        <form action="loginAction.jsp" method="post">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <div class="submit-container">
                <input type="submit" value="Login">
            </div>
        </form>

        <a href="signup.jsp">Don't have an account? Sign Up</a>
        <a href="forgotPassword.jsp">Forgot Password?</a>

        <% 
        String msg = request.getParameter("msg");
        if ("notexist".equals(msg)) {
        %>
            <div class="message">Your username or password does not exist!</div>
        <% } else if ("invalid".equals(msg)) { %>
            <div class="message">Something went wrong! Try again!</div>
        <% } %>
    </div>
</div>

</body>
</html>
