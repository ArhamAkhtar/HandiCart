<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="footer.jsp" %> 
    <%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: #800000;; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String prompt=request.getParameter("prompt");
if("done".equals(prompt))
{
%>
<h3 style="text-align:center; color:#800000;">Message successfully sent. Handicart team will contact you soon!</h3>
<%} %>
<%
if("notequal".equals(prompt))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsBTS.jsp" action="post">
<input class="input-style" type="text" name="subject" placeholder="Enter subject" required>
<hr>
<textarea class="input-style" type="text" name="body" placeholder="Enter message" required></textarea>
<hr>
<button class="button" type="submit">Send<i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
</body>
</html>