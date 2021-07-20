	<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="footer.jsp" %> 
    <%@ include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String prompt=request.getParameter("prompt");
if("done".equals(prompt))
{
%>

<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%
if("notequal".equals(prompt))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeSecurityQuestionBTS.jsp" method="post">
<h3>Select Your New Security Question</h3>
<select class="input-style" name="securityQuestion">
<option value="Which is your favorite shopping website?">Which is your favorite shopping website?</option>
<option value="What is your birthday month?">What is your birthday month?</option>
<option value="Which is your favorite web series?">Which is your favorite web series?</option>
</select>  
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter new answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter password" required>
<hr>
 <button class="button" type="sumit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>