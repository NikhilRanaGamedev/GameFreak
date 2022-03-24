<%-- 
    Document   : order_placed_modal
    Created on : Dec 28, 2018, 12:09:46 AM
    Author     : NightPredetor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String full_name = "";
    String phone = "";
    String pincode = "";
    String address1 = "";
    String address2 = "";
    String landmark = "";
    String city = "";
    String state = "";
    String address_type = "";
%>
<%
    String user_id = (String)session.getAttribute("user_id");
    String address_id = (String)session.getAttribute("address_id");
    String total_price = (String)session.getAttribute("total_price");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql = con.prepareStatement("SELECT * FROM `address` WHERE `user_id` = ? && `address_id` = ?");

    sql.setString(1, user_id);
    sql.setString(2, address_id);
    
    ResultSet rs = sql.executeQuery();
    if(rs.next()) {
        full_name = rs.getString("full_name");
        phone = rs.getString("phone");
        pincode = rs.getString("pincode");
        address1 = rs.getString("address1");
        address2 = rs.getString("address2");
        landmark = rs.getString("landmark");
        city = rs.getString("city");
        state = rs.getString("state");
        address_type = rs.getString("address_type");
    }
%>
<div id="order_placed" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="row">
                <div class="col-md-11 col-md-offset-2">
                    <h2 class="fw" style="font-family: a_dark_wedding;">GameFreak Order Management</h2>
                </div>
                <div class="col-md-10 col-md-offset-2">
                    <h4 class="fw" style="color: #24C13A; padding-left: 20px;">Your address was placed successfully !</h4>
                </div>
                <div class="col-md-7 col-md-offset-3">
                    <h4 class="fw">
                    Your order will be delivered to :
                    <br><br>
                    <%= "Address Type: "+address_type%>
                    <br>
                    <%= full_name %>
                    <br>
                    <%= address1+"," %>
                    <br>
                    <%= address2+"," %>
                    <br>
                    <%= landmark+"," %>
                    <br>
                    <%= city+"," %>
                    <%= state %>
                    <br>
                    <%= pincode %>
                    <br>
                    <%= phone %>
                    </h4>
                </div>
                <br>
                <br>
                <br>
                <div class="col-md-6 col-md-offset-3">
                    <h4 class="fw">Total Price: <i class="fas fa-rupee-sign"></i>&nbsp;<%= total_price %>.00<br>Amount will be picked at the time of delivery.</h4>
                </div>
                <div class="col-md-6 col-md-offset-3">
                    <h4 class="fw"><a href="orders.jsp">View Your Placed Orders</a></h4>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
