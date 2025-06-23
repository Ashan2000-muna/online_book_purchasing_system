<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Address</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
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

        input[type="text"], select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border 0.3s;
        }

        input:focus, select:focus {
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
            font-weight: 500;
        }

        .success {
            color: #27ae60;
        }

        .error {
            color: #e74c3c;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-map-marker-alt"></i> Update Address</h2>

    <% String msg = request.getParameter("msg"); %>
    <% if ("valid".equals(msg)) { %>
        <div class="alert success">Address updated successfully!</div>
    <% } else if ("invalid".equals(msg)) { %>
        <div class="alert error">Something went wrong. Please try again.</div>
    <% } %>

    <form action="addChangeAddressAction.jsp" method="post">
        <div class="form-group">
            <label for="address">Street Address</label>
            <input type="text" id="address" name="address" placeholder="Enter your street address" required>
        </div>

        <div class="form-group">
            <label for="city">City</label>
            <input type="text" id="city" name="city" placeholder="Enter city" required>
        </div>

        <div class="form-group">
            <label for="state">State</label>
            <input type="text" id="state" name="state" placeholder="Enter state" required>
        </div>

        <div class="form-group">
            <label for="country">Country</label>
            <select name="country" id="country" required>
                <option value="">Select Country</option>
                <option value="China">China</option>
                <option value="India">India</option>
                <option value="Sri Lanka">Sri Lanka</option>
                <option value="United States">United States</option>
                <option value="United Kingdom">United Kingdom</option>
            </select>
        </div>

        <button class="btn-submit" type="submit">
            Save Address <i class="fas fa-save" style="margin-left: 8px;"></i>
        </button>
    </form>
</div>

</body>
</html>
