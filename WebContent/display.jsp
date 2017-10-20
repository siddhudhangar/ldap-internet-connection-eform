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
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server 
%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hbcse_internet_user_info";
String userId = "root";
String password = "root";
int incre=0;

try{
Class.forName(driverName);
}catch (ClassNotFoundException e) {
e.printStackTrace();
}

//Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function popupCenter(url, title, w, h) {
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
} 
</script>
<script>
function myFunction() 
{
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  var Sel = document.getElementById("select");
  var select=Sel.options[Sel.selectedIndex].value; 
  
  for (i = 1; i < tr.length; i++) 
	  {  
    	td1 = tr[i].getElementsByTagName("td")[select];
    		if (td1) 
        		{
    			if ((td1.innerHTML.toUpperCase().indexOf(filter) > -1)) 
      			{
    			tr[i].style.display = "";
 				} 
			 	else 
				{
    			tr[i].style.display = "none";
  				}

        		}//td1 end bracket
  		}//for loop end bracket
}
</script>
<body onload="selectallMe()">
<script>$(window).load(function(){
     $('.loader').fadeOut('slow');
});</script>
<div class="loader"></div>

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

.social ul li{
  list-style:none;
  padding-left:12px;
  color:white;
}
li a{
 text-decoration:none;
}
.social ul{
  display:inline-flex;
  padding-left: 60px;
}
/*body{
font-family: 'Droid Sans', sans-serif;
background: rgba(170,179,86,1);
background: -moz-linear-gradient(left, rgba(170,179,86,1) 0%, rgba(134,145,28,0.91) 60%, rgba(124,136,12,0.91) 77%);
background: -webkit-gradient(left top, right top, color-stop(0%, rgba(170,179,86,1)), color-stop(60%, rgba(134,145,28,0.91)), color-stop(77%, rgba(124,136,12,0.91)));
background: -webkit-linear-gradient(left, rgba(170,179,86,1) 0%, rgba(134,145,28,0.91) 60%, rgba(124,136,12,0.91) 77%);
background: -o-linear-gradient(left, rgba(170,179,86,1) 0%, rgba(134,145,28,0.91) 60%, rgba(124,136,12,0.91) 77%);
background: -ms-linear-gradient(left, rgba(170,179,86,1) 0%, rgba(134,145,28,0.91) 60%, rgba(124,136,12,0.91) 77%);
background: linear-gradient(to right, rgba(170,179,86,1) 0%, rgba(134,145,28,0.91) 60%, rgba(124,136,12,0.91) 77%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#aab356', endColorstr='#7c880c', GradientType=1 );

}*/
.box{
  width:45%;
background: rgba(226,226,226,1);
background: -moz-linear-gradient(left, rgba(226,226,226,1) 0%, rgba(219,219,219,1) 10%, rgba(209,209,209,1) 98%, rgba(254,254,254,1) 100%);
background: -webkit-gradient(left top, right top, color-stop(0%, rgba(226,226,226,1)), color-stop(10%, rgba(219,219,219,1)), color-stop(98%, rgba(209,209,209,1)), color-stop(100%, rgba(254,254,254,1)));
background: -webkit-linear-gradient(left, rgba(226,226,226,1) 0%, rgba(219,219,219,1) 10%, rgba(209,209,209,1) 98%, rgba(254,254,254,1) 100%);
background: -o-linear-gradient(left, rgba(226,226,226,1) 0%, rgba(219,219,219,1) 10%, rgba(209,209,209,1) 98%, rgba(254,254,254,1) 100%);
background: -ms-linear-gradient(left, rgba(226,226,226,1) 0%, rgba(219,219,219,1) 10%, rgba(209,209,209,1) 98%, rgba(254,254,254,1) 100%);
background: linear-gradient(to right, rgba(226,226,226,1) 0%, rgba(219,219,219,1) 10%, rgba(209,209,209,1) 98%, rgba(254,254,254,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e2e2e2', endColorstr='#fefefe', GradientType=1 );

}
p{
  padding:40px;
}
.outer-box{
  margin-top:60px;
  margin-left:450px;
}
</style>
<h3>Welcome <%=userName %>,</h3>

Search <input type="text" id="myInput" onclick="myFunction()" onkeyup="myFunction()">
<select id="select" name="sel" onclick="myFunction()" onkeyup="myFunction()">
<option value="1">NameOfVisitor</option>
<option value="2">VisitorsInstitution</option>
<option value="3">NameOfHBCSEHost</option>
<option value="4">DateFrom</option>
<option value="5">DateTo</option>
<option value="6">Wired Lan</option>
<option value="7">Wireless Lan</option>
<option value="8">Status</option>
</select>
<br>
<form action="LogoutServlet" method="post">
<input type="submit" value="Logout" >
</form>

<% 
ResultSet rs1;
ResultSet rs2;
ResultSet rs3;
ResultSet rs4;
ResultSet rs5;
ResultSet rs6;
ResultSet rs7;
ResultSet rs8;
ResultSet rs9;
ResultSet rs10;
ResultSet rs11;

String type=null;
String ApprovedByHost=null;
String status=null;
String ApprovedByApprovingMember=null;
String ApprovedByHost1=null;
String ApprovedByApprovingMember1=null;


int idmain;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
	// Load the database driver
/*	Class.forName("com.mysql.jdbc.Driver");
	// Get a Connection to the database
	Connection  connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
	//Add the data into the database
	String sql1 = "select type from login where user='"+userName+"'";
	//String sql1 = "select type from login where user='anils'";
	Statement s1 = connection.createStatement();
	s1.executeQuery (sql1);
	rs1 = s1.getResultSet();
	while (rs1.next ()){
	//mobileno=rs1.getString("mobileno");
	//password=rs1.getString("password");
	type=rs1.getString("type");
	}*/
	String sql2 = "select ApprovedByHost from registeruser where ApprovedByHost='PENDING'";
	Statement s2 = connection.createStatement();
	s2.executeQuery (sql2);
	rs2 = s2.getResultSet();
	while (rs2.next ()){
	//mobileno=rs1.getString("mobileno");
	//password=rs1.getString("password");
	ApprovedByHost=rs2.getString("ApprovedByHost");
	}
	
	String sql4 = "select ApprovedByHost,ApprovedByApprovingMember from registeruser where ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING'";
	Statement s4 = connection.createStatement();
	s4.executeQuery (sql4);
	rs4 = s4.getResultSet();
	while (rs4.next ()){
	//mobileno=rs1.getString("mobileno");
	//password=rs1.getString("password");
	 ApprovedByHost1=rs4.getString("ApprovedByHost");
	 ApprovedByApprovingMember1=rs4.getString("ApprovedByApprovingMember");
	}
	String sql5 = "select status from registeruser where status='Approved'";
	Statement s5 = connection.createStatement();
	s5.executeQuery (sql5);
	rs5 = s5.getResultSet();
	while (rs5.next ()){
	//mobileno=rs1.getString("mobileno");
	//password=rs1.getString("password");
	status=rs5.getString("status");
	}
	
	
if(ApprovedByHost1!="PENDING" && ApprovedByApprovingMember1!="PENDING" ){
	Class.forName("com.mysql.jdbc.Driver");
    //STEP 3: Open a connection
     Connection conn = null;
	 Statement stmt = null;

     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
	 stmt = conn.createStatement();
     String sql = "UPDATE registeruser SET status='Approved' WHERE ApprovedByHost!='PENDING' AND ApprovedByApprovingMember!='PENDING'";
     stmt.executeUpdate(sql);
	
}
	
//first condition
	if((((userName.equals("siddhu")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("chandan")))  && !("FirstApproval".equals(SelectedOfApproval)) && ("Admin".equals(SelectAdmin))))
{
%>	
<script>
  var fieldName='checkbox';

  function selectall(){
  var i=document.frm.elements.length;
  var e=document.frm.elements;
  var name=new Array();
  var value=new Array();
  var j=0;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==true){
        value[j]=document.frm.elements[k].value;
        j++;
      }
    }
  }
  checkSelect();
}
function selectCheck(obj)
{
 var i=document.frm.elements.length;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      document.frm.elements[k].checked=obj;
    }
  }
  selectall();
}
 
