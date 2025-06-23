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
        "INSERT INTO book (book_id, title, author, publisher, isbn, category, language, edition, price, quantity, discount, sold_count, description, page_count, publication_date, cover_image_url, preview_pdf_url) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );

    ps.setInt(1, Integer.parseInt(book_id));
    ps.setString(2, title);
    ps.setString(3, author);
    ps.setString(4, publisher);
    ps.setString(5, isbn);
    ps.setString(6, category);
    ps.setString(7, language);
    ps.setString(8, edition);
    ps.setBigDecimal(9, new java.math.BigDecimal(price));
    ps.setInt(10, quantity != null && !quantity.isEmpty() ? Integer.parseInt(quantity) : 0);
    ps.setBigDecimal(11, discount != null && !discount.isEmpty() ? new java.math.BigDecimal(discount) : new java.math.BigDecimal("0.00"));
    ps.setInt(12, sold_count != null && !sold_count.isEmpty() ? Integer.parseInt(sold_count) : 0);
    ps.setString(13, description);
    ps.setInt(14, page_count != null && !page_count.isEmpty() ? Integer.parseInt(page_count) : 0);
    ps.setDate(15, publication_date != null && !publication_date.isEmpty() ? java.sql.Date.valueOf(publication_date) : null);
    ps.setString(16, cover_image_url);
    ps.setString(17, preview_pdf_url);

    ps.executeUpdate();
    response.sendRedirect("addNewBook.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace();  // helpful for debugging in development
    response.sendRedirect("addNewBook.jsp?msg=wrong");
}
%>
