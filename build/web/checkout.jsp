<%-- 
    Document   : payment_gateway
    Created on : Dec 25, 2018, 2:18:37 AM
    Author     : NightPredetor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int addresses = 0;
    String address_id = "";
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
    String total_price = request.getParameter("total_price");
    String user_id = (String)session.getAttribute("user_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql2 = con.prepareStatement("SELECT COUNT(*) FROM `address` WHERE `user_id` = ?");

    sql2.setString(1, user_id);

    ResultSet rs2 = sql2.executeQuery();
    if(rs2.next()) {
        addresses = rs2.getInt("count(*)");
    }
    
    if(addresses <= 0) {
        session.setAttribute("address", "1");
        response.sendRedirect("address.jsp");
    }
    
    PreparedStatement sql = con.prepareStatement("SELECT * FROM `address` WHERE `user_id` = ?");

    sql.setString(1, user_id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>GameFreak: Checkout</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/duDialog.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>
            @font-face {
                font-family: Vtks Velhos Tempos;
                src: url("css/fonts/Vtks Velhos Tempos.ttf");
            }
            
            img {
                max-height: 100%;
                max-width: 100%;
            }
            
            #game_name {
                font-weight: 600;
                font-size: 1.5em;
            }
            
            h5 {
                font-weight: 600 !important;
            }
        </style>
    </head>
    <body ng-app="myApp">
        <jsp:include page="header.jsp" />
        
            <div class="container">
                <div class="row">
                <h1 class="fw">GameFreak&nbsp;Checkout&nbsp;Gateway</h1>
                <%
                    ResultSet rs = sql.executeQuery();
                    while(rs.next()) {
                        address_id = rs.getString("address_id");
                        full_name = rs.getString("full_name");
                        phone = rs.getString("phone");
                        pincode = rs.getString("pincode");
                        address1 = rs.getString("address1");
                        address2 = rs.getString("address2");
                        landmark = rs.getString("landmark");
                        city = rs.getString("city");
                        state = rs.getString("state");
                        address_type = rs.getString("address_type");
                %>
                <div class="col-md-4 col-md-offset-0 form-group">
                    <form id="checkout" name="checkout_form" method="POST" action="send_otp.jsp" novalidate>
                        <input type="radio" name="address" value="<%= address_id %>" ng-model="address" required />
                        <textarea class="form-control" rows="10" cols="30"><%= "Address Type: "+address_type+"\n\n"+full_name+",\n"+address1+",\n"+address2+",\n"+landmark+",\n"+city+", "+state+"\n"+pincode+"\n"+phone %></textarea>
                </div>
                <%
                    }
                %>
                <div style="padding-left: 1.5em;" ng-messages="checkout_form.address.$error" ng-show="checkout_form.address.$touched">
                        <p ng-message="required">Address is required.</p>
                </div>
                <div class="col-md-12 col-md-offset-0">
                    <input id="checkout_confirm" class="btn btn-info btn-lg btn-block" type="button" name="btn_address" value="Place Order" ng-disabled="checkout_form.$invalid"  />
                    </form>
                </div>
            </div>
            </div>
        <br>
        <jsp:include page="footer.jsp" />
        <jsp:include page="profile_modal.jsp" />
        <jsp:include page="address_modal.jsp" />
                    
    <!--Scripts
    ============================================================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/angular-messages.min.js"></script>
    <script src="js/duDialog.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $('#checkout_confirm').on('click',function(){
        new duDialog('Confirm Cancellation', 'Are You Sure?', duDialog.OK_CANCEL, { 
            okText: 'Confirm',
            callbacks: {
              okClick: function(){
                $('#checkout').submit();
              },
              cancelClick: function(){
                this.hide();
              }
            }
        });
    });
    </script>
    </body>
</html>