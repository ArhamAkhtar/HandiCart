package Project;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        String id=request.getParameter("id");
        String name=request.getParameter("Name");
        String category=request.getParameter("Category");
        String price=request.getParameter("Price");
        String active=request.getParameter("Active");
        Part part = request.getPart("image");
        if (part != null) {
            try {
            	Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","root");
    		
            //    Connection con = jspdb.getConnection();
    			PreparedStatement ps=con.prepareStatement("insert into products values(?,?,?,?,?,?)");
    	    	ps.setString(1,id);
    	    	ps.setString(2,name);
    	    	ps.setString(3,category);
    	    	ps.setString(4,price);
    	    	ps.setString(5,active);
    	   
         //       PreparedStatement ps = con.prepareStatement("insert into data(image) values(?)");
                InputStream is = part.getInputStream();
                ps.setBlob(6, is);
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("../home.jsp?prompt=done");
                } else {
                    response.sendRedirect("../home.jsp?prompt=wrong");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}