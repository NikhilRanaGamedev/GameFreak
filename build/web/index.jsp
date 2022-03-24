<%-- 
    Document   : index
    Created on : Dec 5, 2018, 11:13:38 AM
    Author     : NightPredetor
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    session.removeAttribute("address_checkout");
    session.removeAttribute("otp");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>GameFreak: Never Sleep</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />
        
        <div id="carousel" class="carousel slide" data-ride="carousel" data-interval="2500">
            <div class="carousel-inner">
                <div class="item active">
                    <a href="buy.jsp?game_id=${1}"><img src="images/witcher3.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${2}"><img src="images/skyrim.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${3}"><img src="images/gtaV.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${4}"><img src="images/farcry4.png"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${5}"><img src="images/darksouls3.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${6}"><img src="images/pubg.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${7}"><img src="images/overwatch.png"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${8}"><img src="images/godofwar.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${9}"><img src="images/assassin's_creed_odyssey.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${10}"><img src="images/lol.png"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${11}"><img src="images/dota2.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${12}"><img src="images/csgo.jpg"></a>
                </div>
                <div class="item">
                    <a href="buy.jsp?game_id=${13}"><img src="images/rainbowsixsiege.png"></a>
                </div>
            </div>

            <a class="left carousel-control" href="#carousel" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
            <a class="right carousel-control" href="#carousel" data-slide="next"><i class="fas fa-chevron-right"></i></a>
        </div>
	
    <jsp:include page="footer.jsp" />
    <div ng-app="myApp">
        <jsp:include page="signup_modal.jsp" />

        <jsp:include page="login_modal.jsp" />

        <jsp:include page="profile_modal.jsp" />
        
        <jsp:include page="address_modal.jsp" />
        
        <jsp:include page="order_placed_modal.jsp" />
    </div>
                
    <!--Scripts
    ============================================================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/angular-messages.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        <%
            if(session.getAttribute("wrong") == "1") {
        %>
            $('#login').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("wrong");
            }
        %>
            
        <%
            if(session.getAttribute("profile_changed") == "1") {
        %>
            $('#profile').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("profile_changed");
            }
        %>
            
        <%
            if(session.getAttribute("first_name_error") != null || session.getAttribute("last_name_error") != null || session.getAttribute("email_error") != null || session.getAttribute("phone_error") != null || session.getAttribute("password_error") != null || session.getAttribute("same_email") != null) {
        %>
            $('#signup').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("first_name_error");
            session.removeAttribute("last_name_error");
            session.removeAttribute("email_error");
            session.removeAttribute("phone_error");
            session.removeAttribute("password_error");
            session.removeAttribute("same_email");
            }
        %>
            
        <%
            if(session.getAttribute("profile_first_name_error") != null || session.getAttribute("profile_last_name_error") != null || session.getAttribute("profile_email_error") != null || session.getAttribute("profile_phone_error") != null) {
        %>
            $('#profile').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("profile_first_name_error");
            session.removeAttribute("profile_last_name_error");
            session.removeAttribute("profile_email_error");
            session.removeAttribute("profile_phone_error");
            }
        %>
            
        <%
            if(session.getAttribute("order_placed") == "1") {
        %>
            $('#order_placed').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("order_placed");
            session.removeAttribute("total_price");
            session.removeAttribute("address_id");
            }
        %>
    </script>
</body>
</html>