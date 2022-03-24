<%-- 
    Document   : signup_validation
    Created on : Dec 14, 2018, 1:08:07 PM
    Author     : NightPredetor
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
%>
    <jsp:useBean id="signup_validation_bean" class="beans.signup_validation">
        <jsp:setProperty name="signup_validation_bean" property = "*" />
    </jsp:useBean>
<%   
    if(signup_validation_bean.validateFirstName(first_name) == false) {
        session.setAttribute("first_name_error", "1");
    }

    if(signup_validation_bean.validateLastName(last_name) == false) {
        session.setAttribute("last_name_error", "1");
    }

    if(signup_validation_bean.validateEmail(email) == false) {
        session.setAttribute("email_error", "1");
    }

    if(signup_validation_bean.validatePhone(phone) == false) {
        session.setAttribute("phone_error", "1");
    }

    if(signup_validation_bean.validatePassword(password) == false) {
        session.setAttribute("password_error", "1");
    }

    if(signup_validation_bean.validateFirstName(first_name) == true && signup_validation_bean.validateLastName(last_name) == true && signup_validation_bean.validateEmail(email) == true && signup_validation_bean.validatePhone(phone) == true && signup_validation_bean.validatePassword(password) == true) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
            PreparedStatement sql = con.prepareStatement("INSERT INTO `user_info`(first_name, last_name, email, phone, password) VALUES(?, ?, ?, ?, ?)");

            sql.setString(1, first_name);
            sql.setString(2, last_name);
            sql.setString(3, email);
            sql.setString(4, phone);
            sql.setString(5, password);

            int status = sql.executeUpdate();
            if(status > 0) {
                response.sendRedirect("index_redirector.jsp");
            } else {
                response.sendRedirect("404.jsp");
            }
        } catch (com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException ex) {
            session.setAttribute("same_email", "1");
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>