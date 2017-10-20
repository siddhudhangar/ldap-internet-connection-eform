<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.*"%>
<%@ page import="javax.net.ssl.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="8;http://10.1.1.111:8080/hbcse_internet/index.html" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>$(window).load(function(){
     $('.loader').fadeOut(8500);
});</script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Droid+Sans);
.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%; 
	z-index: 9999;
	background: url('image/loading.gif') 50% 50% no-repeat rgb(249,249,249);
	}
</style>
<script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
	
<title>Homi Bhabha Center for Science Education</title>
</head>
<body>
<%
try{
	String UUID=null;
	if(request.getQueryString() != null)
 	UUID=request.getQueryString();
 	//out.println(UUID);
 
 	Class.forName("com.mysql.jdbc.Driver");  
 	Connection connection=DriverManager.getConnection(  
 	"jdbc:mysql://localhost:3306/hbcse_internet_user_info","root","root");  
 	
 	Statement statement22=connection.createStatement();
	String sql12 ="SELECT * FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='SEND' AND (mailsend3='PENDING' OR mailsend3='SEND') AND UUID='"+UUID+"' AND mailsend11='SEND' AND verify_status='verify'";
	//resultSet = statement.executeQuery(sql);
	statement22.executeQuery(sql12);
	ResultSet resultSet212=statement22.getResultSet();
 	
	int counter2=0;
	while(resultSet212.next())
	{
	counter2++;
	
	}
	if(counter2>0)
	{
		out.println("<h1><span style=color:orange>You have already completed approval process.</span></h1>");
		throw new Exception("new exception create");
	}
 	Statement statement2=connection.createStatement();
	String sql1 ="SELECT * FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING' AND UUID='"+UUID+"' AND mailsend11='SEND' AND verify_status='PENDING'";
	//resultSet = statement.executeQuery(sql);
	statement2.executeQuery(sql1);
	ResultSet resultSet21=statement2.getResultSet();
	
	int counter1=0;
	while(resultSet21.next())
		{
		int idnew=Integer.parseInt(resultSet21.getString("id"));
   		String sql3 = "UPDATE registeruser SET verify_status=? WHERE id=?";

		PreparedStatement stmt = connection.prepareStatement(sql3);
		stmt.setString(1, "verify");
		//stmt.setString(2, "SEND");
		stmt.setInt(2, idnew);	
	
		int count = stmt.executeUpdate();
		counter1++;
		
		}
	
	//BELOW CODE FOR SEND MAILS
	Statement statement1=connection.createStatement();
	String sql ="SELECT email_id,count(13) AS COUNT FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING' AND  mailsend11<>'PENDING' AND verify_status='verify' group by email_id";

	//resultSet = statement.executeQuery(sql);
	statement1.executeQuery(sql);
	ResultSet resultSet1=statement1.getResultSet();
	String email_id=null;
	
	while (resultSet1.next ()){
	    email_id=resultSet1.getString("email_id");
	    
	Statement statement211=connection.createStatement();
   	String sql111 ="SELECT * FROM registeruser WHERE  status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING'  AND  mailsend11<>'PENDING' AND verify_status='verify' AND email_id='"+email_id+"'";
	//resultSet = statement.executeQuery(sql);
   		statement211.executeQuery(sql111);
   	ResultSet resultSet211=statement211.getResultSet();
	System.out.println("if block");
   	
	String MailContent1="<table id=myTable align=center cellpadding=5 cellspacing=5 border=1>"
		+"<tr bgcolor=#99ccff>"
		+"<td><b>id</b></td>"
		+"<td><b>NameOfVisitor</b></td>"
		+"<td><b>VisitorsInstitution</b></td>"
		+"<td><b>NameOfHbcseHost</b></td>"
		+"<td><b>Email-ID</b></td>"
		+"<td><b>DateFrom</b></td>"
		+"<td><b>DateTo</b></td>"
		+"<td><b>WiredLan</b></td>"
		+"<td><b>WirelessWlan</b></td>"
		+"<td><b>Status</b></td>"
		+"<td><b>ApprovedByHost</b></td>"
		+"<td><b>ApprovedByApprovingMember</b></td>"
		+"</tr>";
   		String MailContent2=null;
   		String MailContent3="";
   	
   		while(resultSet211.next())
		{
		MailContent2="<tr bgcolor=e6e6e6><td>"+resultSet211.getString("id")+"</td>"
		+"<td>"+resultSet211.getString("NameOfVisitor")+"</td>"
		+"<td>"+resultSet211.getString("VisitorsInstitution")+"</td>"
		+"<td>"+resultSet211.getString("NameOfHbcseHost")+"</td>"
		+"<td>"+resultSet211.getString("email_id")+"</td>"
		+"<td>"+resultSet211.getString("DateFrom")+"</td>"
		+"<td>"+resultSet211.getString("DateTo")+"</td>"
		+"<td>"+resultSet211.getString("WiredLan")+"</td>"
		+"<td>"+resultSet211.getString("WirelessWlan")+"</td>"
		+"<td bgcolor=10e008>"+resultSet211.getString("status")+"</td>"
		+"<td>"+resultSet211.getString("ApprovedByHost")+"</td>"
		+"<td>"+resultSet211.getString("ApprovedByApprovingMember")+"</td></tr>";
		
		MailContent3=MailContent3+MailContent2;
		
		int idnew=Integer.parseInt(resultSet211.getString("id"));
   		String sql3 = "UPDATE registeruser SET mailsend2=? WHERE id=?";
        
		PreparedStatement stmt = connection.prepareStatement(sql3);
		stmt.setString(1, "SEND");
		stmt.setInt(2, idnew);	
	
		int count = stmt.executeUpdate();

		}
    
   		MailContent1=MailContent1+MailContent3;
   
		String host = "smtp.gmail.com";
       	String to = "clabteam@hbcse.tifr.res.in";
  		String from="noreply.hbcse@gmail.com";
  		String subject = "Request for Temporary Internet / LAN Connection";
       	//String messageText = request.getParameter("body");
       	boolean sessionDebug =false;
       	// Create some properties and get the default Session.
       	Properties props = System.getProperties();
       	props.put("mail.host", host);
       	props.put("mail.transport.protocol", "smtp");
       	//Session mailSession = Session.getDefaultInstance(props, null);
       	Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {return new PasswordAuthentication("noreply.hbcse@gmail.com", "noreply123");
  		}
  		});
       	// Set debug on the Session
       	// Passing false will not echo debug info, and passing True will.
       	 
       	mailSession.setDebug(sessionDebug);
       	 
       	// Instantiate a new MimeMessage and fill it with the 
       	// required information.
       	 
       	Message msg = new MimeMessage(mailSession);
       	msg.setFrom(new InternetAddress(from));
       	InternetAddress[] address = {new InternetAddress(to)};
       	msg.setRecipients(Message.RecipientType.TO, address);
       	msg.setSubject(subject);
       	msg.setSentDate(new java.util.Date());
       //	msg.setText(MailContent1);
       	msg.setContent(MailContent1,"text/html");
 		Transport transport = mailSession.getTransport("smtp");
 		//transport.connect(host, "siddhu@hbcse.tifr.res.in", "Tiger@123");
 		transport.connect(host, "noreply.hbcse@gmail.com", "noreply123");
 		//transport.sendMessage(msg, msg.getAllRecipients());
 		
       	// Hand the message to the default transport service
       	// for delivery.
       	 
       	Transport.send(msg);
       	out.println("Mail was sent to " + to);
       	//out.println(" from " + from);
       	//out.println(" using host " + host + ".");
	}

	         //if block closed
	if(counter1>0)
	{
		out.println("<h1><span style=color:Green>Approval Process Completed</span></h1>");	
	}
	if(counter1==0)
	{
		out.println("<h1><span style=color:red>URL not found OR Inorrect URL.Please check again</span></h1>");
	}

}catch(Exception e)
{ 
System.out.println("Already Process Completed");	
}
	
%>
</body>
</html>