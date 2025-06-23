<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String book_id = request.getParameter("book_id");
String title = request.getParameter("title");
String author = request.getParameter("author");
String publisher = request.getParameter("publisher");
String isbn = request.getParameter("isbn");
String category = request.getParameter("category");
String language = request.getParameter("language");
String edition = request.getParameter("edition");
String price = request.getParameter("price");
String quantity = request.getParameter("quantity");
String discount = request.getParameter("discount");
String sold_count = request.getParameter("sold_count");
String description = request.getParameter("description");
String page_count = request.getParameter("page_count");
String publication_date = request.getParameter("publication_date");
String cover_image_url = request.getParameter("cover_image_url");
String preview_pdf_url = request.getParameter("preview_pdf_url");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "UPDATE book SET title=?, author=?, publisher=?, isbn=?, category=?, language=?, edition=?, price=?, quantity=?, discount=?, sold_count=?, description=?, page_count=?, publication_date=?, cover_image_url=?, preview_pdf_url=?, updated_at=NOW() WHERE book_id=?"
    );
    ps.setString(1, title);
    ps.setString(2, author);
    ps.setString(3, publisher);
    ps.setString(4, isbn);
    ps.setString(5, category);
    ps.setString(6, language);
    ps.setString(7, edition);
    ps.setBigDecimal(8, new java.math.BigDecimal(price));
    ps.setInt(9, Integer.parseInt(quantity));
    ps.setBigDecimal(10, new java.math.BigDecimal(discount));
    ps.setInt(11, Integer.parseInt(sold_count));
    ps.setString(12, description);
    ps.setInt(13, Integer.parseInt(page_count));
    ps.setDate(14, java.sql.Date.valueOf(publication_date));
    ps.setString(15, cover_image_url);
    ps.setString(16, preview_pdf_url);
    ps.setInt(17, Integer.parseInt(book_id));

    ps.executeUpdate();

    response.sendRedirect("manageBooks.jsp?msg=done");
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("manageBooks.jsp?msg=wrong");
}
%>
