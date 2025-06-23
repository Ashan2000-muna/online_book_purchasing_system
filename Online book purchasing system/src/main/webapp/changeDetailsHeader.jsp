<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
        }

        .topnav {
            background-color: #2d3e50;
            overflow: hidden;
            padding: 15px 30px;
            border-bottom: 4px solid #f39c12;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
        }

        .topnav h2 {
            color: white;
            margin: 5px 15px;
            font-size: 20px;
            font-weight: 500;
        }

        .topnav h2.center-title {
            flex: 1 100%;
            text-align: center;
            margin-bottom: 15px;
        }

        .topnav a {
            color: #ffffff;
            text-decoration: none;
            margin: 5px 15px;
            font-size: 15px;
            transition: color 0.3s;
        }

        .topnav a:hover {
            color: #f39c12;
        }

        .topnav i {
            margin-left: 6px;
        }

        @media (max-width: 768px) {
            .topnav {
                flex-direction: column;
                align-items: flex-start;
            }
            .topnav h2.center-title {
                text-align: left;
            }
        }
    </style>
</head>
<body>

<%
    String email = (String) session.getAttribute("email");
%>

<div class="topnav sticky">
    <h2 class="center-title">Change Details <i class="fa fa-edit"></i></h2>
    
    <h2><a href="home.jsp"><i class="fas fa-arrow-left"></i> Back</a></h2>
    
    <h2><a href="changeDetails.jsp"><i class="fas fa-user"></i> Profile (<%= email %>)</a></h2>
    
    <a href="changePassword.jsp"><i class="fas fa-key"></i> Change Password</a>
    <a href="addChangeAddress.jsp"><i class="fas fa-map-marker-alt"></i> Add or Change Address</a>
    <a href="changeSecurityQuestion.jsp"><i class="fas fa-shield-alt"></i> Change Security Question</a>
    <a href="changeMobileNumber.jsp"><i class="fas fa-phone"></i> Change Mobile Number</a>
</div>

<br>
