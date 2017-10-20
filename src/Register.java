

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.util.Date;
/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		Calendar calendar = Calendar.getInstance();
	    java.sql.Date date1 = new java.sql.Date(calendar.getTime().getTime());
	    String newdate= new SimpleDateFormat("dd-MM-yyyy").format(date1);
	    
	    SimpleDateFormat sdFormat = new SimpleDateFormat("dd-MM-yyyy");
	    long daysDiff=0;
	    
		String a=request.getParameter("NameOfVisitor");
		String b=request.getParameter("VisitorsInstitution");
		String c=request.getParameter("NameOfHbcseHost");
		String d=request.getParameter("From");
		String e=request.getParameter("To");
		String f=request.getParameter("WiredLan");
		String g=request.getParameter("WirelessWlan");
		String h="PENDING";
		String ApprovedByHost=request.getParameter("NameOfHbcseHost");
		String ApprovedByApprovingMember=request.getParameter("NameOfHbcseHost");
		String email_id=request.getParameter("email_id");
		String mailsend1="SUCCESS";
		String TypeOfUser="Regular";
		String EmailOfMember=request.getParameter("sel");
		String temp="SUCCESS";
		
		try {
			Date startDateObj = sdFormat.parse(d);
			Date endDateObj = sdFormat.parse(e);
			long timeDiff = endDateObj.getTime() - startDateObj.getTime();
			 daysDiff = (timeDiff/(1000*60*60*24))+1;
			System.out.println("Time difference in days: "+daysDiff);
            
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String userName = null;
		String SelectedOfApproval = null;
		String SelectAdmin = null;

		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user")) userName = cookie.getValue();
			if(cookie.getName().equals("user1")) SelectedOfApproval = cookie.getValue();
			if(cookie.getName().equals("user2")) SelectAdmin = cookie.getValue();
		}
		}
		if(userName == null) response.sendRedirect("index.html");
		
		if(((userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets")) || (userName.equals("director")) || (userName.equals("am"))))
		{
			String mailsend1_1="SEND";
			String mailsend2="SEND";
			String Approved="Approved";
			String mailsend11="SEND";
			try{
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
	        PreparedStatement ps=con.prepareStatement("insert into registeruser (NameOfVisitor,VisitorsInstitution,NameOfHbcseHost,DateFrom,DateTo,WiredLan,WirelessWlan,status,ApprovedByHost,ApprovedByApprovingMember,email_id,mailsend1,mailsend2,date,TypeOfUser,EmailOfMember,mailsend11,temp)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			ps.setString(1,a);
			ps.setString(2,b);
			ps.setString(3,c);
			ps.setString(4,d);
			ps.setString(5,e);
			ps.setString(6,f);
			ps.setString(7,g);
			ps.setString(8,Approved);
			ps.setString(9,ApprovedByHost);
			ps.setString(10,ApprovedByApprovingMember);
			ps.setString(11,email_id);
			ps.setString(12,mailsend1_1);
			ps.setString(13,mailsend2);
			ps.setString(14,newdate);
			ps.setString(15,TypeOfUser);
			ps.setString(16,EmailOfMember);
			ps.setString(17,mailsend11);
			ps.setString(18,temp);
			
			int i=ps.executeUpdate();
			
	          if(i>0)
	          {
	        	  request.getRequestDispatcher("approvedbyhost.jsp").include(request, response);
	        	  out.println("<script type=\"text/javascript\">");  
	        	  out.println("alert('Your request is sucessfully submitted');");  
	        	  out.println("</script>");
	        	   
	          } 
	        }
	        catch(Exception se)
	        {
	            se.printStackTrace();
	        }
		}	
		
		else if(!(((userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets")) || (userName.equals("director")) || (userName.equals("am")))))
		{
		if(daysDiff>7){
		
		try{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
        PreparedStatement ps=con.prepareStatement("insert into registeruser (NameOfVisitor,VisitorsInstitution,NameOfHbcseHost,DateFrom,DateTo,WiredLan,WirelessWlan,status,ApprovedByHost,email_id,mailsend1,date,TypeOfUser,EmailOfMember)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		ps.setString(1,a);
		ps.setString(2,b);
		ps.setString(3,c);
		ps.setString(4,d);
		ps.setString(5,e);
		ps.setString(6,f);
		ps.setString(7,g);
		ps.setString(8,h);
		ps.setString(9,ApprovedByHost);
		ps.setString(10,email_id);
		ps.setString(11,mailsend1);
		ps.setString(12,newdate);
		ps.setString(13,TypeOfUser);
		ps.setString(14,EmailOfMember);
		
		int i=ps.executeUpdate();
		
          if(i>0)
          {
        	  request.getRequestDispatcher("success.jsp").include(request, response);
        	  out.println("<script type=\"text/javascript\">");  
        	  out.println("alert('Your request is sucessfully submitted');");  
        	  out.println("</script>");
        	   
          } 
        }
        catch(Exception se)
        {
            se.printStackTrace();
        }
		}
		else
		{
			try{
		       
				String mailsend1_1="SEND";
				String mailsend2="SEND";
				String Approved="Approved";
				String mailsend11="SEND";
				
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
		        PreparedStatement ps=con.prepareStatement("insert into registeruser (NameOfVisitor,VisitorsInstitution,NameOfHbcseHost,DateFrom,DateTo,WiredLan,WirelessWlan,status,ApprovedByHost,ApprovedByApprovingMember,email_id,mailsend1,mailsend2,date,TypeOfUser,EmailOfMember,mailsend11,temp)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

				ps.setString(1,a);
				ps.setString(2,b);
				ps.setString(3,c);
				ps.setString(4,d);
				ps.setString(5,e);
				ps.setString(6,f);
				ps.setString(7,g);
				ps.setString(8,Approved);
				ps.setString(9,ApprovedByHost);
				ps.setString(10,ApprovedByApprovingMember);
				ps.setString(11,email_id);
				ps.setString(12,mailsend1_1);
				ps.setString(13,mailsend2);
				ps.setString(14,newdate);
				ps.setString(15,TypeOfUser);
				ps.setString(16,EmailOfMember);
				ps.setString(17,mailsend11);
				ps.setString(18,temp);
				
				int i=ps.executeUpdate();
				
		          if(i>0)
		          {
		        	  request.getRequestDispatcher("approvedbyhost.jsp").include(request, response);
		        	  out.println("<script type=\"text/javascript\">");  
		        	  out.println("alert('Your request is sucessfully submitted');");  
		        	  out.println("</script>");
		        	   
		          } 
		        }
		        catch(Exception se)
		        {
		            se.printStackTrace();
		        }
			}
		}
		}	
	
public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) 
    throws IOException, ServletException 
{
HttpServletRequest request = (HttpServletRequest) req;
HttpServletResponse response = (HttpServletResponse) res;

HttpSession session= request.getSession(false);

if(request.getRequestURI().compareToIgnoreCase("/login.html")!=0&&
request.getRequestURI().compareToIgnoreCase("/")!=0)
{
if (session!=null &&!session.isNew()) 
{
    chain.doFilter(req, res);
}
else 
{
response.sendRedirect(request.getContextPath()+"/index.html"); 
}
}
else
{
chain.doFilter(req, res);

}
}

}
