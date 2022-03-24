<%-- 
    Document   : profile_validation
    Created on : Dec 24, 2018, 12:23:13 AM
    Author     : NightPredetor
--%>

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
            String user_id = (String)session.getAttribute("user_id");
            
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
//            out.println(first_name);
        %>
            <jsp:useBean id="signup_validation_bean" class="beans.signup_validation">
                <jsp:setProperty name="signup_validation_bean" property = "*" />
            </jsp:useBean>
        <%   
            if(signup_validation_bean.validateFirstName(first_name) == false) {
                session.setAttribute("profile_first_name_error", "1");
            }
            
            if(signup_validation_bean.validateLastName(last_name) == false) {
                session.setAttribute("profile_last_name_error", "1");
            }
            
            if(signup_validation_bean.validateEmail(email) == false) {
                session.setAttribute("profile_email_error", "1");
            }
            
            if(signup_validation_bean.validatePhone(phone) == false) {
                session.setAttribute("profile_phone_error", "1");
            }
            
            if(signup_validation_bean.validateFirstName(first_name) == true && signup_validation_bean.validateLastName(last_name) == true && signup_validation_bean.validateEmail(email) == true && signup_validation_bean.validatePhone(phone) == true) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
                PreparedStatement sql = con.prepareStatement("UPDATE `user_info` SET `first_name` = ?, `last_name` = ?, `email` = ?, `phone` = ? WHERE `user_id` = ?");

                sql.setString(1, first_name);
                sql.setString(2, last_name);
                sql.setString(3, email);
                sql.setString(4, phone);
                sql.setString(5, user_id);

                int status = sql.executeUpdate();
                if(status > 0) {
                    session.setAttribute("profile_changed", "1");
                    response.sendRedirect("redirector.jsp");
                } else {
                    response.sendRedirect("404.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
        
        <!--Scripts
        ============================================================-->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<script src="js/main.js"></script>-->
    </body>
</html>
