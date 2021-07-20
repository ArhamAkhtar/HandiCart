<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="header.jsp" %>
    <%@ include file="footer.jsp" %>  
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String prompt=request.getParameter("prompt");
if("notequal".equals(prompt))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>
<%

if("incorrect".equals(prompt))
{
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>
<%

if("correct".equals(prompt))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%} %>
<%

if("invalid".equals(prompt))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<form action="changePasswordBTS.jsp" method="post">
<h3>Enter Old Password</h3>
<input class="input-style" type="text" name="oldPassword" placeholder="Enter old password" required>
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="text" name="newPassword" placeholder="Enter new password" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="text" name="confirmPassword" placeholder="Enter new password again" required>
<hr>
<button class="input-style" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button> 
</form>
</body>
<br><br><br>
</html>