
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp"  method="post">
  		<input type="email" name="E-mail" placeholder="Enter email id" required>
  		<input type="password" name="Password" placeholder="Enter Password" required>
  		<input type="submit" value="Login">
  	</form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  
<%
String prompt=request.getParameter("prompt");
if("notpresent".equals(prompt)){
	%>
	<h1>Incorrect User name or Password</h1>
	<%}
%>
<%if("invalid".equals(prompt)){ %>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
<h1 align=centre >HANDICART</h1>
    <p>Handicart is an initiative to facilitate people with selecting and buying their favorite handicraft products from the comfort of their homes.</p>
    <h4 align=centre>Welcome back user!!</h4>
    
    </div>
</div>

</body>
</html>