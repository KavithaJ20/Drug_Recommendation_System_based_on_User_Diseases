<%-- 
    Document   : pro
    Created on : Apr 3, 2018, 6:54:15 PM
    Author     : DLK
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String disease = request.getParameter("disease");
disease = disease.toLowerCase();

String dis[]= disease.split(" ");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug", "root", "root");
PreparedStatement ps3=con.prepareStatement("truncate table search");
ps3.executeUpdate();
PreparedStatement ps6=con.prepareStatement("truncate table val");
ps6.executeUpdate();
PreparedStatement ps=con.prepareStatement("select * from dataset");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
    
PreparedStatement ps1=con.prepareStatement("update dataset set rea1='"+rs.getString("reaction").toLowerCase()+"',drug1='"+rs.getString("medicalproduct").toLowerCase()+"' where id='"+rs.getString("id")+"'  ");
//ps1.executeUpdate();
}
for(String dd: dis)
{
    //System.out.println(dd);
   PreparedStatement ps2=con.prepareStatement("select * from dataset where reaction like '%"+dd+"%' or  drugindication like '%"+dd+"%' ");
   ResultSet rs2=ps2.executeQuery(); 
   while(rs2.next())
   {
   PreparedStatement ps4=con.prepareStatement("insert into search (tid,reaction,product,keyword) values ('"+rs2.getString("id")+"','"+rs2.getString("reaction")+"','"+rs2.getString("medicalproduct")+"','"+disease+"') ");
   ps4.executeUpdate();
   }
}
PreparedStatement ps4=con.prepareStatement("select * from search");
ResultSet rs4=ps4.executeQuery(); 
while(rs4.next())
{
String rea=rs4.getString("reaction");
rea=rea.replaceAll("_", "");
rea=rea.trim().replaceAll(" +", " ");
String reaa[]=rea.split(" ");
//String result="";
//for(String react: reaa)
//{
//result+=react.trim();
//result+=" ";
//}
//System.out.println(result);
//String result1[] = result.split(" ");
int rlen = reaa.length;
PreparedStatement ps5=con.prepareStatement("update search set siz='"+rlen+"' where id='"+rs4.getString("id")+"'  ");
ps5.executeUpdate();
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Drugs Without Side Effects</title>
	<!--/tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="New Clinic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--//tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/appointment_style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700" rel="stylesheet">
</head>
<body>
    <%
    String name = session.getAttribute("name").toString();
    session.setAttribute("name", name);
    %>
	<!-- header -->
	<div class="header" id="home">
		<div class="top_menu_w3layouts">
<div class="container">
			<div class="header_left">
				<ul>
					<li><i class="fa fa-map-marker" aria-hidden="true"></i> 1143 Chennai, Tamilnadu</li>
					<li><i class="fa fa-phone" aria-hidden="true"></i> +(044) 000 000 000</li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a >info@example.com</a></li>
				</ul>
			</div>
			<div class="header_right">
				<ul class="forms_right">
					<li><a>Drugs Without Side Effects</a> </li>
				</ul>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>

		<div class="content white">
			<nav class="navbar navbar-default" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
						<a class="navbar-brand" >
							<h1><span class="fa fa-stethoscope" aria-hidden="true"></span>Drugs Prediction </h1>
						</a>
					</div>
					<!--/.navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<nav>
							<ul class="nav navbar-nav">
								<li><a href="user.jsp">Home</a></li>
								<li><a href="profile.jsp" class="active">Profile</a></li>
                                                                <li><a href="logout.jsp">Logout</a></li>								
							</ul>
						</nav>
					</div>
					<!--/.navbar-collapse-->
					<!--/.navbar-->
				</div>
			</nav>
		</div>
	</div>	
        <hr>
	<!-- about -->
	<!-- about-bottom -->
	<center><br>
            <h2>First Set of Classification</h2><br>		
              <%
        try{
    %>
  <center>
     <table id="pro_display_table" border="0" cellspacing="1px"  style="border: 4px solid #FB9217; width:1100px;height: auto;">
                                 <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
         <tr>  
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&emsp;Id</strong></b></td> 
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&emsp;Reaction</strong></b></td>     
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;Tablet</strong></b></td>    
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;Number of Disease</strong></b></td>
        </tr>
        
<% 
            int x=0;
                        String Query22="SELECT * from search";
                        PreparedStatement ps22=con.prepareStatement(Query22);
                        ResultSet rs22=ps22.executeQuery();
                                      while(rs22.next())
                                      {
                                        x++;                                            
                                          %>
                                <tr>      
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;<%=x%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs22.getString("reaction")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&emsp;<%=rs22.getString("product")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&emsp;<%=rs22.getString("siz")%></td>
 <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
                                    <%}%>
              </table>
</center>
     <%//}
                                     
   }catch(Exception e){
   System.out.println(e);
   }
   %>    
       </center>
            <br>
            <form action="pro1.jsp">
            <center>   
                <h1 style="color: #055ffc;">Get Frequent Data's Depends Upon Search</h1>  <br> 
                <input type="submit" value="Frequent Data"/>
            </center>
       </form>	
        </center>
	<!-- //about-bottom -->
	<br><br><br><br><br>
	<div class="footer_wthree_agile">
		<p>© 2018 New Clinic. All rights reserved | Design by <a>W3layouts</a></p>
	</div>
	<!-- //footer -->
	
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script>
		$('ul.dropdown-menu li').hover(function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
		});
	</script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>
