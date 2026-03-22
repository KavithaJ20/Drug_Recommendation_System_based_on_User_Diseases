<%-- 
    Document   : pro1
    Created on : Apr 3, 2018, 8:21:52 PM
    Author     : DLK
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        String searchkeyword="";
    String name = session.getAttribute("name").toString();
    session.setAttribute("name", name);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug", "root", "root");
    PreparedStatement p=con.prepareStatement("SELECT * FROM search WHERE siz < 4");
                ResultSet s = p.executeQuery();
                while(s.next())
                {
                    String fid=s.getString("tid");
                    String rea=s.getString("reaction");
                    String pro=s.getString("product");
                    String key=s.getString("keyword").toLowerCase();
                    searchkeyword=s.getString("keyword").toLowerCase();
                    String file=s.getString("id");System.out.println("First loop");
                    PreparedStatement p1=con.prepareStatement("select * from search where id='"+file+"' ");
                    ResultSet s1 = p1.executeQuery();
                    while(s1.next())
                    {
                        String conts=s1.getString("reaction").toLowerCase();
                        System.out.println("Second loop");
                        String word[]=conts.split(" ");
                        String qur[]=key.split(" ");
                        int cou=0; int high=0;
                        for(int i=0;i<qur.length;i++)
                        {
                            int dummy=0;
                            for(int j=0;j<word.length;j++)
                            {
				if(qur[i].equalsIgnoreCase(word[j]))
				{
                                    high++;
                                    if(dummy==0)
                                    {
                                        dummy++;
                                        cou++;
                                    }
				}
                            }
                        }
                        
                           PreparedStatement insert=con.prepareStatement("insert into val (fid,rea,pro,fre) values('"+fid+"','"+rea+"','"+pro+"','"+high+"') ");
                           insert.executeUpdate();
                       
                    }
                }
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
            <h2>Frequent Disease Data's & Count</h2><br>		
              <%
        try{
        //Dis=no
        

//if(Fin.equals("yes")){
   // System.out.println(Fin);
    %>
  <center>
     <table id="pro_display_table" border="0" cellspacing="1px"  style="border: 4px solid #FB9217; width:1100px;height: auto;">
                                 <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>  
         <tr>  
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&emsp;Id</strong></b></td> 
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&emsp;Product</strong></b></td>     
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;Reaction</strong></b></td>
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;Frequent Count</strong></b></td>
        </tr>
        
<% 
            int x=0;
                        String Query22="SELECT * FROM val group by pro";
                        PreparedStatement ps22=con.prepareStatement(Query22);
                        ResultSet rs22=ps22.executeQuery();
                                      while(rs22.next())
                                      {
                                        x++;                                            
                                          %>
                                <tr>      
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;<%=x%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs22.getString("pro")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&emsp;<%=rs22.getString("rea")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&emsp;<%=rs22.getString("fre")%>&emsp;</td>
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
        </center>
        <form action="pro2.jsp">
            <center>   
                <h1 style="color: #055ffc;">Depends Upon My Profile</h1>  <br> 
                <input type="hidden" value="<%=searchkeyword%>" name="search">
                <input type="submit" value="Get Final Result"/>
            </center>
       </form>
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