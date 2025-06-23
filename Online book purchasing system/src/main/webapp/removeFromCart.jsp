<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
String email = session.getAttribute("email").toString();
String book_id = request.getParameter("book_id");

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    st.executeUpdate("DELETE FROM cart WHERE email='" + email + "' AND book_id='" + book_id + "' AND address IS NULL");
    response.sendRedirect("myCart.jsp?msg=removed");
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
