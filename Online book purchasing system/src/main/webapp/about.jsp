<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %> <!-- Assuming your standard header is here -->
<!DOCTYPE html>
<html>
<head>
    <title>About Us - BookHub</title>
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .about-container {
            max-width: 1000px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        }

        .about-container h1 {
            color: #2d3e50;
            font-size: 36px;
            margin-bottom: 20px;
            text-align: center;
        }

        .about-container p {
            font-size: 18px;
            line-height: 1.8;
            color: #333;
            margin-bottom: 20px;
            text-align: justify;
        }

        .about-container h3 {
            margin-top: 30px;
            color: #ff4081;
        }

        .team-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
        }

        .team-member {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 15px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .team-member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .team-member h4 {
            margin: 5px 0;
            color: #2d3e50;
        }

        .team-member p {
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

<div class="about-container">
    <h1>About BookHub</h1>
    <p>
        BookHub is an online bookstore system dedicated to providing a seamless and joyful reading experience for book lovers everywhere.
        Whether you're into novels, academic books, or rare editions — we’re here to help you find, purchase, and enjoy books with ease.
    </p>
    <p>
        Our system was built with the user in mind — intuitive navigation, a secure shopping experience, and modern features such as order tracking,
        cart management, and secure messaging. We’re always evolving and adding more books, more features, and more joy to your reading journey.
    </p>

    <h3>Our Mission</h3>
    <p>
        To make quality books accessible to everyone through a user-friendly, secure, and efficient online platform.
    </p>

    <h3>Meet the Team</h3>
    <div class="team-section">
        <div class="team-member">
            <img src="images/team1.jpg" alt="Team Member">
            <h4>Jane Doe</h4>
            <p>UI/UX Designer</p>
        </div>
        <div class="team-member">
            <img src="images/team2.jpg" alt="Team Member">
            <h4>John Smith</h4>
            <p>Back-End Developer</p>
        </div>
        <div class="team-member">
            <img src="images/team3.jpg" alt="Team Member">
            <h4>Sarah Lee</h4>
            <p>Front-End Developer</p>
        </div>
    </div>
</div>

</body>
</html>
