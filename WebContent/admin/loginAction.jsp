<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%
    String email=request.getParameter("E-mail");
    String password=request.getParameter("Password");
    if("admin@gmail.com".equals(email) && "admin".equals(password)){
    	session.setAttribute("E-mail",email);
    	response.sendRedirect("adminHome.jsp");
    
    }
   else{
    	
    		response.sendRedirect("login.jsp?prompt=invalid");
    	
    }
    		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>