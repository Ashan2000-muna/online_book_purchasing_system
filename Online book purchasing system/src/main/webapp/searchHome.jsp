<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Results - Online Bookstore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
    body { background-color: #f9f9f9; color: #333; }

    .container {
        padding: 40px;
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 25px;
    }

    .book-card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 15px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: transform 0.3s;
        display: flex;
        flex-direction: column;
    }

    .book-card:hover { transform: translateY(-5px); }

    .book-card img {
        width: 100%;
        aspect-ratio: 2 / 3;
        object-fit: cover;
    }

    .book-info {
        display: flex;
        flex-direction: column;
        flex-grow: 1;
        padding: 15px;
    }

    .book-info h3 {
        font-size: 18px;
        margin-bottom: 8px;
    }

    .book-info p {
        font-size: 13px;
        margin-bottom: 6px;
    }

    .price {
        font-size: 16px;
        color: #e91e63;
        font-weight: bold;
        margin-top: auto;
    }

    .book-info form {
        margin-top: 12px;
    }

    .book-info button {
        width: 100%;
        padding: 10px;
        background-color: #2d3e50;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .book-info button:hover {
        background-color: #1b2836;
    }

    .no-results {
        grid-column: 1 / -1;
        text-align: center;
        font-size: 18px;
        color: #999;
    }
	</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container">
<%
    String search = request.getParameter("search");

    if (search != null && !search.trim().isEmpty()) {
        boolean found = false;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM book WHERE quantity > 0 AND (" +
                "LOWER(title) LIKE ? OR LOWER(author) LIKE ? OR LOWER(publisher) LIKE ? OR " +
                "LOWER(category) LIKE ? OR LOWER(language) LIKE ? OR LOWER(edition) LIKE ?)"
            );

            String keyword = "%" + search.toLowerCase().trim() + "%";
            for (int i = 1; i <= 6; i++) {
                pst.setString(i, keyword);
            }

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                found = true;

                String title = rs.getString("title");
                String author = rs.getString("author");
                String category = rs.getString("category");
                String description = rs.getString("description");
                String image = rs.getString("cover_image_url");
                double price = rs.getDouble("price");
                int discount = rs.getInt("discount");
                int book_id = rs.getInt("book_id");

                double discountedPrice = price - (price * discount / 100.0);
%>
    <div class="book-card">
        <img src="<%= image %>" alt="<%= title %>">
        <div class="book-info">
            <h3><%= title %></h3>
            <p><strong>Author:</strong> <%= author %></p>
            <p><strong>Genre:</strong> <%= category %></p>
            <p><strong>Description:</strong> <%= description %></p>
            <p class="price">
                Rs. <%= String.format("%.2f", discountedPrice) %>
                <% if (discount > 0) { %>
                    <span style="color: green; font-size: 14px;">(<%= discount %>% off)</span>
                <% } %>
            </p>
            <form action="addToCartAction.jsp" method="get">
                <input type="hidden" name="book_id" value="<%= book_id %>">
                <button type="submit"><i class="fas fa-cart-plus"></i> Add to Cart</button>
            </form>
        </div>
    </div>
<%
            }

            if (!found) {
%>
    <div class="no-results" align="center">No matching books found for "<%= search %>"</div>
<%
            }

        } catch (Exception e) {
%>
    <div class="no-results" align="center" style="color: red;">Error: <%= e.getMessage() %></div>
<%
        }

    } else {
%>
    <div class="no-results" align="center">Please enter a search term.</div>
<%
    }
%>
</div>

</body>
</html>
