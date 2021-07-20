<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <% String email=request.getParameter("E-mail");
    String password=request.getParameter("Password");
    if("admin@gmail.com".equals(email) && "admin".equals(password)){
    	session.setAttribute("E-mail",email);
    	response.sendRedirect("admin/adminHome.jsp");
    }
    else{
    	int z=0;
    	try{
    		Connection con=ConnectionProvider.getCon();
    		Statement st=con.createStatement();
    		ResultSet rs=st.executeQuery("select *from users where email='"+email+"'and password='"+password+"'");
    		while(rs.next()){
    			z=1;
    			session.setAttribute("E-mail",email);
    			response.sendRedirect("home.jsp");
    		}
    		if(z==0){
    			response.sendRedirect("login.jsp?prompt=notpresent");
    		}
    	}
    	catch(Exception e){
    		System.out.println(e);
    		response.sendRedirect("login.jsp?prompt=invalid");
    	}
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