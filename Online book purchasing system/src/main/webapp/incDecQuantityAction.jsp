<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
    String email = session.getAttribute("email").toString();
    int book_id = Integer.parseInt(request.getParameter("book_id"));
    String action = request.getParameter("quantity");

    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE email='" + email + "' AND book_id=" + book_id + " AND address IS NULL");

        if (rs.next()) {
            int currentQty = rs.getInt("cart_quantity");
            double price = rs.getDouble("price");

            if ("inc".equals(action)) {
                currentQty++;
            } else if ("dec".equals(action)) {
                currentQty--;
            }

            if (currentQty <= 0) {
                response.sendRedirect("myCart.jsp?msg=notPossible");
            } else {
                double newTotal = price * currentQty;
                st.executeUpdate("UPDATE cart SET cart_quantity=" + currentQty + ", total=" + newTotal + " WHERE email='" + email + "' AND book_id=" + book_id + " AND address IS NULL");

                if ("inc".equals(action)) {
                    response.sendRedirect("myCart.jsp?msg=inc");
                } else {
                    response.sendRedirect("myCart.jsp?msg=dec");
                }
            }
        } else {
            response.sendRedirect("myCart.jsp?msg=notFound");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