function selectallMe()
{
  if(document.frm.allCheck.checked==true)
  {
   selectCheck(true);
  }
  else
  {
    selectCheck(false);
  }
}
function checkSelect()
{
 var i=document.frm.elements.length;
 var berror=true;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==false)
      {
        berror=false;
        break;
      }
    }
  }
  if(berror==false)
  {
    document.frm.allCheck.checked=false;
  }
  else
  {
    document.frm.allCheck.checked=true;
  }
}
</script>
<form action="show_all_info.jsp" method="post">
<input type="submit" value="Show_all_Register_Internet_info" >
</form>
	<form  name="frm" action="display.jsp" method="post">
	
	<h2 align="center"><font><strong> Internet Request Form Information of Guests/ Visitors</strong></font></h2>
	<table  id="myTable" align="center" cellpadding="2" cellspacing="2" border="1">
	<tr bgcolor="#f2e609">
	<td>Select All: <input class="largerCheckbox" type="checkbox" name="allCheck" onClick="selectallMe()" checked></td>
	
	<td><b>id</b></td>
	<td><b>NameOfMeeting</b></td>
	<td><b>NameOfVisitor</b></td>
	<td><b>Visitors<br>Institution</b></td>
	<td><b>NameOf<br>HbcseHost</b></td>
	<td><b>Email-ID</b></td>
	<td><b>Date</b></td>
	<td><b>DateFrom</b></td>
	<td><b>DateTo</b></td>
	<td><b>WiredLan</b></td>
	<td><b>WirelessWlan</b></td>
	<td><b>Status</b></td>
	<td><b>ApprovedBy<br>Host</b></td>
	<td><b>Approved<br>ByApproving<br>Member</b></td>
	<td><b>Username</b></td>
	<td><b>Password</b></td> 
	<td></td>
	</tr>	
	<%
	try{ 
	//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='SEND' AND mailsend3='PENDING' AND (Username='EMPTY' OR Password='EMPTY')";
	ResultSet resultSet12 = statement.executeQuery(sql);
	while(resultSet12.next()){
		incre++;
		
	%>
	<style type="text/css">
	input.largerCheckbox
	{
	width: 30px;
	height: 30px;
	}
	</style>
    <tr bgcolor="#f9f2e8">
	<td><input onClick="selectall()" type="checkbox" class="largerCheckbox" name="checkbox" value="<%=resultSet12.getString("id")%>"/></td>
	<td><input type="text" value="<%=resultSet12.getString("id")%>" ></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("NameOfMeeting") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("NameOfVisitor") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("VisitorsInstitution") %></td>
	<td bgcolor="#10e008"><%=resultSet12.getString("NameOfHbcseHost") %></td>
	<td bgcolor="#10e008"><%=resultSet12.getString("email_id") %></td>
	<td bgcolor="#9db1f2"><%=resultSet12.getString("Date") %></td>
	<td bgcolor="#9db1f2"><%=resultSet12.getString("DateFrom") %></td>
	<td bgcolor="#9db1f2" ><%=resultSet12.getString("DateTo") %></td>
	<td bgcolor="#5ef9ac"><%=resultSet12.getString("WiredLan") %></td>
	<td bgcolor="#5ef9ac"><%=resultSet12.getString("WirelessWlan") %></td>
	<td bgcolor="#10e008"><%=resultSet12.getString("status") %></td> 
	<td bgcolor="eda034"><%=resultSet12.getString("ApprovedByHost") %></td>
	<td bgcolor="eda034"><%=resultSet12.getString("ApprovedByApprovingMember") %></td>
	<td><input type="text" value="<%=resultSet12.getString("Username") %>" name="Username"></td>
	<td><input type="text" value="<%=resultSet12.getString("Password") %>" name="Password"></td>
	</tr>	

	<% 
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>
	<input type="submit" value="Submit">
 <!--  <button onclick="jQuery('').load('.aaa');">Refresh</button>--> 
	</form>

<%

//----------------------------------------------------------------------------


//java.util.Enumeration paramNames = request.getParameterNames();

//if(paramNames != null)
//{
//while(paramNames.hasMoreElements())
//{
//try{
        
  //      Class.forName("com.mysql.jdbc.Driver");
 
    //      Connection  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

       // PreparedStatement ps=con.prepareStatement("update registeruser set ApprovedByHost=?  where id=?");

       //stmt = conn.createStatement();
//String Username=null;
//String Password=null;
String[] idArray=request.getParameterValues("checkbox");       
//String value1=request.getParameter("id");
        
    //System.out.println(value1);
	
	//System.out.println("after ID"+id1);
	//String sql11 = "select * from registeruser where id="+id1+"";
	//String sql11 ="SELECT * FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING'";
	//Statement s11 = connection.createStatement();
	//s11.executeQuery (sql11);
	//ResultSet rs12 = s11.getResultSet();
	//System.out.println("after first ID");

	int count2=1;
	//while (rs12.next ())
	//{
	

//mobileno=rs1.getString("mobileno");
//password=rs1.getString("password");
//String Username=rs12.getString("Username");
//String Password=rs12.getString("Password");
//String count1=request.getParameter("count");
//int intcount=Integer.parseInt(count1);
	String[] UsernameArray=request.getParameterValues("Username");
	String[] PasswordArray=request.getParameterValues("Password");
	int r=0;
	
	System.out.println(idArray.length);
	
	outer:for(int i=0;i<idArray.length;i++){
	inner:for( ;i<=r;r++){
	
		int id1=(int)Integer.parseInt(idArray[r]);
		String Username=UsernameArray[r];
	String Password=PasswordArray[r];
	
	System.out.println(idArray[r]);
	System.out.println(UsernameArray[r]);
	System.out.println(PasswordArray[r]);
	
	String sql3 = "UPDATE registeruser SET Username=?,Password=? WHERE id=?";

		PreparedStatement stmt = connection.prepareStatement(sql3);
		stmt.setString(1, Username);
		stmt.setString(2
				, Password);
		//stmt.setString(3,"SEND");
		stmt.setInt(3, id1);
		
	//stmt.setString(1, (String)Username);
	//stmt.setString(2, (String)Password);
		int count = stmt.executeUpdate();

			if(count>0)
          	{
            out.println("You are Sucessfully Updated....");
            r=r+1;
            continue outer;
          	}
		}	
		
	}
 		
}// if block closed
	
if((((userName.equals("siddhu")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("chandan")))  && !("FirstApproval".equals(SelectedOfApproval)) && ("Admin".equals(SelectAdmin))))
{		
		Statement statement1=connection.createStatement();
		String sql ="SELECT email_id,count(13) AS COUNT FROM registeruser WHERE  status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='SEND' AND mailsend3='PENDING' AND Username<>'EMPTY' AND Password<>'EMPTY' group by email_id";
	
		//resultSet = statement.executeQuery(sql);
		statement1.executeQuery(sql);
		ResultSet resultSet1=statement1.getResultSet();
		String email_id=null;
		
		while (resultSet1.next()){
		 email_id=resultSet1.getString("email_id");
		    
		Statement statement2=connection.createStatement();
       	String sql1 ="SELECT * FROM registeruser WHERE  status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='SEND' AND mailsend3='PENDING' AND Username<>'EMPTY' AND Password<>'EMPTY' AND email_id='"+email_id+"'";
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
   		+"<td><b>DateFrom</b></td>"
   		+"<td><b>DateTo</b></td>"
   		+"<td><b>WiredLan</b></td>"
   		+"<td><b>WirelessWlan</b></td>"
   		+"<td><b>ApprovedByHost</b></td>"
   		+"<td><b>ApprovedByApprovingMember</b></td>"
   		+"<td><b>Username</b></td>"
   		+"<td><b>Password</b></td>"
   		+"</tr>";
       	String MailContent2=null;
       	String MailContent3="";
       	
       	while(resultSet21.next())
   		{ 
   		MailContent2="<tr bgcolor=#e6e6e6><td>"+resultSet21.getString("id")+"</td>"
   		+"<td>"+resultSet21.getString("NameOfVisitor")+"</td>"
   		+"<td>"+resultSet21.getString("VisitorsInstitution")+"</td>"
   		+"<td>"+resultSet21.getString("NameOfHbcseHost")+"</td>"
   		+"<td>"+resultSet21.getString("email_id")+"</td>"
   		+"<td>"+resultSet21.getString("DateFrom")+"</td>"
   		+"<td>"+resultSet21.getString("DateTo")+"</td>"
   		+"<td>"+resultSet21.getString("WiredLan")+"</td>"
   		+"<td>"+resultSet21.getString("WirelessWlan")+"</td>"
   		+"<td>"+resultSet21.getString("ApprovedByHost")+"</td>"
   		+"<td>"+resultSet21.getString("ApprovedByApprovingMember")+"</td>"
   		+"<td>"+resultSet21.getString("Username")+"</td>"
   		+"<td>"+resultSet21.getString("Password")+"</td>"
   		+"</tr>";
   		
   		int idnew=Integer.parseInt(resultSet21.getString("id"));
   		
   		String sql3 = "UPDATE registeruser SET mailsend3=? WHERE id=?";

		PreparedStatement stmt = connection.prepareStatement(sql3);
		stmt.setString(1, "SEND");
		stmt.setInt(2, idnew);	
	
		int count = stmt.executeUpdate();	
   		
   		%>
  		<i></i>
  		<i></i>
  		<i></i>
  		<i></i>
  		<i></i>
  		<i></i>
  		<%
   		MailContent3=MailContent3+MailContent2;
   		}
        String MailContent4="</table><br/><br/>Note: If Username and password is <span style=color:red>blank or empty or null</span>, then you can access internet directly without using username and password.<br/>";
       	
       	MailContent1=MailContent1+MailContent3+MailContent4;
       // String MailContentNew=MailContent1.toString();
   		//while(resultSet1.next()){
   		
   			String host = "smtp.gmail.com";
      		String to=resultSet1.getString("email_id");
   			//String to = "siddhudhangar@gmail.com";
      		String from="noreply.hbcse@gmail.com";
      	//	String host ="158.144.44.231";
      	//	String to = "anils@hbcse.tifr.res.in";
      	//	String from="siddhu@hbcse.tifr.res.in";
      		// write your email address means from email address.
      		
      		String subject = "Request for Temporary Internet / LAN Connection";
      		/*String messageText = "<table><tr>HOMI BHABHA CENTRE FOR SCIENCE EDUCATION (TIFR)</tr>"
      		+"<tr><td>Name Of Visitor:</td></tr>"
      		+"<tr><td>Visitor's Institution:</td></tr></table>";*/
      		
      		
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
           	
      		%>
      		<i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i>
      		<% 
      		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {return new PasswordAuthentication("noreply.hbcse@gmail.com", "noreply123");
      		 }
      		});
      		 
      		// Set debug on the Session
      		// Passing false will not echo debug info, and passing True will
      		mailSession.setDebug(sessionDebug);
      		 
      		// Instantiate a new MimeMessage and fill it with the
      		// required information.
      		 
      		Message msg = new MimeMessage(mailSession);
      		msg.setFrom(new InternetAddress(from));
      		InternetAddress[] address = {new InternetAddress(to)};
      		msg.setRecipients(Message.RecipientType.TO, address);
      		msg.setSubject(subject);
      		Calendar calendar = Calendar.getInstance();
      		msg.setSentDate(new java.sql.Date(calendar.getTime().getTime()));
      		%>
      		<i></i>
      		<% 
      		 
      		msg.setContent(MailContent1,"text/html");
      		 Transport transport = mailSession.getTransport("smtp");
      		//transport.connect(host, "siddhu@hbcse.tifr.res.in", "Tiger@123");
      		transport.connect(host, "noreply.hbcse@gmail.com", "noreply123");
      		//transport.sendMessage(msg, msg.getAllRecipients());
      		Transport.send(msg);
      		out.println("Mail was sent to "+to);
      		out.println(" from "+from);
      		out.println(" using host "+host+".");
			
		}
		          	
}
     
