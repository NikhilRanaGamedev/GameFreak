<%-- 
    Document   : 404
    Created on : Dec 14, 2018, 6:52:20 PM
    Author     : NightPredetor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    <body ng-app="myApp" ng-controller="myController">
        <jsp:include page="header.jsp" />

        <div>
            <img class="img-responsive" style="width:100%" src="images/404.png" />
        </div>
        
        <jsp:include page="footer.jsp" />
                
        <jsp:include page="signup_modal.jsp" />

        <jsp:include page="login_modal.jsp" />
                
    <!--Scripts
    ============================================================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/angular-messages.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        setTimeout("window.location='index.jsp'", 3000);
    </script>
    </body>
</html>