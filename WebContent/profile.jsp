<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="changeDetailsHeader.jsp" %>
    <%@ include file="footer.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="css/changeDetails.css">
<title>My Profile</title>
<style>
hr
{width:70%;}</style>
</head>
<body >
<%try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' ");
	while(rs.next()){
		 	
	
%>
<center><img src="profile.jpg"></center>
<h3>Hello <%=rs.getString(1) %> </h3>

 <h3>Your email id is :<%=rs.getString(2) %> </h3>
 
 <h3>Your Mobile Number is:<%=rs.getString(3) %> </h3>
 
<h3>Your Security Question is:<%=rs.getString(4) %> </h3>

      <br>
      <br>
      <br>
      <h3>Keep browsing, keep shopping with us..</h3>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>