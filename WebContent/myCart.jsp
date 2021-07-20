<%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%@ include file="header.jsp" %>
    <%@ include file="footer.jsp" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>h3{	
	text-align: center;
}
</style></head>
<dy>
<div style="color: #800000;; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String prompt=request.getParameter("prompt");
if("failed".equals(prompt)){
	%>
	<h3 class="alert">There is only one Quantity! So click on remove!</h3>	
<%} %>
<%
if("increment".equals(prompt)){
%>
	<h3 class="alert">Quantity  Increased Successfully!</h3>
	
<%} %>
<% 
if("decrement".equals(prompt)){
%>
	<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<% 
if("remove".equals(prompt)){
%>
	<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);	
	}
%>
<table>
<thead>
          <tr>
            <th scope="col" >Total: <i class="fa fa-inr"><%out.println(total); %></i> </th>
            <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs=st.executeQuery("select * from products inner join cart on products.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs.next()){
        %>
         <tr>
			<% sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3)%> </td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4)%> </td>
            <td><a href="QuantityChangeBTS.jsp?id=<%=rs.getString(1)%>&quantity=increment"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(9)%>  <a href="QuantityChangeBTS.jsp?id=<%=rs.getString(1)%>&quantity=decrement"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getInt(11)%>  </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
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