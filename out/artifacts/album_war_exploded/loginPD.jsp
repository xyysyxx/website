<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/28
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>

<html>
<head>
    <title></title>
</head>
<body>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=album","jsp","123456");
    Statement stat = conn.createStatement();

    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String user="",pass="",Nname="";
    if(username==null) username="";
    if(password==null) password="";

    String sql="SELECT 用户名,密码 FROM Users";
    ResultSet rs = stat.executeQuery(sql);
    while(rs.next())
    {
        user = rs.getString("用户名").trim();
        pass = rs.getString("密码").trim();
        Nname = rs.getString("昵称").trim();
    }
    if(username.equals(user)&&password.equals(pass))
    {
        session.setAttribute("username",Nname);
        response.sendRedirect("home.html");
    }
    else
    {
        
        response.sendRedirect("page.html");
    }
%>
</body>
</html>
