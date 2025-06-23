<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
    // Validate session
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp?msg=not_logged_in");
        return;
    }

    String email = session.getAttribute("email").toString();
    String book_id = request.getParameter("book_id");
    int quantity = 1;
    double price = 0;
    double total = 0;
    boolean itemExists = false;

    try {
        Connection con = ConnectionProvider.getCon();

        // Fetch book price
        PreparedStatement psBook = con.prepareStatement("SELECT price FROM book WHERE book_id = ?");
        psBook.setInt(1, Integer.parseInt(book_id));
        ResultSet rsBook = psBook.executeQuery();
        if (rsBook.next()) {
            price = rsBook.getDouble("price");
            total = price;
        } else {
            response.sendRedirect("home.jsp?msg=book_not_found");
            return;
        }

        // Check if the book is already in cart (with no address = not ordered)
        PreparedStatement psCheck = con.prepareStatement(
            "SELECT * FROM cart WHERE book_id = ? AND email = ? AND address IS NULL"
        );
        psCheck.setInt(1, Integer.parseInt(book_id));
        psCheck.setString(2, email);
        ResultSet rsCheck = psCheck.executeQuery();

        if (rsCheck.next()) {
            // Book already in cart: update quantity and total
            quantity = rsCheck.getInt("cart_quantity") + 1;
            total = price * quantity;

            PreparedStatement psUpdate = con.prepareStatement(
                "UPDATE cart SET cart_quantity = ?, total = ? WHERE book_id = ? AND email = ? AND address IS NULL"
            );
            psUpdate.setInt(1, quantity);
            psUpdate.setDouble(2, total);
            psUpdate.setInt(3, Integer.parseInt(book_id));
            psUpdate.setString(4, email);
            psUpdate.executeUpdate();

            response.sendRedirect("home.jsp?msg=exist");
        } else {
            // Insert new cart item
            PreparedStatement psInsert = con.prepareStatement(
                "INSERT INTO cart(email, book_id, cart_quantity, price, total, address, city, state, country, mobileNumber, orderDate, paymentMethod, status) VALUES (?, ?, ?, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending')"
            );
            psInsert.setString(1, email);
            psInsert.setInt(2, Integer.parseInt(book_id));
            psInsert.setInt(3, quantity);
            psInsert.setDouble(4, price);
            psInsert.setDouble(5, total);
            psInsert.executeUpdate();

            response.sendRedirect("home.jsp?msg=added");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("home.jsp?msg=invalid");
    }
%>
