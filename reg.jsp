<%-- 
    Document   : reg
    Created on : Jan 27, 2018, 3:49:02 PM
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
    fname=request.getParameter("fname");
    lname=request.getParameter("lname");
    mobile=request.getParameter("mobile");
    email=request.getParameter("email");    
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","root");
    String sql="insert into reg (name,pass,fname,lname,mobile,email) values ('"+name+"','"+pass+"','"+fname+"','"+lname+"','"+mobile+"','"+email+"')";
    PreparedStatement pss=con.prepareStatement(sql);
    pss.executeUpdate();    
                     out.println("<script>"
                        +"alert('Details Inserted Successfully')"
                        +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
    rd.include(request, response);
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

