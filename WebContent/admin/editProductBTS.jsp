<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <% String id=request.getParameter("id");
    	String name=request.getParameter("Name");
    	String category=request.getParameter("Category");
    	String price=request.getParameter("Price");
    	String active=request.getParameter("Active");
    	String image=request.getParameter("Image");
    	try{
    		Connection con=ConnectionProvider.getCon();
    		Statement st=con.createStatement();
    		st.executeUpdate("update products set name='"+name+"',category='"+category+"',price='"+price+"',ready='"+active+"' where id='"+id+"'");
    		if(active.equals("No")){
    			st.executeUpdate("delete from cart where product_id='"+id+"'and address is NULL");
    		}
    		response.sendRedirect("allProductsView.jsp?prompt=done");
    	}
    	catch(Exception e){
    		System.out.println(e);
    		response.sendRedirect("allProductsView.jsp?prompt=wrong");
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