package Project;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.Part;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class FileUploadServlet extends HttpServlet {
	private static final String SAVE_DIR="Img";
/*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	} */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		PrintWriter out=response.getWriter();
		String savePath="C:/Users/LENOVO PC/eclipse-workspace/Online_shoppe/WebContent" +'/' +SAVE_DIR;
		File fileSaveDir=new File(savePath);
		String id=request.getParameter("id");
	    String name=request.getParameter("Name");
	    String category=request.getParameter("Category");
	    String price=request.getParameter("Price");
	    String active=request.getParameter("Active");
	    Part part=request.getPart("file1");
	 
	    String fileName=extractFileName(part);
	 part.write(savePath +'/' + fileName);
	//    part.write(fileName);
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","root");
			PreparedStatement ps=con.prepareStatement("insert into products  values(?,?,?,?,?,?)");
			ps.setString(1,id);
	    	ps.setString(2,name);
	    	ps.setString(3,category);
	    	ps.setString(4,price);
	    	ps.setString(5,active);
	    //	String filePath=savePath + File.separator + fileName;
	    	String filePath=fileName;
	    	ps.setString(6, filePath);
	    	ps.executeUpdate();
	    	out.println("<center><h1>Image inserted successfully</h1></center>");
	    //	out.println(fileName);
	    	response.sendRedirect("/Online_shoppe/admin/addNewProduct2.jsp?prompt=done");
		}
		catch(Exception e) {
			out.println(e);
			response.sendRedirect("/Online_shoppe/admin/addNewProduct2.jsp?prompt=wrong");		
		}
	}
	private String extractFileName(Part part) {
		// TODO Auto-generated method stub
		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		for(String s: items) {
			if(s.trim().startsWith("filename")) {
				String tmp=s.substring(s.indexOf("=") + 2, s.length()-1);
				//return tmp;
				return tmp.substring(tmp.lastIndexOf('\\')+1,tmp.length());
			}
			//	return s.substring(s.indexOf("=") + 2, s.length()-1);		
		}
		return null;
	}

}
