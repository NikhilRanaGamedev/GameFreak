<%-- 
    Document   : address
    Created on : Dec 25, 2018, 4:29:35 PM
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
    String user_id = (String)session.getAttribute("user_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql2 = con.prepareStatement("SELECT COUNT(*) FROM `address` WHERE `user_id` = ?");

    sql2.setString(1, user_id);

    ResultSet rs2 = sql2.executeQuery();
    if(rs2.next()) {
        addresses = rs2.getInt("count(*)");
    }
    
    PreparedStatement sql = con.prepareStatement("SELECT * FROM `address` WHERE `user_id` = ?");

    sql.setString(1, user_id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>GameFreak: Address</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>
            @font-face {
                font-family: Vtks Velhos Tempos;
                src: url("css/fonts/Vtks Velhos Tempos.ttf");
            }
            
            .container {
                padding-top: 5.5em;
                padding-bottom: 5.5em;
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
            
            input[name="delete"], input[name="update"] {
                padding: 10px 0;
                background: transparent;
                border: 0px solid black;
                font-weight: 600;
                color: #E02A2A;
            }
            
            input[name="delete"]:hover {
                color: #F2140D;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <%
            if(addresses > 0) {
        %>
        <div class="container">
            <div class="row">
                <h1 class="fw">GameFreak&nbsp;Address&nbsp;Management</h1>
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
                <div class="col-md-5 form-group">
                    <textarea class="form-control" rows="10" cols="30"><%=
                            "Address Type: "+address_type+"\n\n"+full_name+",\n"+address1+",\n"+address2+",\n"+landmark+",\n"+city+", "+state+"\n"+pincode+"\n"+phone
                        %></textarea>
                    <form method="POST" action="delete_address">
                        <input type="hidden" name="address_id" value="<%= address_id %>" />
                        <input type="submit" name="delete" value="Delete" />
                    </form>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <%
            } else {
        %>
            <img class="img-responsive" style="width:100%" src="images/empty_house.jpg" />
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
    <script src="js/main.js"></script>
    <script>
        <%
            if(session.getAttribute("address") == "1") {
        %>
            $('#address').modal({
                show: 'true'
            });
        <%
            session.removeAttribute("address");
            }
        %>
            
        <%
            if(session.getAttribute("address_updated") == "1") {
        %>
            $('#address').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("address_updated");
            }
        %>
    </script>
</body>
</html>