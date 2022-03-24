<%-- 
    Document   : address_validation
    Created on : Dec 25, 2018, 4:07:54 PM
    Author     : NightPredetor
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = (String)session.getAttribute("user_id");
    String full_name = request.getParameter("full_name");
    String phone = request.getParameter("phone");
    String pincode = request.getParameter("pincode");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String landmark = request.getParameter("landmark");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String address_type = request.getParameter("address_type");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    PreparedStatement sql = con.prepareStatement("INSERT INTO `address`(user_id, full_name, phone, pincode, address1, address2, landmark, city, state, address_type) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    sql.setString(1, user_id);
    sql.setString(2, full_name);
    sql.setString(3, phone);
    sql.setString(4, pincode);
    sql.setString(5, address1);
    sql.setString(6, address2);
    sql.setString(7, landmark);
    sql.setString(8, city);
    sql.setString(9, state);
    sql.setString(10, address_type);

    int status = sql.executeUpdate();
    if(status > 0) {
        session.setAttribute("address_updated", "1");
        response.sendRedirect("address.jsp");
    } else {
        response.sendRedirect("404.jsp");
    }
%>
