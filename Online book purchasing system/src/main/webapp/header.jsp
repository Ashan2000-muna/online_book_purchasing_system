<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background-color: #2d3e50;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar h2 {
            font-weight: 600;
        }

        .nav-links {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            align-items: center;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #ff4081;
        }

        .nav-links i {
            margin-right: 6px;
        }

        .search-container {
            display: flex;
            align-items: center;
            background: white;
            border-radius: 30px;
            padding: 5px 15px;
        }

        .search-container input {
            border: none;
            outline: none;
            padding: 6px
            background: white;
            font-size: 14px;
        }

        .search-container i {
            color: #2d3e50;
            margin-left: 10px;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            .nav-links {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>BookHub</h2>
        <div class="nav-links">
            <a href="home.jsp"><i class="fa fa-home"></i>Home</a>
            <a href="myCart.jsp"><i class="fas fa-cart-arrow-down"></i> My Cart</a>
            <a href="myOrders.jsp"><i class="fab fa-elementor"></i> My Orders</a>
            <a href="changeDetails.jsp"><i class="fa fa-edit"></i> Change Details</a>
            <a href="messageUs.jsp"><i class="fas fa-comment-alt"></i> Message Us</a>
            <a href="about.jsp"><i class="fa fa-address-book"></i> About</a>
            <a href="logout.jsp"><i class="fas fa-share-square"></i> Logout</a>
        </div>
        <div class="search-container">
            <form action="searchHome.jsp" method="get">
                <input type="text" name="search" placeholder="Search books...">
                <button type="submit" style="background: none; border: none;">
                    <i class="fa fa-search"></i>
                </button>
            </form>
        </div>
    </div>
</body>
</html>
