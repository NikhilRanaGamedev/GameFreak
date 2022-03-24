<%-- 
    Document   : orders
    Created on : Dec 29, 2018, 3:45:13 PM
    Author     : NightPredetor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int purchases = 0;
    int purchase_id = 0;
    int game_id = 0;
    String name = "";
    String platform = "";
    float original_price = 0;
    float sale_price = 0;
    String cover = "";
    float save = 0;
    float off = 0;
    String status = "";
    String refund = "";
%>
<%
    String user_id = (String)session.getAttribute("user_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql2 = con.prepareStatement("SELECT COUNT(*) FROM `purchases` WHERE `user_id` = ?");

    sql2.setString(1, user_id);

    ResultSet rs2 = sql2.executeQuery();
    if(rs2.next()) {
        purchases = rs2.getInt("count(*)");
    }
    
    PreparedStatement sql = con.prepareStatement("SELECT * FROM `purchases` WHERE `user_id` = ?");

    sql.setString(1, user_id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>GameFreak: Orders</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/duDialog.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>            
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
            
            input[name="refund"], input[name="return_order"], input[name="cancel_delivery"] {
                padding: 3px 0;
                background: transparent;
                border: 0px solid black;
                font-weight: 600;
                color: #E02A2A;
            }
            
            input[name="delete"]:hover {
                color: #F2140D;
            }
            
            form {
                display: inline;
            }
        </style>
        </head>
    <body>
        <jsp:include page="header.jsp" />
        
        <%
        if(purchases > 0) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="fw" style="font-family: Vtks Velhos Tempos;">GameFreak&emsp;Orders&emsp;Management</h1>
                </div>
                <div class="col-md-6">
                    <h3 class="fw" style="font-family: MetalMacabre;">Game</h3>
                </div>
                <div class="col-md-3 col-md-offset-1">
                    <h3 class="fw" style="font-family: MetalMacabre;">Price</h3>
                </div>
            </div>
                <br />
                <%
                    ResultSet rs = sql.executeQuery();
                    int i = 0;
                    while(rs.next()) {
                        i++;
                       purchase_id = rs.getInt("purchase_id");
                       game_id = rs.getInt("game_id");
                       name = rs.getString("name");
                       platform = rs.getString("platform");
                       original_price = rs.getFloat("original_price");
                       sale_price = rs.getFloat("sale_price");
                       cover = rs.getString("cover");
                       status = rs.getString("status");
                       refund = rs.getString("refund");
                       
                       save = original_price - sale_price;
                       off = Math.round((save/original_price)*100);
                %>
                
                <div class="row">
                    <div class="col-md-1">
                        <img src="<%= cover %>" />
                    </div>
                    <div class="col-md-5">
                        <a class="fw game_name" href="buy.jsp?game_id=<%= game_id %>"><%= name %></a>
                        <h5>Fulfilled by <a href="index.jsp">GameFreak</a></h5>
                        <%
                            if(status.equals("delivery")) {
                        %>
                        <span style="color: #24C13A;" class="fw">Status: On the way</span>
                        <br><br>
                        <form class="common_cancel_form" action="cancel_delivery" method="POST" id="cancelFrm<%= i %>">
                            <input type="hidden" name="purchase_id" value="<%= purchase_id %>" />
                            <input type="hidden" name="formId" value="cancelFrm<%= i %>"/>
                            <i style="font-size: 15px; color: red;" class="fas fa-times"></i>
                            <i style="font-size: 20px; color: red;" class="fas fa-truck"></i>&nbsp;
                            <input class="common_cancel" type="button" name="cancel_delivery" value="Cancel Delivery" />&nbsp;
                        </form>
                        <%
                            }
                        %>
                        
                        <%
                            if(status.equals("cancelled")) {
                        %>
                            <span style="color: red;" class="fw">Status: Cancelled</span>
                        <%
                            }
                        %>
                        
                        <%
                            if(status.equals("delivered")) {
                        %>
                        <span style="color: #24C13A;" class="fw">Status: Delivered Successfully</span>
                        <br><br>
                        <form class="common_refund_form" action="refund" method="POST">
                            <input type="hidden" name="purchase_id" value="<%= purchase_id %>" />
                            <input type="hidden" name="formId" value="refundFrm<%= i %>"/>
                            <i style="font-size: 20px; color: red;" class="fas fa-cash-register"></i>&nbsp;
                            <input class="common_refund" title="Return and Refund" type="button" name="refund" value="Refund" />&nbsp;<span style="font-size: 20px;" class="fw">|</span>&nbsp;
                        </form>
                        <form class="common_return_form" action="return_order" method="POST">
                            <input type="hidden" name="purchase_id" value="<%= purchase_id %>" />
                            <input type="hidden" name="formId" value="returnFrm<%= i %>"/>
                            <i style="font-size: 20px; color: red;" class="fas fa-exchange-alt"></i>&nbsp;
                            <input class="common_return" title="Defective Piece: Exchange with another copy" type="button" name="return_order" value="Replace" />
                        </form>
                        <%
                            }
                        %>
                        <%
                            if(refund.equals("pending") && status.equals("refund")) {
                        %>
                        <span style="color: red;" class="fw">Status: Refund Placed. Order to be picked up.</span>
                        <%
                            } else if(refund.equals("done") && status.equals("refund")) {
                        %>
                        <span style="color: #24C13A;" class="fw">Status: Refund Placed. Order picked up.</span>
                        <%
                            }
                        %>
                        <%
                            if(refund.equals("pending") && status.equals("refund")) {
                        %>
                        <br><br><span style="color: red;" class="fw">Refund will be initiated within 2-3 days.</span>
                        <%
                            } else if(refund.equals("done") && status.equals("refund")) {
                        %>
                        <br><br><span style="color: #24C13A;" class="fw">Refund Initiated&nbsp;<i class="fas fa-check"></i></span>
                        <%
                            }
                        %>
                        <%
                            if(refund.equals("pending") && status.equals("return")) {
                        %>
                        <span style="color: red;" class="fw">Status: Return Placed. Order to be picked up for exchange.</span>
                        <%
                            }
                        %>
                        <%
                            if(refund.equals("pending") && status.equals("return")) {
                        %>
                        <br><br><span style="color: red;" class="fw">Return exchange will be done within 2 - 4 working days.</span>
                        <%
                            } else if(refund.equals("done") && status.equals("return")) {
                        %>
                        <span style="color: #24C13A;" class="fw">Return Completed&nbsp;<i class="fas fa-check"></i></span>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-md-3 col-md-offset-1">
                        <label>
                        MRP:&nbsp;
                        </label>
                        <del><i class="fas fa-rupee-sign"></i>&nbsp;<span class="fw" style="color:red;"><%= original_price %>0</span></del>
                        <br>
                        <label>
                            Price:&nbsp;
                        </label>
                        <i class="fas fa-rupee-sign"></i>&nbsp;<span class="fw" style="color: #24C13A;"><%= sale_price %>0</span>
                        <br>
                        <label>
                            You Save:&nbsp;
                        </label>
                        <i class="fas fa-rupee-sign"></i>&nbsp;<span class="fw" style="color: #24C13A;"><%= save %>0 (<%= off %>%)</span>
                    </div>
                </div>
                <hr>
                <%
                    }
                %>
        </div>
        <%
            } else {
        %>
            <img class="img-responsive" style="width:100%" src="images/clock.jpg" />
        <%
            }
        %>
        
        <jsp:include page="footer.jsp" />
        
        <div ng-app="myApp">
            <jsp:include page="profile_modal.jsp" />
            <jsp:include page="address_modal.jsp" />
        </div>
        
    <!--Scripts
    ============================================================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/angular-messages.min.js"></script>
    <script src="js/duDialog.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $('.common_cancel').on('click',function(){
            var button = $(this);
        new duDialog('Confirm Cancellation', 'Are You Sure?', duDialog.OK_CANCEL, { 
            okText: 'Confirm',
            callbacks: {
              okClick: function(){
                  button.parent().submit();
              },
              cancelClick: function(){
                this.hide();
              }
            }
        });
    });
    
    $('.common_refund').on('click',function(){
        var button = $(this);
        new duDialog('Confirm Refund', 'Are You Sure?', duDialog.OK_CANCEL, { 
            okText: 'Refund',
            callbacks: {
              okClick: function(){
                button.parent().submit();
              },
              cancelClick: function(){
                this.hide();
              }
            }
        });
    });
    
    $('.common_return').on('click',function(){
        var button = $(this);
        new duDialog('Confirm Return', 'Are You Sure?', duDialog.OK_CANCEL, { 
            okText: 'Return',
            callbacks: {
              okClick: function(){
                button.parent().submit();
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