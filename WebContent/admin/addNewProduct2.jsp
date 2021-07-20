<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="adminHeader.jsp" %>
    <%@ include file="../footer.jsp" %>
<html>
<head>
<!--  <link rel="stylesheet" href="./css/addNewProduct-style.css">  -->
<title>Add New Product</title>
</head>
<body>
<% 
String prompt=request.getParameter("prompt");
if("done".equals(prompt)){
	%>
	<h3 class="alert">Product Added Successfully!</h3>
<% } %>
<% 
if("wrong".equals(prompt)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<% 
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from products");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	System.out.print(e);
}
%>
<form action="../FileUploadServlet" method="post" enctype="multipart/form-data">

<h3 style="color: black;">Product ID:<%out.println(id); %> </h3>
<input type="hidden"" name="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="Name" placeholder="Enter name" required>
</div>
<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style" type="text" name="Category" placeholder="Enter Category" required>
</div>
<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" type="text" name="Price" placeholder="Enter Price" required>
</div>
<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="Active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> 
<h3>Upload Image</h3>
  <input type="file" name="file1">
 <input type="submit" value="Upload" /> 
</div>
<!-- <button class="button"> Save 
 <i class='far fa-arrow-alt-circle-right'></i>
 </button> -->

</form>
</body>
<br><br><br>
</body>
</html>