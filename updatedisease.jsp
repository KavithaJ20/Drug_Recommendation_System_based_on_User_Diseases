<%-- 
    Document   : updatedisease
    Created on : Apr 27, 2018, 1:57:37 PM
    Author     : DLK
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = session.getAttribute("name").toString();
    session.setAttribute("name", name);
    String disease = request.getParameter("disease");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","root");
    PreparedStatement pss =  con.prepareStatement("update reg set disease='"+disease+"' where name='"+name+"' ");
    pss.executeUpdate();
    RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
    rd.include(request, response);
%>
