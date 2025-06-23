<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String email = session.getAttribute("email") != null ? session.getAttribute("email").toString() : null;

if (email == null) {
    response.sendRedirect("login.jsp");
    return;
}

String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobileNumber = request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = request.getParameter("transactionId");
String status = "bill";

try {
    Connection con = ConnectionProvider.getCon();

    // Update user profile details
    PreparedStatement psUser = con.prepareStatement(
        "UPDATE users SET address = ?, city = ?, state = ?, country = ?, mobileNumber = ? WHERE email = ?"
    );
    psUser.setString(1, address);
    psUser.setString(2, city);
    psUser.setString(3, state);
    psUser.setString(4, country);
    psUser.setString(5, mobileNumber);
    psUser.setString(6, email);
    psUser.executeUpdate();

    // Update cart items (place the order)
    PreparedStatement psCart = con.prepareStatement(
        "UPDATE cart SET address = ?, city = ?, state = ?, country = ?, mobileNumber = ?, " +
        "orderDate = NOW(), deliveryDate = DATE_ADD(NOW(), INTERVAL 7 DAY), " +
        "paymentMethod = ?, transactionId = ?, status = ? " +
        "WHERE email = ? AND address IS NULL"
    );
    psCart.setString(1, address);
    psCart.setString(2, city);
    psCart.setString(3, state);
    psCart.setString(4, country);
    psCart.setString(5, mobileNumber);
    psCart.setString(6, paymentMethod);
    psCart.setString(7, transactionId != null ? transactionId : "");
    psCart.setString(8, status);
    psCart.setString(9, email);
    psCart.executeUpdate();

    response.sendRedirect("bill.jsp");
} catch (Exception e) {
    e.printStackTrace();  // Better than silent failure
    response.sendRedirect("addressPaymentForOrder.jsp?msg=error");
}
%>
