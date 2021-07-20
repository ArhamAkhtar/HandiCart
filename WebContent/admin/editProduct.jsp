<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="adminHeader.jsp" %>
    <%@ include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductsView.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from products where id='"+id+"'");
	while(rs.next()){
		String filename=rs.getString(6);
		
%>

<form action="editProductBTS.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(id); %>">
<table style="width:100%" border="2">
<tr>
<td>Enter Name</td>
<td><input class="input-style" type="text" name="Name" value="<%=rs.getString(2) %>" required></td>
</tr>
            <tr>
<td>Enter Category</td>
<td> <input class="input-style" type="text" name="Category"value="<%=rs.getString(3) %>" required></td>
</tr>
<tr>
<td>Enter Price</td>
<td><input class="input-style" type="number" name="Price" value="<%=rs.getString(4) %>" required></td>
</tr>
<tr>
<td>Active</td>
<td><select class="input-style" name="Active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select></td>
</tr>
<tr>
<td>Image</td>
<td><img src="../Img/<%=filename%>" width="150" height="200" alt="trial"/></td>
<!--  <td> <input class="input-style" type="text" name="Image" value="<%=rs.getString(6) %>" required></td> -->
</tr>
</table>

 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
<br><br><br>
</body>
</html>