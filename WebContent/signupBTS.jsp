 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%
    String name=request.getParameter("Name");
    String email=request.getParameter("E-mail");
    
    String mobileNumber=request.getParameter("Mobile Number");
    String securityQuestion=request.getParameter("Security question");
    String answer=request.getParameter("Answer");
    String password=request.getParameter("Password");
    String address="";
    String city="";
    String state="";
    String country="";
    try{
    	Connection con=ConnectionProvider.getCon();
    	PreparedStatement ps=con.prepareStatement("insert into users value(?,?,?, ?,?,?,?,?,?,?)");
    	ps.setString(1,name);
    	ps.setString(2,email);
    	ps.setString(3,mobileNumber);
    	ps.setString(4,securityQuestion);
    	ps.setString(5,answer);
    	ps.setString(6,password);
    	ps.setString(7,address);
    	ps.setString(8,city);
    	ps.setString(9,state);
    	ps.setString(10,country);
    	ps.executeUpdate();
    	response.sendRedirect("signup.jsp?prompt=valid");
    }
    catch(Exception e){
    	System.out.println(e);
    	response.sendRedirect("signup.jsp?prompt=invalid");
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