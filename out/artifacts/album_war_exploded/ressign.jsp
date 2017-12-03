<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/3
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=album","jsp","123456");
    Statement stat = conn.createStatement();
    int count;
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String email = request.getParameter("email");
    String sex = request.getParameter("sex");
    String Nname= request.getParameter("Nname");

    String sql= "INSERT INTO Users(Username,Password,Sex,Email,Nname) VALUES('"+username+"','"+password+"','"+sex+"','"+email+"','"+Nname+"')";
    try
    {
        stat.executeUpdate(sql);
    }
    catch (Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("ressign.html");
    }
    stat.close();
    conn.close();
    response.sendRedirect("resuccess.jsp");


%>
</body>
</html>
