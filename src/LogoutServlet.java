

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	
	
		
		/**
		 * Servlet implementation class LogoutServlet
		 */
		    	response.setContentType("text/html");
		    	Cookie loginCookie = null;
		    	Cookie[] cookies = request.getCookies();
		    	if(cookies != null){
		    	for(Cookie cookie : cookies){
		    		if(cookie.getName().equals("user")){
		    			loginCookie = cookie;
		    			break;
		    		}
		    	}
		    	}
		    	if(loginCookie != null){
		    		loginCookie.setMaxAge(0);
		        	response.addCookie(loginCookie);
		    	}
		    	response.sendRedirect("index.html");
	     /*response.setContentType("text/html");  
         PrintWriter out=response.getWriter();  
           
         request.getRequestDispatcher("login.html").include(request, response);  
           
         HttpSession session=request.getSession();  
         session.invalidate();  
           
         out.print("You are successfully logged out!");  
           
         out.close();   */  
		}
		    
			
	}


