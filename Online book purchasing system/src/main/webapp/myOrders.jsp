<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page session="true" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="css/myOrders.css">
</head>
<body>
    <div class="container">
    <br>
        <h1>Orders</h1>

        <div class="search-filter">
            <input type="text" id="searchInput" placeholder="Search by title, category, or status..." onkeyup="filterOrders()">
        </div>

        <table id="ordersTable">
            <thead>
                <tr>
                    <th>Cover</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Price (¥)</th>
                    <th>Quantity</th>
                    <th>Subtotal (¥)</th>
                    <th>Order Date</th>
                    <th>Delivery Date</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                String email = session.getAttribute("email").toString();
                int sno = 0;
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(
                        "SELECT * FROM cart INNER JOIN book ON cart.book_id = book.book_id " +
                        "WHERE cart.email='" + email + "' AND cart.orderDate IS NOT NULL"
                    );
                    while (rs.next()) {
                        sno++;
                        String status = rs.getString("status");
                        String coverUrl = rs.getString("cover_image_url");
                %>
                <tr>
                    <td><img src="<%= coverUrl %>" alt="Cover" class="cover-img"></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("category") %></td>
                    <td><%= rs.getBigDecimal("price") %></td>
                    <td><%= rs.getInt("cart_quantity") %></td>
                    <td><%= rs.getBigDecimal("total") %></td>
                    <td><%= rs.getString("orderDate") %></td>
                    <td><%= rs.getString("deliveryDate") %></td>
                    <td><%= rs.getString("paymentMethod") %></td>
                    <td><%= status %></td>
                    <td>
                        <% if ("Pending".equalsIgnoreCase(status)) { %>
                            <form method="post" action="admin/cancelOrders.jsp">
                                <input type="hidden" name="cart_id" value="<%= rs.getInt("cart_id") %>">
                                <button type="submit" class="cancel-btn">Cancel</button>
                            </form>
                        <% } else { %>
                            <span class="disabled-btn">Not Available</span>
                        <% } %>
                    </td>
                </tr>
                <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>

    <script>
        function filterOrders() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll("#ordersTable tbody tr");
            rows.forEach(row => {
                let text = row.innerText.toLowerCase();
                row.style.display = text.includes(input) ? "" : "none";
            });
        }
    </script>
</body>
</html>
