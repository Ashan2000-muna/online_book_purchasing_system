<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore</title>
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
		
		.banner-wall {
    	width: 100%;
    	height: auto;
   		max-height: 350px;
    	object-fit: cover;
    	margin-bottom: 20px;
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
    .toast-container {
        position: fixed;
        bottom: 30px;
        right: 30px;
        z-index: 9999;
    }

    .toast {
        background-color: #323232;
        color: #fff;
        padding: 15px 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        font-size: 14px;
        margin-top: 10px;
        opacity: 0;
        transform: translateY(20px);
        animation: slideIn 0.5s forwards, fadeOut 0.5s 4s forwards;
    }

    @keyframes slideIn {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes fadeOut {
        to {
            opacity: 0;
            transform: translateY(20px);
        }
    }

        
    </style>
</head>
<body>

<jsp:include page="header.jsp" />
<img src="images/banner-store.jpg" alt="Bookstore Banner" class="banner-wall">
<div class="container">
    <%
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM book WHERE quantity > 0");

            while(rs.next()) {
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
                CNY <%= String.format("%.2f", discountedPrice) %>
                <% if (discount > 0) { %>
                    <span style="color: green; font-size: 13px;">(<%= discount %>% off)</span>
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
        } catch (Exception e) {
    %>
        <p style="color:red; text-align:center;">Error: <%= e.getMessage() %></p>
    <%
        }
    %>
</div>
	<div class="toast-container" id="toastContainer"></div>

<script>
    function showToast(message, color = "#323232") {
        const toast = document.createElement("div");
        toast.className = "toast";
        toast.style.backgroundColor = color;
        toast.innerText = message;

        document.getElementById("toastContainer").appendChild(toast);

        setTimeout(() => {
            toast.remove();
        }, 5000);
    }

    <% String msg = request.getParameter("msg"); %>
    <% if ("added".equals(msg)) { %>
        showToast("✅ Book successfully added to your cart.", "#2e7d32");
    <% } else if ("exist".equals(msg)) { %>
        showToast("🔄 Book quantity updated in your cart.", "#0288d1");
    <% } else if ("invalid".equals(msg)) { %>
        showToast("❌ Something went wrong. Try again.", "#c62828");
    <% } %>
</script>
	
</body>
</html>
