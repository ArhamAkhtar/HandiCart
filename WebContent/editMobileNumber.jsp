<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="footer.jsp" %> 
    <%@ include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Mobile Number Edit</title>
</head>
<body>
<%
String prompt=request.getParameter("prompt");
if("done".equals(prompt))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<% } %>
<%
if("notequal".equals(prompt))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<% } %>
<form action="editMobileNumberBTS.jsp" action="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="mobileNumber" placeholder="Enter new contact no." required>
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter password" required>
<hr>
<button class="button"type="submit"> Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>