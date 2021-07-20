<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>0
<body>
<div id='container'>
  <div class='signup'>
  <form action="forgotpassBTS.jsp" method="post">
  <input type="email" name="E-mail" placeholder="Enter email id" required>
  <input type="number" name="Mobile Number" placeholder="Enter Mobile number" required>
  <select name="Security question" >
  			<option value="Which is your favorite shopping website?">Which is your favorite shopping website?</option>
  			<option value="What is your birthday month?">"What is your birthday month?"</option>
  			<option value="Which is your favorite web series?">"Which is your favorite web series?"</option>
  		</select>
  		<input type="text" name="Answer" placeholder="Enter Answer" required>
  		<input type="password" name="New Password" placeholder="Enter your new Password" required>
  		<input type="submit" value="Confirm">
  	
      <h2><a href="">Login</a></h2>
  	</form>
  <%
  String prompt=request.getParameter("prompt");
  if("done".equals(prompt)){
	  %>
	  <h4 align=centre>Password Changed Successfully!</h1>
  <% }%>
   <%
   if("invalid".equals(prompt)){
	   %>
	   <h4 align=centre>Some thing Went Wrong! Try Again !</h1>
  <% } %> 

	</div>
  <div class='whyforgotPassword'>
 	<h1 align=centre >HANDICART</h1>
    <p>Handicart is an initiative to facilitate people with selecting and buying their favorite handicraft products from the comfort of their homes.</p>
    <h4>Happy shopping!</h4>
      </div>
</body>
</html>