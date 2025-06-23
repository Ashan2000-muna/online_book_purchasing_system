<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="../css/addNewBook-style.css">
    <style>
        .back {
            color: #333;
            margin-left: 2.5%;
        }
        
        
        h3 {
            color: #333;
        }
        .input-style {
            width: 95%;
            padding: 8px;
            margin: 5px 0;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        .form-section {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .field-block {
            flex: 1 1 45%;
        }
    </style>
</head>
<body>

<h2><a class="back" href="manageBooks.jsp"><i class='fas fa-arrow-circle-left'></i>Back</a></h2>

<%
String id = request.getParameter("id");
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM book WHERE book_id = '" + id + "'");
    if (rs.next()) {
%>
<div class="container">
<form action="editBookAction.jsp" method="post">
<input type="hidden" name="book_id" value="<%= rs.getInt("book_id") %>">


    <div class="form-section">

        <div class="field-block">
            <h3>Title</h3>
            <input class="input-style" type="text" name="title" value="<%= rs.getString("title") %>" required>
        </div>

        <div class="field-block">
            <h3>Author</h3>
            <input class="input-style" type="text" name="author" value="<%= rs.getString("author") %>" required>
        </div>

        <div class="field-block">
            <h3>Publisher</h3>
            <input class="input-style" type="text" name="publisher" value="<%= rs.getString("publisher") %>">
        </div>

        <div class="field-block">
            <h3>ISBN</h3>
            <input class="input-style" type="text" name="isbn" value="<%= rs.getString("isbn") %>">
        </div>

        <div class="field-block">
            <h3>Category</h3>
            <input class="input-style" type="text" name="category" value="<%= rs.getString("category") %>">
        </div>

        <div class="field-block">
            <h3>Language</h3>
            <input class="input-style" type="text" name="language" value="<%= rs.getString("language") %>">
        </div>

        <div class="field-block">
            <h3>Edition</h3>
            <input class="input-style" type="text" name="edition" value="<%= rs.getString("edition") %>">
        </div>

        <div class="field-block">
            <h3>Price</h3>
            <input class="input-style" type="number" step="0.01" name="price" value="<%= rs.getBigDecimal("price") %>" required>
        </div>

        <div class="field-block">
            <h3>Quantity</h3>
            <input class="input-style" type="number" name="quantity" value="<%= rs.getInt("quantity") %>">
        </div>

        <div class="field-block">
            <h3>Discount (%)</h3>
            <input class="input-style" type="number" step="0.01" name="discount" value="<%= rs.getBigDecimal("discount") %>">
        </div>

        <div class="field-block">
            <h3>Sold Count</h3>
            <input class="input-style" type="number" name="sold_count" value="<%= rs.getInt("sold_count") %>">
        </div>

        <div class="field-block">
            <h3>Page Count</h3>
            <input class="input-style" type="number" name="page_count" value="<%= rs.getInt("page_count") %>">
        </div>

        <div class="field-block">
            <h3>Publication Date</h3>
            <input class="input-style" type="date" name="publication_date" value="<%= rs.getDate("publication_date") %>">
        </div>

        <div class="field-block">
            <h3>Cover Image URL</h3>
            <input class="input-style" type="text" name="cover_image_url" value="<%= rs.getString("cover_image_url") %>">
        </div>

        <div class="field-block">
            <h3>Preview PDF URL</h3>
            <input class="input-style" type="text" name="preview_pdf_url" value="<%= rs.getString("preview_pdf_url") %>">
        </div>

        <div class="field-block" style="flex: 1 1 100%;">
            <h3>Description</h3>
            <textarea class="input-style" name="description" rows="5"><%= rs.getString("description") %></textarea>
        </div>
        
        
    <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>

    </div>

</form>
</div>

<%
    } else {
%>
    <h3 style="color:red; text-align:center;">Book not found with ID: <%= id %></h3>
<%
    }
} catch (Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
}
%>

<br><br><br>
</body>
</html>
