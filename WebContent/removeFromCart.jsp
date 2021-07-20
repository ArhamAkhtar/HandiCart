 <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
	<%
	String email=session.getAttribute("E-mail").toString();
	String product_id=request.getParameter("id");
	try{
		Connection con=ConnectionProvider.getCon();
    	Statement st=con.createStatement();
    	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
    	response.sendRedirect("myCart.jsp?prompt=remove");
    	   	
	}
	catch(Exception e){
		System.out.println(e);
	}
	%>