else if((((userName.equals("siddhu")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets")))) && !(SelectAdmin.equals("Admin")) && (SelectedOfApproval.equals("FirstApproval")))
{
	System.out.println("Running");%>
<script>
var fieldName='chkName';
 
function selectall(){
  var i=document.frm.elements.length;
  var e=document.frm.elements;
  var name=new Array();
  var value=new Array();
  var j=0;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==true){
        value[j]=document.frm.elements[k].value;
        j++;
      }
    }
  }
  checkSelect();
}
function selectCheck(obj)
{
 var i=document.frm.elements.length;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      document.frm.elements[k].checked=obj;
    }
  }
  selectall();
}
 
function selectallMe()
{
  if(document.frm.allCheck.checked==true)
  {
   selectCheck(true);
  }
  else
  {
    selectCheck(false);
  }
}
function checkSelect()
{
 var i=document.frm.elements.length;
 var berror=true;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==false)
      {
        berror=false;
        break;
      }
    }
  }
  if(berror==false)
  {
    document.frm.allCheck.checked=false;
  }
  else
  {
    document.frm.allCheck.checked=true;
  }
}
</script>
	<form name="frm" action="display.jsp" method="post">
	<h2 align="center"><font><strong> Request for Internet Access</strong></font></h2>
	<h2 align="center"><font><strong> First & Second Approval</strong></font></h2>
	<table id="myTable" align="center" cellpadding="5" cellspacing="5" border="1">
	<tr bgcolor="#99ccff">
	<td><b>id</b></td>
	<td><b>NameOfVisitor</b></td>
	<td><b>VisitorsInstitution</b></td>
	<td><b>NameOfHbcseHost</b></td>
	<td><b>Date</b></td>
	<td><b>DateFrom</b></td>
	<td><b>DateTo</b></td>
	<td><b>WiredLan</b></td>
	<td><b>WirelessWlan</b></td>
	<td><b>status</b></td>
	<td><b>ApprovedByHost</b></td>
	<td><b>ApprovedByApprovingMember</b></td>
	<td></td>
	</tr>	
	<%
	try
	{ 
	//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM registeruser WHERE ApprovedByHost='PENDING' AND ApprovedByApprovingMember='PENDING' AND status='PENDING'"
				+" AND mailsend1='PENDING' AND mailsend2='PENDING'";
	
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		incre++;
	%>
	<style type="text/css">

	input.largerCheckbox
	{
	width: 30px;
	height: 30px;
	}
	</style>

	<tr bgcolor="#e6e6e6">
	<td><%=resultSet.getString("id") %></td>
	<td><%=resultSet.getString("NameOfVisitor") %></td>
	<td><%=resultSet.getString("VisitorsInstitution") %></td>
	<td><%=resultSet.getString("NameOfHbcseHost")%></td>
	<td><%=resultSet.getString("Date")%></td>
	<td><%=resultSet.getString("DateFrom") %></td>
	<td><%=resultSet.getString("DateTo") %></td>
	<td><%=resultSet.getString("WiredLan") %></td>
	<td><%=resultSet.getString("WirelessWlan") %></td>
	<td bgcolor="#f91509"><%=resultSet.getString("status") %></td>
	 <td><%=resultSet.getString("ApprovedByHost") %></td>
	 <td><%=resultSet.getString("ApprovedByApprovingMember") %></td>
	<td><input  type="checkbox" class="largerCheckbox" name="checkbox<%=incre%>" value="<%=resultSet.getString("id") %>"/></td>
	</tr>

	<% 
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>
	<input type="submit" value="Approved By Host">
	</form>


	<%
	int value123=0;
	java.util.Enumeration paramNames = request.getParameterNames();
		
	if(paramNames != null)
	{
	while(paramNames.hasMoreElements())
	{
	//try{
	        System.out.println("Increment value while loop check ........................."+value123++);
	  //      Class.forName("com.mysql.jdbc.Driver");
	 
	    //      Connection  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

	       // PreparedStatement ps=con.prepareStatement("update registeruser set ApprovedByHost=?  where id=?");
	//stmt = conn.createStatement();ng
	String value1=request.getParameter((String)paramNames.nextElement());
	int id1=Integer.parseInt(value1);
	//String query = "UPDATE  registeruser SET ApprovedByHost="+(String)userName;
	//+"WHERE id="+id1

	String sql3 = "UPDATE registeruser SET ApprovedByHost=?,ApprovedByApprovingMember=?,status=?,mailsend1=? WHERE id=?";

	PreparedStatement stmt = connection.prepareStatement(sql3);
	stmt.setString(1, (String)userName);
	stmt.setString(2, (String)userName);
	stmt.setString(3, "Approved");
	stmt.setString(4, "SEND");
	//stmt.setString(5, "SEND");
	stmt.setInt(5, id1);

	int count = stmt.executeUpdate();
	          if(count>0)
	          {
	            out.println("You are Sucessfully Approved By User....");
	          }
	             
	    		//String mailsend1="SEND";
//	        		String sql_mailsend1 = "UPDATE registeruser SET mailsend1='SEND' WHERE id=?";

//	        		PreparedStatement mailsend_stmt = connection.prepareStatement(sql_mailsend1);
	        		//mailsend_stmt.setString(1, "SEND");
	//        		mailsend_stmt.setInt(1, id1);

	  //      	int mailsend_count = mailsend_stmt.executeUpdate();    
	        }//while loop closed
	 }//outer if closed.........................

	if( ( (userName.equals("siddhu")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets"))))
	{	
		Statement statement1=connection.createStatement();
		String sql ="SELECT email_id,count(13) AS COUNT FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING' group by email_id";

		//resultSet = statement.executeQuery(sql);
		statement1.executeQuery(sql);
		ResultSet resultSet1=statement1.getResultSet();
		String email_id=null;
		
		while (resultSet1.next ()){
		    email_id=resultSet1.getString("email_id");
		    
		Statement statement2=connection.createStatement();
	   	String sql1 ="SELECT * FROM registeruser WHERE  status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING'  AND email_id='"+email_id+"'";
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
	   	
	   	while(resultSet21.next())
			{
			MailContent2="<tr bgcolor=e6e6e6><td>"+resultSet21.getString("id")+"</td>"
			+"<td>"+resultSet21.getString("NameOfVisitor")+"</td>"
			+"<td>"+resultSet21.getString("VisitorsInstitution")+"</td>"
			+"<td>"+resultSet21.getString("NameOfHbcseHost")+"</td>"
			+"<td>"+resultSet21.getString("email_id")+"</td>"
			+"<td>"+resultSet21.getString("DateFrom")+"</td>"
			+"<td>"+resultSet21.getString("DateTo")+"</td>"
			+"<td>"+resultSet21.getString("WiredLan")+"</td>"
			+"<td>"+resultSet21.getString("WirelessWlan")+"</td>"
			+"<td bgcolor=10e008>"+resultSet21.getString("status")+"</td>"
			+"<td>"+resultSet21.getString("ApprovedByHost")+"</td>"
			+"<td>"+resultSet21.getString("ApprovedByApprovingMember")+"</td></tr>";
			
			MailContent3=MailContent3+MailContent2;
			

	   		//String name=email_id.replace("@hbcse.tifr.res.in","");
	   		int idnew=Integer.parseInt(resultSet21.getString("id"));
	   		String sql3 = "UPDATE registeruser SET mailsend2=? WHERE id=?";

			PreparedStatement stmt = connection.prepareStatement(sql3);
			stmt.setString(1, "SEND");
			stmt.setInt(2, idnew);	
		
			int count = stmt.executeUpdate();

			}
	    
	   	MailContent1=MailContent1+MailContent3;
	   // String MailContentNew=MailContent1.toString();
			//while(resultSet1.next()){
				
			
			String host = "smtp.gmail.com";
	       	String to = "clabteam@hbcse.tifr.res.in";
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
	       	out.println(" from " + from);
	       	out.println(" using host " + host + ".");
		}
		          	

}//if block closed
	
}  //main else if conditon closed
//----------------------------------------------------------------------------------------------	
//First Approval ...... Second else if Condition.........................................................................	
else if(!((userName.equals("siddh")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets"))) && !(SelectedOfApproval.equals("FirstApproval")) &&  !(SelectAdmin.equals("Admin")))
	//else if(userName!="siddhu" || userName!="sugrac" || userName!="nagarjuna" || userName!="anils" || userName!="rupesh" || userName!="anwesh" || userName!="anikets")
{
%>
<script>
var fieldName='checkbox';
 
function selectall(){
  var i=document.frm.elements.length;
  var e=document.frm.elements;
  var name=new Array();
  var value=new Array();
  var j=0;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==true){
        value[j]=document.frm.elements[k].value;
        j++;
      }
    }
  }
  checkSelect();
}
function selectCheck(obj)
{
 var i=document.frm.elements.length;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      document.frm.elements[k].checked=obj;
    }
  }
  selectall();
}
 
function selectallMe()
{
  if(document.frm.allCheck.checked==true)
  {
   selectCheck(true);
  }
  else
  {
    selectCheck(false);
  }
}
function checkSelect()
{
 var i=document.frm.elements.length;
 var berror=true;
  for(var k=0;k<i;k++)
  {
    if(document.frm.elements[k].name==fieldName)
    {
      if(document.frm.elements[k].checked==false)
      {
        berror=false;
        break;
      }
    }
  }
  if(berror==false)
  {
    document.frm.allCheck.checked=false;
  }
  else
  {
    document.frm.allCheck.checked=true;
  }
}
</script>
<form name="frm" action="display.jsp" method="post">
<h2 align="center"><font><strong> Request for Internet Access</strong></font></h2>
<h2 align="center"><font><strong> First Approval</strong></font></h2>
<table id="myTable" align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#99ccff">

<td><b>id</b></td>
<td><b>NameOfVisitor</b></td>
<td><b>VisitorsInstitution</b></td>
<td><b>NameOfHbcseHost</b></td>
<td><b>DateFrom</b></td>
<td><b>DateTo</b></td>
<td><b>WiredLan</b></td>
<td><b>WirelessWlan</b></td>
<td><b>status</b></td>
<td></td>
</tr>	
<%
try{ 
//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM registeruser WHERE NameOfVisitor<>'' AND ApprovedByHost='PENDING' AND ApprovedByApprovingMember='PENDING' AND status='PENDING' AND mailsend1='PENDING' AND mailsend2='PENDING' AND mailsend3='PENDING'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	incre++;
%>
<style type="text/css">
input.largerCheckbox
{
width: 30px;
height: 30px;
}
</style>

<tr bgcolor="#e6e6e6">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("NameOfVisitor") %></td>
<td><%=resultSet.getString("VisitorsInstitution") %></td>
<td><%=resultSet.getString("NameOfHbcseHost")%></td>
<td><%=resultSet.getString("DateFrom") %></td>
<td><%=resultSet.getString("DateTo") %></td>
<td><%=resultSet.getString("WiredLan") %></td>
<td><%=resultSet.getString("WirelessWlan") %></td>
<td bgcolor="#f91509"><%=resultSet.getString("status") %></td> 
<td><input  type="checkbox" class="largerCheckbox" name="checkbox<%=incre%>" value="<%=resultSet.getString("id") %>"/></td>
</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<input type="submit" value="Approved By Host">
</form>
<%
int value123=0;
java.util.Enumeration paramNames = request.getParameterNames();
	
if(paramNames != null)
{
while(paramNames.hasMoreElements())
{
//try{
        System.out.println("Increment value while loop check ........................."+value123++);
  //      Class.forName("com.mysql.jdbc.Driver");
 
    //      Connection  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

       // PreparedStatement ps=con.prepareStatement("update registeruser set ApprovedByHost=?  where id=?");
//stmt = conn.createStatement();
String value1=request.getParameter((String)paramNames.nextElement());
int id1=Integer.parseInt(value1);
//String query = "UPDATE  registeruser SET ApprovedByHost="+(String)userName;
//+"WHERE id="+id1

String sql3 = "UPDATE registeruser SET ApprovedByHost=? WHERE id=?";

PreparedStatement stmt = connection.prepareStatement(sql3);
stmt.setString(1, (String)userName);
stmt.setInt(2, id1);

int count = stmt.executeUpdate();
          if(count>0)
          {
            out.println("You are Sucessfully Approved By User....");
          }
             
    		//String mailsend1="SEND";
        		String sql_mailsend1 = "UPDATE registeruser SET mailsend1='SEND' WHERE id=?";

        		PreparedStatement mailsend_stmt = connection.prepareStatement(sql_mailsend1);
        		//mailsend_stmt.setString(1, "SEND");
        		mailsend_stmt.setInt(1, id1);
        		int mailsend_count = mailsend_stmt.executeUpdate();    
        }//while loop closed
}//outer if closed.........................

if(!((userName.equals("siddh")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets"))))
{		
		Statement statement1=connection.createStatement();
		String sql ="SELECT EmailOfMember,count(22) AS COUNT FROM registeruser WHERE status<>'Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember='PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING' AND mailsend11='PENDING' group by EmailOfMember";
		//resultSet = statement.executeQuery(sql);
		statement1.executeQuery(sql);
		ResultSet resultSet1=statement1.getResultSet();
		String email_id=null;
		
		int value1234=1;
		
		while (resultSet1.next ()){
		    email_id=resultSet1.getString("EmailOfMember");
		    
		Statement statement2=connection.createStatement();
       	String sql1 ="SELECT * FROM registeruser WHERE status<>'Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember='PENDING' AND mailsend1='SEND' AND mailsend2='PENDING' AND mailsend3='PENDING' AND mailsend11='PENDING' AND EmailOfMember='"+email_id+"'";
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
   		+"<td><b>Status</b></td>"
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
   		String sql3 = "UPDATE registeruser SET mailsend11=?,ApprovedByApprovingMember=?,UUID=?,status=? WHERE id=?";

		PreparedStatement stmt = connection.prepareStatement(sql3);
		stmt.setString(1, "SEND");
		stmt.setString(2, name);
		stmt.setString(3, UID1);
		stmt.setString(4, "Approved");
		stmt.setInt(5, idnew);	
	
		int count = stmt.executeUpdate();
   		}
        MailContent4="Click Below URL to give Approval to user <br/><br/><a href=http://localhost:8080/hbcse_internet/verify.jsp?"+UID1+">http://localhost:8080/hbcse_internet/verify.jsp?"+UID1+"</a><br/><br/>";
       	
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
       	out.println(" from " + from);
       	out.println(" using host " + host + ".");

			
		}
		          	
	}
}      
//Third Condition.........................................................................
	else if ( ((userName.equals("siddhu")) ||  (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets"))) &&(userName.equals("123")) )
	{
		//out.print("<h1>Unauthorised Access.Please Contact Computer Lab Team............. </h1>");
%>
<form action="display.jsp" method="post">
<h2 align="center"><font><strong> Request for Internet Access</strong></font></h2>
<h2 align="center"><font><strong> Second Approval</strong></font></h2>
<table id="myTable" align="center" cellpadding="5" cellspacing="5" border="1">

<tr bgcolor="#99ccff">

<td><b>id</b></td>
<td><b>NameOfVisitor</b></td>
<td><b>VisitorsInstitution</b></td>
<td><b>NameOfHbcseHost</b></td>
<td><b>DateFrom</b></td>
<td><b>DateTo</b></td>
<td><b>WiredLan</b></td>
<td><b>WirelessWlan</b></td>
<td><b>status</b></td>
<td><b>Approved By</b></td>
<td></td>
</tr>	
<%
try{ 
//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);

statement=connection.createStatement();
String sql ="SELECT * FROM registeruser WHERE ApprovedByHost<>'PENDING' and ApprovedByApprovingMember='PENDING' AND mailsend1='SEND' AND status<>'Approved'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	incre++;
	
%>
<style type="text/css">

input.largerCheckbox
{	
width: 30px;
height: 30px;
}
</style>

<tr bgcolor="#e6e6e6">
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("NameOfVisitor") %></td>
<td><%=resultSet.getString("VisitorsInstitution") %></td>
<td><%=resultSet.getString("NameOfHbcseHost")%></td>
<td><%=resultSet.getString("DateFrom") %></td>
<td><%=resultSet.getString("DateTo") %></td>
<td><%=resultSet.getString("WiredLan") %></td>
<td><%=resultSet.getString("WirelessWlan") %></td>
<td bgcolor="#f91509"><%=resultSet.getString("status") %></td>
 <td bgcolor="#10f22b"><%=resultSet.getString("ApprovedByHost") %></td>

<td><input  type="checkbox" class="largerCheckbox" name="checkbox<%=incre%>" value="<%=resultSet.getString("id") %>"/></td>
<!-- <td><input type="submit" value="Approved By Host"></td>-->
</tr>

<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<input type="submit" value="Approved By Approving Member">
</form>

<%
java.util.Enumeration paramNames = request.getParameterNames();
if(paramNames != null)
{
while(paramNames.hasMoreElements())
{//try{
        
  //      Class.forName("com.mysql.jdbc.Driver");
 
    //      Connection  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");

       // PreparedStatement ps=con.prepareStatement("update registeruser set ApprovedByHost=?  where id=?");
//stmt = conn.createStatement();
String value1=request.getParameter((String)paramNames.nextElement());
int id1=Integer.parseInt(value1);
//String query = "UPDATE  registeruser SET ApprovedByHost="+(String)userName;
//+"WHERE id="+id1

String sql3 = "UPDATE registeruser SET ApprovedByApprovingMember=? , status='Approved' , mailsend2='SEND' WHERE id=?";

PreparedStatement stmt = connection.prepareStatement(sql3);
stmt.setString(1, (String)userName);
//stmt.setString(2,"Approved");
stmt.setInt(2, id1);

int count = stmt.executeUpdate();
//int ifcount=0;
//int whilecount=0;
//whilecount=whilecount+1;
		if(count>0)
          {
         //   ifcount=ifcount+1;
            out.println("You are Sucessfully Approved By User....");
          } 

		
		
}//while closed block

}//if closed block


if( ( (userName.equals("siddhu")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("sugrac")) || (userName.equals("nagarjuna")) || (userName.equals("anils")) || (userName.equals("rupesh")) || (userName.equals("anwesh")) || (userName.equals("anikets"))))
{	
	Statement statement1=connection.createStatement();
	String sql ="SELECT email_id,count(13) AS COUNT FROM registeruser WHERE status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='SEND' AND mailsend3='PENDING' group by email_id";

	//resultSet = statement.executeQuery(sql);
	statement1.executeQuery(sql);
	ResultSet resultSet1=statement1.getResultSet();
	String email_id=null;
	
	while (resultSet1.next ()){
	    email_id=resultSet1.getString("email_id");
	    
	Statement statement2=connection.createStatement();
   	String sql1 ="SELECT * FROM registeruser WHERE  status='Approved' AND ApprovedByHost<>'PENDING' AND ApprovedByApprovingMember<>'PENDING' AND mailsend1='SEND' AND mailsend2='SEND' AND mailsend3='PENDING'  AND email_id='"+email_id+"'";
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
   	
   	while(resultSet21.next())
		{
		MailContent2="<tr bgcolor=e6e6e6><td>"+resultSet21.getString("id")+"</td>"
		+"<td>"+resultSet21.getString("NameOfVisitor")+"</td>"
		+"<td>"+resultSet21.getString("VisitorsInstitution")+"</td>"
		+"<td>"+resultSet21.getString("NameOfHbcseHost")+"</td>"
		+"<td>"+resultSet21.getString("email_id")+"</td>"
		+"<td>"+resultSet21.getString("DateFrom")+"</td>"
		+"<td>"+resultSet21.getString("DateTo")+"</td>"
		+"<td>"+resultSet21.getString("WiredLan")+"</td>"
		+"<td>"+resultSet21.getString("WirelessWlan")+"</td>"
		+"<td bgcolor=10e008>"+resultSet21.getString("status")+"</td>"
		+"<td>"+resultSet21.getString("ApprovedByHost")+"</td>"
		+"<td>"+resultSet21.getString("ApprovedByApprovingMember")+"</td></tr>";
		
		MailContent3=MailContent3+MailContent2;
		}
    
   	MailContent1=MailContent1+MailContent3;
   // String MailContentNew=MailContent1.toString();
		//while(resultSet1.next()){
			
		
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
       	out.println(" from " + from);
       	out.println(" using host " + host + ".");
	}
	          	

	}//if block closed

}

	//	rs1.close ();
	//s1.close ();
	rs2.close();
	s2.close();
	//rs3.close();
	//s3.close();
	rs4.close();
	s4.close();
	

	}catch(Exception e){
	System.out.println("Exception is ;"+e);
}		
%>