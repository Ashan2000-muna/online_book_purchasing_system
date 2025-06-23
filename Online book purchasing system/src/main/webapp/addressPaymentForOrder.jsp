<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Your Order</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <style>
        body {
            background-color: #f4f4f4;
            color: #333;
            font-family: 'Poppins', sans-serif;
        }
		h1 {
            text-align: center;
            color: #2d3e50;
        }
        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2, h3 {
            color: #333;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
        	margin: 20px auto;
            border-collapse: collapse;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 0;
            overflow: hidden;
        }
        table td:nth-child(2), table th:nth-child(2) {
    	width: 30%; /* Book Title */
	}
	table td:nth-child(1),
	table th:nth-child(1),
	table td:nth-child(4),
	table th:nth-child(4),
	table td:nth-child(5),
	table th:nth-child(5) {
    width: 15%; /* S.No, Price, Quantity */
	}
	table td:nth-child(3), table th:nth-child(3) {
    width: 20%; /* Author */
}
	table td:nth-child(6), table th:nth-child(6) {
    width: 15%; /* Subtotal */
}
input:focus, select:focus {
    background-color: white;
    border-color: transparent;
    outline: none;
}
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #2d3e50;
            color: white;
        }

        .form-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .form-group {
            flex: 1 1 45%;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .note {
            color: #e53935;
            font-size: 14px;
        }
        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 20px;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            .form-group {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <a href="myCart.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Cart</a>
    <%
        String email = session.getAttribute("email").toString();
        int total = 0, sno = 0;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rsTotal = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
            if (rsTotal.next()) {
                total = rsTotal.getInt(1);
            }
    %>
    <h1>Cart Summary</h1>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Book Name</th>
                    <th>Book Author</th>
                    <th>Price(CNY)</th>
                    <th>Quantity</th>
                    <th>Subtotal(CNY)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet rs = st.executeQuery("SELECT * FROM book INNER JOIN cart ON book.book_id = cart.book_id WHERE cart.email='" + email + "' AND cart.address IS NULL");
                    while (rs.next()) {
                        sno++;
                %>
                <tr>
                    <td><%= sno %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("author") %></td>
                    <td><%= String.format("%.2f", rs.getDouble("Price")) %></td>
                    <td><%= rs.getInt("Quantity") %></td>
                    <td><%= String.format("%.2f", rs.getDouble("Total")) %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
<h3 style="text-align:right;">Total Amount: <%= String.format("%.2f", (double) total) %> CNY</h3>


<br>
    <form action="addressPaymentForOrderAction.jsp" method="post">
        <h1>Delivery & Payment Details</h1>
        <div class="form-grid">
            <%
                ResultSet rsUser = st.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
                if (rsUser.next()) {
            %>
            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="<%= rsUser.getString("address") %>" required>
            </div>
            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" value="<%= rsUser.getString("city") %>" required>
            </div>
            <div class="form-group">
                <label>State</label>
                <input type="text" name="state" value="<%= rsUser.getString("state") %>" required>
            </div>
            <div class="form-group">
    <label>Country</label>
    <select name="country" class="form-control" required>
        <option value="" disabled selected>Select your country</option>
        <option value="China" <%= "China".equals(rsUser.getString("country")) ? "selected" : "" %>>🇨🇳 China</option>
        <option value="United States" <%= "United States".equals(rsUser.getString("country")) ? "selected" : "" %>>🇺🇸 United States</option>
        <option value="India" <%= "India".equals(rsUser.getString("country")) ? "selected" : "" %>>🇮🇳 India</option>
        <option value="United Kingdom" <%= "United Kingdom".equals(rsUser.getString("country")) ? "selected" : "" %>>🇬🇧 United Kingdom</option>
        <option value="Canada" <%= "Canada".equals(rsUser.getString("country")) ? "selected" : "" %>>🇨🇦 Canada</option>
        <option value="Germany" <%= "Germany".equals(rsUser.getString("country")) ? "selected" : "" %>>🇩🇪 Germany</option>
        <option value="France" <%= "France".equals(rsUser.getString("country")) ? "selected" : "" %>>🇫🇷 France</option>
        <option value="Japan" <%= "Japan".equals(rsUser.getString("country")) ? "selected" : "" %>>🇯🇵 Japan</option>
        <option value="Sri Lanka" <%= "Sri Lanka".equals(rsUser.getString("country")) ? "selected" : "" %>>🇱🇰 Sri Lanka</option>
        <!-- Add more countries if needed -->
    </select>
	</div>
            
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" name="mobileNumber" value="<%= rsUser.getString("mobileNumber") %>" required>
                <p class="note">* This number will also be updated in your profile.</p>
            </div>
            <div class="form-group">
                <label>Payment Method</label>
                <select name="paymentMethod" required>
                    <option value="cash on delivery(COD)">Cash on Delivery (COD)</option>
                    <option value="online payment">Online Payment</option>
                </select>
            </div>
            <div class="form-group">
                <label>Transaction ID (for Online Payment)</label>
                <input type="text" name="transactionId" placeholder="Enter Transaction ID (if applicable)">
                <p class="note">* Leave blank if paying via COD.</p>
            </div>
        </div>
<br>
        <button type="submit" class="btn-submit" allign="centre">Proceed to Checkout <i class="fas fa-arrow-right"></i></button>
        <%
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </form>
</div>
</body>
</html>