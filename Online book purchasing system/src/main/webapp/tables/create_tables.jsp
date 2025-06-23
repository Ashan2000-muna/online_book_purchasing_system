<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
	String q2="CREATE TABLE book (book_id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255) NOT NULL, author VARCHAR(255) NOT NULL, publisher VARCHAR(255), isbn VARCHAR(20) UNIQUE, category VARCHAR(100), language VARCHAR(50), edition VARCHAR(50), price DECIMAL(10,2) NOT NULL, quantity INT DEFAULT 0, discount DECIMAL(5,2) DEFAULT 0.00, sold_count INT DEFAULT 0, description TEXT, page_count INT, publication_date DATE, cover_image_url VARCHAR(500), preview_pdf_url VARCHAR(500), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)";
	String q3="CREATE TABLE cart (cart_id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(255) NOT NULL, book_id INT NOT NULL, quantity INT NOT NULL DEFAULT 1, price DECIMAL(10,2) NOT NULL, total DECIMAL(10,2) NOT NULL, address VARCHAR(500) NOT NULL, city VARCHAR(100) NOT NULL, state VARCHAR(100) NOT NULL, country VARCHAR(100) NOT NULL, mobileNumber VARCHAR(20) NOT NULL, orderDate DATE NOT NULL, deliveryDate DATE, paymentMethod VARCHAR(50) NOT NULL, transactionID VARCHAR(100), status VARCHAR(50) DEFAULT 'Pending', CONSTRAINT fk_cart_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE ON UPDATE CASCADE)";
	String q4="CREATE TABLE message(id INT AUTO_INCREMENT PRIMARY KEY,email VARCHAR(100),subject VARCHAR(200),body VARCHAR(1000))";
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.print("Table created");
	con.close();
	}
catch(Exception e)
{
	System.out.print(e);}
%>