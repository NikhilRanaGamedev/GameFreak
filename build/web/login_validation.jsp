<%-- 
    Document   : login_validation
    Created on : Dec 14, 2018, 10:52:32 PM
    Author     : NightPredetor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
    </head>
    <body>
        <%
            String email = request.getParameter("login_email");
            String password = request.getParameter("login_password");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
            PreparedStatement sql = con.prepareStatement("SELECT * FROM `user_info` WHERE `email` = ? && `password` = ?");
            
            sql.setString(1, email);
            sql.setString(2, password);
            
            ResultSet rs = sql.executeQuery();
            if(rs.next()) {
                String user_id = rs.getString("user_id");
                session.setAttribute("user_id", user_id);
                
                session.setAttribute("status", "active");
                response.sendRedirect("index_redirector.jsp");
            } else {
                session.setAttribute("wrong", "1");
                response.sendRedirect("index_redirector.jsp");
            }
        %>
        <!--Scripts
        ============================================================-->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<script src="js/main.js"></script>-->
    </body>
</html>