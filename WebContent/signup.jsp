<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  	<form action="signupBTS.jsp"  method="post">
  		<input type="text" name="Name" placeholder="Enter name" required>
  		<input type="email" name="E-mail" placeholder="Enter email id" required>
  		<input type="number" name="Mobile Number" placeholder="Enter Mobile number" required>
  		<select name="Security question" required>
  			<option value="Which is your favorite shopping website?">Which is your favorite shopping website?</option>
  			<option value="What is your birthday month?">"What is your birthday month?"</option>
  			<option value="Which is your favorite web series?">"Which is your favorite web series?"</option>
  		</select>
  		<input type="text" name="Answer" placeholder="Enter Answer" required>
  		<input type="password" name="Password" placeholder="Enter Password" required>
  		<input type="submit" value="signup">
  	</form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
  String prompt=request.getParameter("prompt");
  if("valid".equals(prompt))
  {%>
	<h2>Registration Successful!</h2>
  <% }%>
	<%    
	if("invalid".equals(prompt))
	{
		%>
		<h1>Some thing Went Wrong! Try Again !</h1>
	<% } %>
    <h1 align=centre >HANDICART</h1>
    <p>Handicart is an initiative to facilitate people with selecting and buying their favorite handicraft products from the comfort of their homes.</p>
    <h4>Happy shopping!</h4>
  </div>
</div>

</body>
</html> 