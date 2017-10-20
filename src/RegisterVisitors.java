

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
/**
 * Servlet implementation class Register
 */
@WebServlet("/RegisterVisitors")
public class RegisterVisitors extends HttpServlet {
	
	int increment=0;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterVisitors() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		Calendar calendar = Calendar.getInstance();
	    java.sql.Date date1 = new java.sql.Date(calendar.getTime().getTime());
	    String newdate= new SimpleDateFormat("dd-MM-yyyy").format(date1);
	    
	    SimpleDateFormat sdFormat = new SimpleDateFormat("dd-MM-yyyy");
	    long daysDiff=0;
	    
		try{
		String count1=request.getParameter("TOTALROWS");
		long count=Long.parseLong(count1);
		
		String a=request.getParameter("NameOfMeeting");//constant
		String d=request.getParameter("NameOfHbcseHost");//constant
		String e=request.getParameter("From");//constant
		String f=request.getParameter("To");//constant
		String i="PENDING"; //constant
		String g[]=request.getParameterValues("WiredLan");//constant
		String b[]=request.getParameterValues("NameOfVisitor");
		String c[]=request.getParameterValues("VisitorsInstitution");
		String h[]=request.getParameterValues("WirelessWlan");
		String email_id=request.getParameter("email_id");
		String TypeOfUser="Visitor";
		String EmailOfMember=request.getParameter("sel");
		String mailsend1="SUCCESS";
		String ApprovedByHost=request.getParameter("NameOfHbcseHost");
		String ApprovedByApprovingMember=request.getParameter("NameOfHbcseHost");
	
		try {
			Date startDateObj = sdFormat.parse(e);
			Date endDateObj = sdFormat.parse(f);
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
	
		for(int r=0;r<count;r++)
		{
			
			if(((userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets")) || (userName.equals("director")) || (userName.equals("am"))))
			{	
				String mailsend1_1="SEND";
				String mailsend2="SEND";
				String Approved="Approved";
				String mailsend11="SEND";
				String temp="SUCCESS";
				
				Class.forName("com.mysql.jdbc.Driver");
				 
		        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

		        PreparedStatement ps=con.prepareStatement("insert into registeruser (NameOfMeeting,NameOfVisitor,VisitorsInstitution,NameOfHbcseHost,DateFrom,DateTo,WiredLan,WirelessWlan,status,ApprovedByHost,ApprovedByApprovingMember,email_id,date,mailsend1,mailsend2,TypeOfUser,EmailOfMember,mailsend11,temp)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		        
				ps.setString(1,a);
				ps.setString(2,b[r]);
				ps.setString(3,c[r]);
				ps.setString(4,d);
				ps.setString(5,e);
				ps.setString(6,f);
				ps.setString(7,g[r]);
				ps.setString(8,h[r]);
				ps.setString(9,Approved);
				ps.setString(10,ApprovedByHost);
				ps.setString(11,ApprovedByApprovingMember);
				ps.setString(12,email_id);
				ps.setString(13,newdate);
				ps.setString(14,mailsend1_1);
				ps.setString(15,mailsend2);
				ps.setString(16,TypeOfUser);
				ps.setString(17, EmailOfMember);
				ps.setString(18, mailsend11);
				ps.setString(19, temp);
				
				int ij=ps.executeUpdate();
				
		        if(ij>0)
		        {
		        	  increment=increment+1;
		        	  //request.getRequestDispatcher("index.html").include(request, response); 
		              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
		        	
		         }
		        if(increment==count)
		          {	  
		        	  request.getRequestDispatcher("approvedbyhost.jsp").include(request, response);
		        	  // response.sendRedirect("index.html");
		        	  //request.getRequestDispatcher("login.html").include(request, response); 
		              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
		        	  out.println("<script type=\"text/javascript\">");  
		        	  out.println("alert('Your request is sucessfully submitted');");  
		        	  out.println("</script>");
		        	  increment=0;
		          }
		        System.out.println("count="+count);
		        System.out.println("increment"+increment);  
		        System.out.println();

			}
			else if(!( (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets")) || (userName.equals("director")) ||  (userName.equals("am"))))
			{
			
				if(daysDiff>7)
				{	
					
					Class.forName("com.mysql.jdbc.Driver");
			 
			        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

			        PreparedStatement ps=con.prepareStatement("insert into registeruser (NameOfMeeting,NameOfVisitor,VisitorsInstitution,NameOfHbcseHost,DateFrom,DateTo,WiredLan,WirelessWlan,status,ApprovedByHost,email_id,date,mailsend1,TypeOfUser,EmailOfMember)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			        
					ps.setString(1,a);
					ps.setString(2,b[r]);
					ps.setString(3,c[r]);
					ps.setString(4,d);
					ps.setString(5,e);
					ps.setString(6,f);
					ps.setString(7,g[r]);
					ps.setString(8,h[r]);
					ps.setString(9,i);
					ps.setString(10,ApprovedByHost);
					ps.setString(11,email_id);
					//ps.setDate(11,date1);
					ps.setString(12,newdate);
					ps.setString(13,mailsend1);
					ps.setString(14,TypeOfUser);
					ps.setString(15, EmailOfMember);
					int ij=ps.executeUpdate();
					
			        if(ij>0)
			        {
			        	  increment=increment+1;
			        	  //request.getRequestDispatcher("index.html").include(request, response); 
			              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
			        	
			         }
			        if(increment==count)
			          {	  
			        	  request.getRequestDispatcher("success.jsp").include(request, response);
			        	  // response.sendRedirect("index.html");
			        	  //request.getRequestDispatcher("login.html").include(request, response); 
			              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
			        	  out.println("<script type=\"text/javascript\">");  
			        	  out.println("alert('Your request is sucessfully submitted');");  
			        	  out.println("</script>");
			        	  increment=0;
			          }
			        System.out.println("count="+count);
			        System.out.println("increment"+increment);  
			        System.out.println();
			      
				} //if block close
					else 
					{			
						String mailsend1_1="SEND";
						String mailsend2="SEND";
						String Approved="Approved";
						String mailsend11="SEND";
						String temp="SUCCESS";
						
						Class.forName("com.mysql.jdbc.Driver");
						 
				        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

				        PreparedStatement ps=con.prepareStatement("insert into registeruser (NameOfMeeting,NameOfVisitor,VisitorsInstitution,NameOfHbcseHost,DateFrom,DateTo,WiredLan,WirelessWlan,status,ApprovedByHost,ApprovedByApprovingMember,email_id,date,mailsend1,mailsend2,TypeOfUser,EmailOfMember,mailsend11,temp)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				        
						ps.setString(1,a);
						ps.setString(2,b[r]);
						ps.setString(3,c[r]);
						ps.setString(4,d);
						ps.setString(5,e);
						ps.setString(6,f);
						ps.setString(7,g[r]);
						ps.setString(8,h[r]);
						ps.setString(9,Approved);
						ps.setString(10,ApprovedByHost);
						ps.setString(11,ApprovedByApprovingMember);
						ps.setString(12,email_id);
						ps.setString(13,newdate);
						ps.setString(14,mailsend1_1);
						ps.setString(15,mailsend2);
						ps.setString(16,TypeOfUser);
						ps.setString(17, EmailOfMember);
						ps.setString(18, mailsend11);
						ps.setString(19, temp);
						
						int ij=ps.executeUpdate();
						
				        if(ij>0)
				        {
				        	  increment=increment+1;
				        	  //request.getRequestDispatcher("index.html").include(request, response); 
				              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
				        	
				         }
				        if(increment==count)
				          {	  
				        	  request.getRequestDispatcher("approvedbyhost.jsp").include(request, response);
				        	  // response.sendRedirect("index.html");
				        	  //request.getRequestDispatcher("login.html").include(request, response); 
				              //out.println("<h1 style='color:green';margin:0 0 0 30px;>You are request sucessfully submitted.....</h1>");
				        	  out.println("<script type=\"text/javascript\">");  
				        	  out.println("alert('Your request is sucessfully submitted');");  
				        	  out.println("</script>");
				        	  increment=0;
				          }
				        System.out.println("count="+count);
				        System.out.println("increment"+increment);  
				        System.out.println();
					}// else block
			}//else if
		}//for loop
		 }
		catch(Exception e)
		{
			System.out.println("Exception is ;"+e);	
		}
		 
		
	}	
public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) 
    throws IOException, ServletException 
{
HttpServletRequest request = (HttpServletRequest) req;
HttpServletResponse response = (HttpServletResponse) res;

HttpSession session= request.getSession(false);

if(request.getRequestURI().compareToIgnoreCase("/index.html")!=0&&
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
