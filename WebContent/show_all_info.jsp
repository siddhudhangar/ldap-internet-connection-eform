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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show all data</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>$(window).load(function(){
     $('.loader').fadeOut();
});</script>
</head>


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
	


<body>

<div class="loader"></div>

Search <input type="text" id="myInput" onclick="myFunction()" onkeyup="myFunction()">
<select id="select" name="sel" onclick="myFunction()" onkeyup="myFunction()">
<option value="1">NameOfMeeting</option>
<option value="2">NameOfVisitor</option>
<option value="3">VisitorsInstitution</option>
<option value="4">NameOfHBCSEHost</option>
<option value="5">Email-ID</option>
<option value="6">Date</option>
<option value="7">DateFrom</option>
<option value="8">DateTo</option>
<option value="9">Wired Lan</option>
<option value="10">Wireless Lan</option>
<option value="11">Status</option>
<option value="12">ApprovedByHost</option>
<option value="13">ApprovedByApprovingMember</option>
<option value="14">Username</option>
<option value="15">Password</option>
</select>

<form action="display.jsp">
<input type="submit" value="Go to Back">
</form>
<form name="frm" action="display.jsp" method="post">
<h2 align="center"><font><strong> Internet Request Form Information of Guests/ Visitors</strong></font></h2>
<table id="myTable" align="center" cellpadding="2" cellspacing="2" border="1">
<tr bgcolor="#f2e609">


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

</tr>	
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server 


int incre=0;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection  connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_internet_user_info", "root", "root");
//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement statement=connection.createStatement();
String sql ="SELECT * FROM registeruser ";

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
<td><%=resultSet12.getString("id")%> </td>
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
<td><%=resultSet12.getString("Username") %></td>
<td><%=resultSet12.getString("Password") %></td>

</tr>	

<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</form>
</body>
</html>