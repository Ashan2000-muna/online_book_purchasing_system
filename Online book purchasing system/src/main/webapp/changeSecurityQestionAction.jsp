<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
String email=session.getAttribute("email").toString();
String securityQuestion=request.getParameter("securityQuestion");
String newAnswer=request.getParameter("newAnswer");
String password=request.getParameter("password");
int check=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set securityQuestion='"+securityQuestion+"',answer='"+newAnswer+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}		
}
catch(Exception e)
{}
%>