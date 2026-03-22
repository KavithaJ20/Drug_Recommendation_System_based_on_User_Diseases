<%-- 
    Document   : pro2
    Created on : Apr 27, 2018, 3:48:47 PM
    Author     : DLK
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List <String>ll = new ArrayList();
 String name = session.getAttribute("name").toString();
 session.setAttribute("name", name);
 String search = request.getParameter("search");
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug", "root", "root");
String Query22="SELECT * FROM val group by pro";
PreparedStatement ps22=con.prepareStatement(Query22);
ResultSet rs22=ps22.executeQuery();
while(rs22.next())
{
ll.add(rs22.getString("pro"));
}
String disease="";
PreparedStatement ps=con.prepareStatement("select * from reg where name='"+name+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
disease=rs.getString("disease");
}
for(String dat:ll)
{
PreparedStatement ps1 = con.prepareStatement("select * from dataset where medicalproduct='"+dat+"' and sideeff like '%"+disease+"%' ");
ResultSet sr = ps1.executeQuery();
if(sr.next())
{
System.out.println("if block");
System.out.println("if: "+dat);
PreparedStatement pst = con.prepareStatement("update val set status='In-Active' where pro='"+dat+"' ");
pst.executeUpdate();
}
else
{
System.out.println("else block");
System.out.println("else: "+dat);
PreparedStatement pst = con.prepareStatement("update val set status='Active' where pro='"+dat+"' ");
pst.executeUpdate();
}
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
                                                                <li><a href="profile.jsp">Profile</a></li>
                                                                <li><a href="logout.jsp" class="active">Logout</a></li>								
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
            <h2>Final Result</h2><br>		
    
  <center>
    
        
<% 
String tablet="";
           String Query221="SELECT * FROM val where status='Active' order by fre desc limit 1";
            PreparedStatement ps221=con.prepareStatement(Query221);
            ResultSet rs221=ps221.executeQuery();
            if(rs221.next())
            {
               tablet=rs221.getString("pro"); 
            }
%>
<h3>Recommended Tablet is <span style="color:red;"><%=tablet%></span></h3>
       </center>
            <br>	
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