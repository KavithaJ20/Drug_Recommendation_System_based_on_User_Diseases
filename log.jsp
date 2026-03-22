<%-- 
    Document   : log
    Created on : Feb 12, 2018, 5:06:37 PM
    Author     : DLK
--%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String name,pass,fname,lname,mobile,email;
    name=request.getParameter("name");
    pass=request.getParameter("pass");   
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","root");
    String sql="select * from reg where name='"+name+"' and pass='"+pass+"' ";
    PreparedStatement pss=con.prepareStatement(sql);
    ResultSet rs = pss.executeQuery();
    if(rs.next())
    {
        session.setAttribute("name", name);
    out.println("<script>"
                        +"alert('Valid User...')"
                        +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
    rd.include(request, response);
    }
    else
    {
    out.println("<script>"
                        +"alert('Please enter valid username and password..')"
                        +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
    rd.include(request, response);
    }                     
    }                      
    catch(Exception e)
    {
        out.println("<script>"
				+"alert('"+e+"')"
				+"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
    rd.include(request, response);
    }
%>

