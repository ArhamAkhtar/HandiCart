<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%
    String email=session.getAttribute("E-mail").toString();
    String address=request.getParameter("address");
    String city=request.getParameter("City");
    String state=request.getParameter("State");
    String country=request.getParameter("Country");
    try{
   	 	Connection con=ConnectionProvider.getCon();
   	 	PreparedStatement ps=con.prepareStatement("update users set address=?,ciity=?,state=?,country=? where email='"+email+"' ");
   	 	ps.setString(1,address);
   	 	ps.setString(2,city);
   		ps.setString(3,state);
   		ps.setString(4,country);
   		ps.setString(5,email);
   		ps.executeUpdate();
   		response.sendRedirect("addChangeAddress.jsp?prompt=correct");
   	 	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?prompt=incorrect");
}%>