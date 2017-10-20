

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**	
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        //request.getRequestDispatcher("header.html").include(request, response);  
          
        String name=request.getParameter("UserName");  
        String password=request.getParameter("Password");  
        
        
        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
	            PreparedStatement pst = conn.prepareStatement("Select user,pass from login where user=? and pass=?");
	            pst.setString(1, name);
	            pst.setString(2, password);
	            ResultSet rs = pst.executeQuery();
	            if (rs.next()) {
	            	  out.print("Welcome, "+name);  
                  // HttpSession session=request.getSession();  
                   //session.setAttribute("name",name); 
                   
                  // request.getRequestDispatcher("display.jsp").include(request, response);
                   Cookie loginCookie = new Cookie("user",name);
           		//setting cookie to expiry in 30 mins
           		loginCookie.setMaxAge(20*60);
           		response.addCookie(loginCookie);
           		response.sendRedirect("display.jsp"+"?"+name);
                   
                         	
            } 
            else {
            	request.getRequestDispatcher("login.html").include(request, response); 
                out.print("Sorry, username or password error!");  
                   
            }
        } 
        catch (ClassNotFoundException  e) {
        	 e.printStackTrace();
        }
        catch(SQLException e){
        	 e.printStackTrace();
        }
        
     /*  if(name.equals("anils")&&password.equals("anils")){  
      
        } 
        else if(name.equals("rupeshs")&&password.equals("rupeshs"))
        {
        	out.print("Welcome, "+name);  
            // HttpSession session=request.getSession();  
             //session.setAttribute("name",name); 
             
            // request.getRequestDispatcher("display.jsp").include(request, response);
             Cookie loginCookie = new Cookie("user",name);
     		//setting cookie to expiry in 30 mins
     		loginCookie.setMaxAge(10*60);
     		response.addCookie(loginCookie);
     		response.sendRedirect("display.jsp"+"?"+name);
             	
        	
        }
        else{  
        	 
        }*/  
        out.close();
	}

}
