
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <meta http-equiv="refresh" content="9; URL=http://localhost:8080/hbcse_internet/home.jsp">-->
<meta http-equiv="refresh" content="9; URL=home.jsp">
<script>$(window).load(function(){
     $('.loader').fadeOut(10000);
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Internet Form</title>
</head>
<body>

<div class="loader"></div>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server	 
%>
<%
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
%>
<h3 Style="color:green;">Page Redirecting to another page ....................... Please Wait....................... Don't Close Tab until Page Redirection Process Complete.</h3>

<% 

Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

if(!((userName.equals("siddh")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets"))))
{		
		Statement statement1=connection.createStatement();
		String sql ="SELECT EmailOfMember,count(22) AS COUNT FROM registeruser WHERE status<>'Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember='PENDING' AND mailsend1='SUCCESS' AND mailsend2='PENDING' AND mailsend3='PENDING' AND mailsend11='PENDING' group by EmailOfMember";
		//resultSet = statement.executeQuery(sql);
		statement1.executeQuery(sql);
		ResultSet resultSet1=statement1.getResultSet();
		String email_id=null;
		int value1234=1;
		
		while (resultSet1.next ()){
		    email_id=resultSet1.getString("EmailOfMember");
		    
		Statement statement2=connection.createStatement();
       	String sql1 ="SELECT * FROM registeruser WHERE status<>'Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember='PENDING' AND mailsend1='SUCCESS' AND mailsend2='PENDING' AND mailsend3='PENDING' AND mailsend11='PENDING' AND EmailOfMember='"+email_id+"'";
		//resultSet = statement.executeQuery(sql);
       	statement2.executeQuery(sql1);
       	ResultSet resultSet21=statement2.getResultSet();
		System.out.println("if block");
       	
		String MailContent1="<table id=myTable align=center cellpadding=5 cellspacing=5 border=1>"
   		+"<tr bgcolor=#99ccff>"
   		+"<td><b>id</b></td>"
   		+"<td><b>NameOfVisitor</b></td>"
   		+"<td><b>VisitorsInstitution</b></td>"
   		+"<td><b>NameOfHbcseHost</b></td>"
   		+"<td><b>Email-ID</b></td>"
   		+"<td><b>Date</b></td>"
   		+"<td><b>DateFrom</b></td>"
   		+"<td><b>DateTo</b></td>"
   		+"<td><b>WiredLan</b></td>"
   		+"<td><b>WirelessWlan</b></td>"
   		+"<td style=color:red><b>Status</b></td>"
   		+"<td><b>ApprovedByHost</b></td>"
   		+"</tr>";
       	String MailContent2=null;
       	String MailContent3="";
       	String MailContent4="";
       	
       	UUID UniqueID = UUID.randomUUID();
       	String UID=String.valueOf(UniqueID);
       	String UID1=UID.replaceAll("-","");
       	System.out.println(UID1);
       	
       	while(resultSet21.next())
   		{
   		System.out.println("Second while loop ............. increment"+value1234++);
       	MailContent2="<tr bgcolor=e6e6e6><td>"+resultSet21.getString("id")+"</td>"
   		+"<td>"+resultSet21.getString("NameOfVisitor")+"</td>"
   		+"<td>"+resultSet21.getString("VisitorsInstitution")+"</td>"
   		+"<td>"+resultSet21.getString("NameOfHbcseHost")+"</td>"
   		+"<td>"+resultSet21.getString("email_id")+"</td>"
   		+"<td>"+resultSet21.getString("date")+"</td>"
   		+"<td>"+resultSet21.getString("DateFrom")+"</td>"
   		+"<td>"+resultSet21.getString("DateTo")+"</td>"
   		+"<td>"+resultSet21.getString("WiredLan")+"</td>"
   		+"<td>"+resultSet21.getString("WirelessWlan")+"</td>"
   		+"<td>"+resultSet21.getString("status")+"</td>"
   		+"<td>"+resultSet21.getString("ApprovedByHost")+"</td>"
   		+"</tr>";
   		 		
   		MailContent3=MailContent3+MailContent2;
   		
   		String name=email_id.replace("@hbcse.tifr.res.in","");
   		int idnew=Integer.parseInt(resultSet21.getString("id"));
   		String sql3="UPDATE registeruser SET mailsend1=?,mailsend11=?,ApprovedByApprovingMember=?,UUID=?,status=? WHERE id=?";

		PreparedStatement stmt = connection.prepareStatement(sql3);
		stmt.setString(1, "SEND");
		stmt.setString(2, "SEND");
		stmt.setString(3, name);
		stmt.setString(4, UID1);
		stmt.setString(5, "Approved");
		stmt.setInt(6, idnew);	
	
		int count = stmt.executeUpdate();
   		
   		
   		}
        //MailContent4="Click Below URL to give Approval to user <br/><br/><a href=http://10.1.0.32:8080/hbcse_internet/verify.jsp?"+UID1+">http://10.1.0.32:8080/hbcse_internet/verify.jsp?"+UID1+"</a><br/><br/>";
        MailContent4="Click Below URL to give Approval to user <br/><br/><a href=http://10.1.1.111:8080/hbcse_internet/verify.jsp?"+UID1+">http://10.1.1.111:8080/hbcse_internet/verify.jsp?"+UID1+"</a><br/><br/>";
        
       	MailContent1=MailContent1+MailContent3+MailContent4;
       	String host = "smtp.gmail.com";
       	String to = resultSet1.getString("EmailOfMember");	
       	//String to = "clabteam@hbcse.tifr.res.in";
  		String from="noreply.hbcse@gmail.com";
  		String subject = "Request for Temporary Internet / LAN Connection";
       	//String messageText = request.getParameter("body");
       	boolean sessionDebug =false;
       	// Create some properties and get the default Session.
       		Properties props = System.getProperties();
   		props.put("mail.transport.protocol", "smtp");
   		props.put("mail.host", host);
   		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.port", "465");    //port is 587 for TLS  if you use SSL then port is 465
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
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
		          	
	}
%>


</body>
</html>