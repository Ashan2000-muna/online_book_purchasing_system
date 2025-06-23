<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
String email = (String) session.getAttribute("email");
String newStatus = "processing";

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "UPDATE cart SET status = ? WHERE email = ? AND status = 'bill'"
    );
    ps.setString(1, newStatus);
    ps.setString(2, email);
    ps.executeUpdate();
    con.close();
    response.sendRedirect("home.jsp");
} catch (Exception e) {
    e.printStackTrace(); // for debugging during development
}
%>
