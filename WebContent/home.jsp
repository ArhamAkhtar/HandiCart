<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="header.jsp" %>
    <%@ include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style >
h3
{
	color: black;
	text-align: center;
}
</style>
</head>
<body  >

<div style=" text-align: center; font-size:30px;font-color:DarkOliveGreen"><h1 ><b> YOU DESIRE, WE DESIGN!</b></h1></div>
<div style=" text-align: center; font-size:25px;"> <h2 >Creativity of hands is a gift of god and we empower you by offering such products.</h2></div>
   

<%
String prompt=request.getParameter("prompt");
if("added".equals(prompt)){
	%>
	<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(prompt)){
%>
	<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<% 
if("invalid".equals(prompt)){
%>
	<h3 class="alert">Something went wrong! Try Again..</h3>
	<%} %>
	
<table >
        <thead>
          <tr >
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Image</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from products where ready='Yes'");
	while(rs.next()){
		String filename=rs.getString(6);
%>
	 <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
           	<td><img src="Img/<%=filename%>" width="150" height="200" alt="trial"/></td>
            <td><a href="addToCartBTS.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
          <%
		}
		}
		catch(Exception e){
			System.out.println(e);
		}
		%>
         

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>
	
         