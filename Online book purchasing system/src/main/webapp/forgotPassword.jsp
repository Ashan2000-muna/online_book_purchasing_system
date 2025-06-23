<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="forgotPasswordAction.jsp" method="post">
  <input type="email" name="email" placeholder="Enter Your E-mail" required>
  <input type="number" name="mobileNumber" placeholder="Enter Your mobile number" required>
  <select name="securityQuestion">
  <option value="What was the name of your first school?">What was the name of your first school?
  </option>
  <option value="What was the make and model of your first car?">What was the make and model of your first car?
  </option>
  <option value="In what city or town was your first job?">In what city or town was your first job?
  </option>
  <option value="What is the name of the street you grew up on?">What is the name of the street you grew up on?
  </option>
  <option value="What is the name of your childhood best friend?">What is the name of your childhood best friend?
  </option>
  <option value="What was the name of your favorite teacher in school?">What was the name of your favorite teacher in school?
  </option>
  <option value="What was the name of your first pet?">What was the name of your first pet?
  </option>
  <option value="What is the title of your favorite novel book?">What is the title of your favorite novel book?
  </option>
  </select>
  <input type="text" name="answer" placeholder="Enter Your answer" required>
  	<input type="password" name="newPassword" placeholder="Enter Your new password" required>
  		<input type="submit" value="Save">     
  </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
   <h2>Love books? So do we. Let's make your reading journey easier and more exciting!</h2>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<p style="color:green;">Your password was successfully updated! <a href="login.jsp">Click here to login</a>.</p>

<%} %>
<%
if("invalid".equals(msg))
{
%>
<p style="color:red;">Incorrect information provided. Please double-check your details and try again.</p>

<%} %>
	</div>
</div>
</body>
</html>