<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%
    String email=request.getParameter("E-mail");
    String mobileNumber=request.getParameter("Mobile Number");
    String securityQuestion=request.getParameter("Security question");
    String answer=request.getParameter("Answer");
    String newPassword=request.getParameter("New Password");
    int p=0;
    try
    {
    	Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select *from users where email='"+email+"'and mobileNumber='"+mobileNumber+"'and securityQuestion='"+securityQuestion+"'and answer='"+answer+"'");
		while(rs.next())
		{
			p=1;
			st.executeUpdate("update users set password='"+newPassword+"'where email='"+email+"'");
			response.sendRedirect("forgotPassword.jsp?prompt=done");
		}
		if(p==0){
			response.sendRedirect("forgotPassword.jsp?prompt=invalid");
		}
    }
    catch(Exception e){
    	System.out.println(e);
    	
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