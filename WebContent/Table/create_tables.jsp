<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>
    <%
    try{
    	Connection con=ConnectionProvider.getCon();
    	Statement st=con.createStatement();
    	String q1="create table if not exists users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(100),city varchar(100),state varchar(100),country varchar(100))";
	//	String q2="create table if not exists product(id int,name varchar(500),category varchar(200),price int,ready varchar(10))";
		String q4="create table if not exists products(id int,name varchar(500),category varchar(200),price int,ready varchar(10),img varchar(500))";
		String q3="create table if not exists cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
    	String q5="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(500),body varchar(1000),PRIMARY KEY(id))";
		System.out.println(q1); 
    	//System.out.println(q2);
    	System.out.println(q3);
    	System.out.println(q4);
    	System.out.println(q5);//	st.execute(q1);
	//	st.execute(q2);
		st.execute(q3);
		st.execute(q4);
		st.execute(q5);
		System.out.print("Table created");
		con.close();
    }
    catch(Exception e){
    	System.out.print(e);
    }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</body>
</html>