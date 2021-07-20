<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%
    String email=session.getAttribute("E-mail").toString();
    String mobileNumber=request.getParameter("mobileNumber");
    String password=request.getParameter("password");
    int z=0;
    try{
    	Connection con=ConnectionProvider.getCon();
    	Statement st=con.createStatement();
    	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
    	while(rs.next()){
    		z=1;
    		st.executeUpdate("update users set mobileNumber='"+mobileNumber+"' where email='"+email+"'");
    		response.sendRedirect("editMobileNumber.jsp?prompt=done");
    	}
    	if(z==0)
    		response.sendRedirect("editMobileNumber.jsp?prompt=notequal");	
    }
    catch(Exception e){
    	System.out.println(e);
    	
    }
    %>