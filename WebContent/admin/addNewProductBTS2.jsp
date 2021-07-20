<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="Project.ConnectionProvider" %>
    <%@ page import="java.sql.*" %>   
  <%@  page import ="java.io.IOException" %>
  <%@ page import ="java.io.File" %>
  <%@ page import ="javax.servlet.ServletException" %>
  <%@ page import ="java.io.InputStream"%>
  <%@ page import ="java.io.PrintWriter" %>
  <%@ page import ="java.sql.Connection"%>
  <%@ page import ="java.sql.DriverManager"%>
  <%@ page import ="java.sql.PreparedStatement"%>
  <%@ page import ="javax.servlet.ServletException"%>
  <%@ page import ="javax.servlet.annotation.MultipartConfig" %>
  <%@ page import ="javax.servlet.annotation.WebServlet" %>
 <%@ page import ="javax.servlet.http.HttpServlet"%>
 <%@ page import ="javax.servlet.http.HttpServletRequest"%>
 <%@ page import ="javax.servlet.http.HttpServletResponse"%>
 <%@ page import ="javax.servlet.http.Part"%>
  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>            
  <%
  
   String SAVE_DIR="Img";
  /*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// TODO Auto-generated method stub
  		response.getWriter().append("Served at: ").append(request.getContextPath());
  	} */

  	/**
  	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  	 */
  	String INSERT = "insert into products(id,name,category,price,ready,img)  values(?,?,?,?,?,?)";
  	String savePath="C:/Users/LENOVO PC/eclipse-workspace/Online_shoppe/WebContent/" + SAVE_DIR;
		File fileSaveDir=new File(savePath);
    Part part = request.getPart("file1");
        String filename = "";
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                filename = s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        part.write(savePath + "/" + filename);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","root");
            PreparedStatement ps = conn.prepareStatement(INSERT);
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.setString(2, request.getParameter("Name"));
            ps.setString(3, request.getParameter("Category"));
            ps.setString(4, request.getParameter("Price"));
            ps.setString(5, request.getParameter("Active"));
            ps.setString(6, filename);
            int rows = ps.executeUpdate();
            if (rows == 1) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('INSERTED');");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ERROR');");
                out.println("</script>");
            }
            response.sendRedirect(request.getContextPath());
        } 
        catch (Exception e) {
            out.println(e);
        }
        
        %>
  	
  	<!--  	String savePath="C:/Users/LENOVO PC/eclipse-workspace/Online_shoppe/WebContent/" + File.separator +SAVE_DIR;
  		File fileSaveDir=new File(savePath);
  		String id=request.getParameter("id");
  	    String name=request.getParameter("Name");
  	    String category=request.getParameter("Category");
  	    String price=request.getParameter("Price");
  	    String active=request.getParameter("Active");
  	    Part part=request.getPart("file");
  	    if(part!=null)
  		  	System.out.println(id);
  	    else
  	    	System.out.println(name);
  	    String fileName=extractFileName(part);
  	    part.write(savePath + File.separator + fileName);
  	    try {
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","root");
  			PreparedStatement ps=con.prepareStatement("insert into products  values(?,?,?,?,?,?)");
  			ps.setString(1,id);
  	    	ps.setString(2,name);
  	    	ps.setString(3,category);
  	    	ps.setString(4,price);
  	    	ps.setString(5,active);
  	    	String filePath=savePath + File.separator + fileName;
  	    	ps.setString(6, filePath);
  	    	ps.executeUpdate();
  	    	System.out.println("<center><h1>Image inserted successfully</h1></center>");
  	    	response.sendRedirect("addNewProduct2.jsp?prompt=done");
  		}
  		catch(Exception e) {
  			System.out.println(e);
  			response.sendRedirect("addNewProduct2.jsp?prompt=wrong");
  			
  		}
  	

  	private String extractFileName(Part part) {
  		// TODO Auto-generated method stub
  		String contentDisp=part.getHeader("content-disposition");
  		String[] items=contentDisp.split(";");
  		for(String s: items) {
  			if(s.trim().startsWith("filename"));
  			return s.substring(s.indexOf("=") + 2, s.length()-1);
  			
  		}
  		return null;
  	}

-->



</body>
</html>