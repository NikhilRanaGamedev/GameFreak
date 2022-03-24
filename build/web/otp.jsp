<%-- 
    Document   : otp
    Created on : Dec 31, 2018, 5:15:19 PM
    Author     : NightPredetor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int tries = 3;
%>
<%
    if(session.getAttribute("otp") == null) {
        tries = 3;
        response.setIntHeader("Refresh", 1);
        response.sendRedirect("index.jsp");
    }
    
    String otp = (String)session.getAttribute("otp");
    String otp_submit = request.getParameter("otp");
    
    if(otp_submit == null) {
       otp_submit = "";
    } else if(otp_submit.equals(otp)) {
        tries = 3;
        response.sendRedirect("order_placement");
    } else {
        tries--;
        otp_submit = "";
    }
    
    if(tries == 0) {
        tries = 3;
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>GameFreak: OTP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>
            .container {
                padding-top: 5.5em;
                padding-bottom: 5.5em;
            }
        </style>
    </head>
    <body ng-app="myApp">
        <jsp:include page="header.jsp" />
        
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-md-offset-3">
                    <h1>GameFreak OTP Confirmation</h1>
                    <h5 class="fw col-md-offset-2">An OTP has been sent to your email.</h5>
                </div>
                <form name="otp_form" action="otp.jsp" method="POST" class="form-group">
                    <div class="col-md-3 col-xs-6 col-sm-6 col-md-offset-4">
                        <input minlength="4" maxlength="4" class="form-control" type="password" name="otp" ng-model="otp" required />
                        <br>
                        <div style="padding-left: 1.5em;" ng-messages="otp_form.otp.$error" ng-show="otp_form.otp.$touched">
                            <p class="fw" ng-message="minlength">OTP cannot be shorter than 4 digits.</p>
                            <p style="padding-left: 10px;" class="fw col-md-offset-2" ng-message="required">OTP is required.</p>
                        </div>
                        <%
                            if(tries != 0 && tries !=3) {
                        %>
                        <p class="fw col-md-offset-1">Wrong OTP Entered. <%= tries %> Tries Left.</p>
                        <%
                            }
                        %>
                        <span class="col-md-offset-4 col-xs-offset-3 col-sm-offset-4"><input class="btn btn-info btn-md" type="submit" value="Submit" name="otp_btn" ng-disabled="otp_form.$invalid" /></span>
                    </div>
                </form>
            </div>
        </div>
                
        <jsp:include page="footer.jsp" />
        
        <div ng-app="myApp">
            <jsp:include page="profile_modal.jsp" />
        </div>
                
    <!--Scripts
    ============================================================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/angular-messages.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
