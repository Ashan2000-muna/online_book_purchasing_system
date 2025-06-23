<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    int cartId = Integer.parseInt(request.getParameter("cart_id"));

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE cart_id=? AND email=? AND status='Pending'");
        ps.setInt(1, cartId);
        ps.setString(2, email);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("myOrders.jsp");
%>
