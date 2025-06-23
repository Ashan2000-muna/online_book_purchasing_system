<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Book</title>
    <link rel="stylesheet" href="../css/addNewBook-style.css">
</head>
<body>
<% String msg = request.getParameter("msg"); %>
<% if("done".equals(msg)) { %>
    <h3 class="alert success">Product Added Successfully!</h3>
<% } else if("wrong".equals(msg)) { %>
    <h3 class="alert error">Something went wrong! Try Again!</h3>
<% } %>

<%
int id = 20221;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT MAX(book_id) FROM book");
    if(rs.next() && rs.getInt(1) > 0) {
        id = rs.getInt(1) + 1;
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

    <form action="addBookAction.jsp" method="post">
        <h3 style="color: #333; text-align: center; font-size: 28px; margin: 20px 0;">Product ID: <%= id %></h3>
        <input type="hidden" name="book_id" value="<%= id %>">

        <div class="form-section">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" class="input-style" required>

            <label for="author">Author</label>
            <input type="text" id="author" name="author" class="input-style" required>

            <label for="publisher">Publisher</label>
            <input type="text" id="publisher" name="publisher" class="input-style">

            <label for="isbn">ISBN</label>
            <input type="text" id="isbn" name="isbn" class="input-style">

            <label for="category">Category</label>
            <input type="text" id="category" name="category" class="input-style">

            <label for="language">Language</label>
            <input type="text" id="language" name="language" class="input-style">

            <label for="edition">Edition</label>
            <input type="text" id="edition" name="edition" class="input-style">

            <label for="price">Price</label>
            <input type="text" id="price" name="price" class="input-style" required>

            <label for="quantity">Quantity</label>
            <input type="text" id="quantity" name="quantity" class="input-style">

            <label for="discount">Discount (%)</label>
            <input type="text" id="discount" name="discount" class="input-style">

            <label for="sold_count">Sold Count</label>
            <input type="text" id="sold_count" name="sold_count" class="input-style">

            <label for="description">Description</label>
            <textarea id="description" name="description" class="input-style"></textarea>

            <label for="page_count">Page Count</label>
            <input type="text" id="page_count" name="page_count" class="input-style">

            <label for="publication_date">Publication Date</label>
            <input type="date" id="publication_date" name="publication_date" class="input-style">

            <label for="cover_image_url">Cover Image URL</label>
            <input type="text" id="cover_image_url" name="cover_image_url" class="input-style">

            <label for="preview_pdf_url">Preview PDF URL</label>
            <input type="text" id="preview_pdf_url" name="preview_pdf_url" class="input-style">

            <button type="submit" class="button">Add Book</button>
        </div>
    </form>
</body>
</html>
