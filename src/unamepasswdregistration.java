

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class unamepasswdregistration
 */
@WebServlet("/unamepasswdregistration")
public class unamepasswdregistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public unamepasswdregistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException ,NumberFormatException{
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		//Calendar calendar = Calendar.getInstance();
	    //java.sql.Date date1 = new java.sql.Date(calendar.getTime().getTime());
	    
	    
		String Username=request.getParameter("Username");
		String Password=request.getParameter("Password");
		System.out.println(Username);
		System.out.println(Password);
		
		String id1=request.getParameter("id");
		int id=Integer.valueOf(id1);
		
		//int a=128;
		try{
        
        Class.forName("com.mysql.jdbc.Driver");
 
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

        PreparedStatement ps=con.prepareStatement("UPDATE registeruser SET Username=?,Password=? WHERE id=?");
       //   Statement stmt = con.createStatement();
		//	String sql = "UPDATE registeruser SET Username='tamil',Password='tamil' where id=?";
		//	stmt.executeUpdate(sql);
		ps.setString(1,Username);
		ps.setString(2,Password);
		ps.setInt(3,id);
        int i=ps.executeUpdate();
        
          if(i>0)
          {
        	  //request.getRequestDispatcher("index.html").include(request, response); 
              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
        	  out.println("<script type=\"text/javascript\">");  
        	  out.println("alert('You are request sucessfully submitted');");  
        	  out.println("</script>");
          }
        
          
          
        }
        catch(Exception se)
        {
            se.printStackTrace();
        }
	

		
	}//dopost closed 

}
