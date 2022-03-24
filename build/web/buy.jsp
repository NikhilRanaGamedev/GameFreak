<%-- 
    Document   : buy
    Created on : Dec 5, 2018, 7:02:58 PM
    Author     : NightPredetor
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    String name = "";
    String pc_name = "";
    String ps4_name = "";
    String xbox_name = "";
   
    int pc_price = 0;
    int pc_sale = 0;

    int ps4_price = 0;
    int ps4_sale = 0;

    int xbox_price = 0;
    int xbox_sale = 0;

    String pc_price_convert = "";
    String pc_sale_convert = "";
    
    String ps4_price_convert = "";
    String ps4_sale_convert = "";
    
    String xbox_price_convert = "";
    String xbox_sale_convert = "";
    
    float pc_save = 0;
    float ps4_save = 0;
    float xbox_save = 0;
    
    float pc_off = 0;
    float ps4_off = 0;
    float xbox_off = 0;
    
    String pc_cover = "";
    String ps4_cover = "";
    String xbox_cover = "";

    float rating = 0;
    
    String rated = "";

    String disc_1 = "";
    String disc_2 = "";
    String disc_3 = "";
    
    int pc_stock = 0;
    int ps4_stock = 0;
    int xbox_stock = 0;
    
    String show_name = "";
    String show_cover = "";
    String show_price = "";
    String show_sale_price = "";
    String show_platform = "";
    float show_save = 0;
    float show_off = 0;
    int show_stock = 0;
    
    String show_logo = "";
    
    String add_to_cart_valid() {
        String x = "";
        if(show_stock <= 0) {
            x = "style='cursor: not-allowed;' disabled";
        }
        return x;
    }
%>
<% 
   String game_id = request.getParameter("game_id");
   if(game_id.equals("")) {
       response.sendRedirect("index.jsp");
   }
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
   PreparedStatement sql = con.prepareStatement("SELECT * FROM `games` WHERE `game_id` = ?");
   sql.setString(1, game_id);
   
   ResultSet rs = sql.executeQuery();
   while(rs.next()) {
       name = rs.getString("name");
       
       pc_name = rs.getString("pc_name");
       ps4_name = rs.getString("ps4_name");
       xbox_name = rs.getString("xbox_name");
       
       pc_price = rs.getInt("pc_price");
       pc_sale = rs.getInt("pc_sale");
       
       ps4_price = rs.getInt("ps4_price");
       ps4_sale = rs.getInt("ps4_sale");
       
       xbox_price = rs.getInt("xbox_price");
       xbox_sale = rs.getInt("xbox_sale");
       
       pc_cover = rs.getString("pc_cover");
       ps4_cover = rs.getString("ps4_cover");
       xbox_cover = rs.getString("xbox_cover");
       
       rating = rs.getFloat("rating");
       
       rated = rs.getString("rated");
       
       disc_1 = rs.getString("disc_1");
       disc_2 = rs.getString("disc_2");
       disc_3 = rs.getString("disc_3");
       
       pc_stock = rs.getInt("pc_stock");
       ps4_stock = rs.getInt("ps4_stock");
       xbox_stock = rs.getInt("xbox_stock");
   }
   if(pc_sale > 999) {
    pc_price_convert = String.valueOf(pc_price).charAt(0)+","+String.valueOf(pc_price).substring(1)+".00";
    pc_sale_convert = String.valueOf(pc_sale).charAt(0)+","+String.valueOf(pc_sale).substring(1)+".00";
   } else {
    pc_price_convert = String.valueOf(pc_price);
    pc_sale_convert = String.valueOf(pc_sale);
   }
   
   if(ps4_sale > 999) {
    ps4_price_convert = String.valueOf(ps4_price).charAt(0)+","+String.valueOf(ps4_price).substring(1)+".00";
    ps4_sale_convert = String.valueOf(ps4_sale).charAt(0)+","+String.valueOf(ps4_sale).substring(1)+".00";
   } else {
    ps4_price_convert = String.valueOf(ps4_price);   
    ps4_sale_convert = String.valueOf(ps4_sale);
   }
   
   if(xbox_sale > 999) {
    xbox_price_convert = String.valueOf(xbox_price).charAt(0)+","+String.valueOf(xbox_price).substring(1)+".00";
    xbox_sale_convert = String.valueOf(xbox_sale).charAt(0)+","+String.valueOf(xbox_sale).substring(1)+".00";
   } else {
    xbox_price_convert = String.valueOf(xbox_price);   
    xbox_sale_convert = String.valueOf(xbox_sale);
   }
   
   pc_save = pc_price - pc_sale;
   ps4_save = ps4_price - ps4_sale;
   xbox_save = xbox_price - xbox_sale;
       
   pc_off = Math.round((pc_save/pc_price)*100);
   ps4_off = Math.round((ps4_save/ps4_price)*100);
   xbox_off = Math.round((xbox_save/xbox_price)*100);
   
   if(pc_price != 0) {
       show_name = pc_name;
       show_cover = pc_cover;
       show_price = pc_price_convert;
       show_sale_price = pc_sale_convert;
       show_platform = "PC";
       show_save = pc_save;
       show_off = pc_off;    
       show_stock = pc_stock;
       show_logo = "<i class='fas fa-desktop'></i>&nbsp;";
   }
   
   else if(ps4_price != 0) {
       show_name = ps4_name;
       show_cover = ps4_cover;
       show_price = ps4_price_convert;
       show_sale_price = ps4_sale_convert;
       show_platform = "PS4";
       show_save = ps4_save;
       show_off = ps4_off;
       show_stock = ps4_stock;
       show_logo = "<i class='fab fa-playstation'></i>&nbsp;";
   }
   
   else {
       show_name = xbox_name;
       show_cover = xbox_cover;
       show_price = xbox_price_convert;
       show_sale_price = xbox_sale_convert;
       show_platform = "Xbox One";
       show_save = xbox_save;
       show_off = xbox_off;
       show_stock = xbox_stock;
       show_logo = "<i class='fab fa-xbox'></i>&nbsp;";
   }
   
   if(session.getAttribute("user_id") != null) {
        String user_id = (String)session.getAttribute("user_id");
        PreparedStatement user_sql = con.prepareStatement("SELECT * FROM `user_info` WHERE `user_id` = ?");

        user_sql.setString(1, user_id);
        
        ResultSet user_rs = user_sql.executeQuery();
        if(user_rs.next()) {
            
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Buy <%= name %> | GameFreak</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <br>
                        <img class="img-responsive" id="game_cover" src="<%= show_cover %>">
                    </div>
                    <div class="col-md-4">
                        <br>
                        <br>
                        <br>
                        <strong><font size="4"><span id="game_name"><%= show_name %> (<%= show_platform %>)</span></font></strong>
                        <br>
                        <strong>Platform: <span id="game_platform"><%= show_logo+show_platform %></span> | Rated: Age <%= rated %>+</strong>
                        <br>
                        <font color="#E1D22D">
                        <%
                            int j = (int) rating;
                            for(int i = 0; i < j; i++) {
                                out.println("<i class='fa fa-star'></i>");
                            }
                            if(rating == 0.5 || rating == 1.5 || rating == 2.5 || rating == 3.5 || rating == 4.5) {
                                out.println("<i class='fas fa-star-half'></i>");
                            }
                        %>
                        </font>
                        <br>
                        <hr>
                        M.R.P.: <del>
                            <i class="fas fa-rupee-sign"></i>
                            <span id="mrp"> <%= show_price %></span>
                        </del>
                        <br>
                        <strong>
                            <font color="#CF1515" size="4">Price: 
                            <i class="fas fa-rupee-sign"></i>
                            <span id="price"> <%= show_sale_price %></span>
                            </font>
                        </strong> 
                        <font color="#90908D">
                            Inclusive of all taxes
                        </font>
                        <br>
                        You Save: <font color="#EF1B08">
                            <i class="fas fa-rupee-sign"></i>
                            <span id="price_off"> <%= show_save %> (<%= show_off %>%)</span>
                        </font>
                        <br>
                        <br>
                        <strong>
                            <%
                                if(show_stock > 0) {
                            %>
                            <font color="#48B316" size="3" id="stock"><%= show_stock %>pc(s)&nbsp;In stock</font>
                            <%
                                } else {
                            %>
                            <font color="red" size="3" id="stock">Out of Stock</font>
                            <%
                                }
                            %>
                        </strong>
                        <br>
                        <strong>Sold and Fulfilled by </strong>
                        <a href="index.jsp" class="fw">GameFreak.</a>
                        <br>
                        <br>
                        <strong>
                            <font color="#878683">Hardware Platform: </font>
                        </strong>
                        <strong>
                            <span id="hardware_platform"><%= show_logo+show_platform %></span>
                        </strong>
                        <br>
                        <%
                            if(pc_price != 0)
                                out.println("<button class='platform_btn' onclick='pc_change()' type='button'><i class='fas fa-desktop'></i>&nbsp;PC</button>");
                            else
                                out.println("<button class='platform_btn' data-toggle='popover' data-content='Not Available' data-placement='bottom' data-trigger='focus' type='button'><i class='fas fa-desktop'></i>&nbsp;PC</button>");
                            if(ps4_price != 0)
                                out.println("<button class='platform_btn' onclick='ps4_change()' type='button'><i class='fab fa-playstation'></i>&nbsp;PS4</button>");
                            else
                                out.println("<button class='platform_btn' data-toggle='popover' data-content='Not Available' data-placement='bottom' data-trigger='focus' type='button'><i class='fab fa-playstation'></i>&nbsp;PS4</button>");
                            if(xbox_price != 0)
                                out.println("<button class='platform_btn' onclick='xbox_change()' type='button'><i class='fab fa-xbox'></i>&nbsp;Xbox One</button>");
                            else
                                out.println("<button class='platform_btn' data-toggle='popover' data-content='Not Available' data-placement='bottom' data-trigger='focus' type='button'><i class='fab fa-xbox'></i>&nbsp;Xbox One</button>");
                        %>
                        <br>
                        <br>
                        <ul id="discription">
                            <li><%= disc_1 %></li>
                            <li><%= disc_2 %></li>
                            <li><%= disc_3 %></li>
                        </ul>
                    </div>
                        
                    <div class="col-md-4">
                        <br>
                        <br>
                        <br>
                        <div id="purchase_protection_box" class="container">
                            <strong><font size="3" color="#90908D">GameFreak Purchase Protection</font></strong>
                            <br>
                            <strong>&ensp;
                                <font size="2" color="#EF1B08">Original Products | Secure Payments</font>
                            </strong>
                        </div>
                        <form name="buy_form" method="POST" novalidate>
                        <div id="purchase_buttons_box" class="container">
                            <input type="hidden" name="game_id" value="<%= game_id %>" />
                            <input type="hidden" id="platform" name="game_platform" value="<%= show_platform %>" />
                                <strong>
                                    <input id="add_to_cart" class="purchase_buttons" formaction="add_to_cart" type="submit" name="add_to_cart" value="&#xf217 Add to Cart" <%= add_to_cart_valid() %> />
                                </strong>
                                    <br>
                                <hr>
                                <strong>
                                    <input class="purchase_buttons" formaction="add_to_wishlist" type="submit" name="add_to_wishlist" value="&#xf0fe Add to Wishlist" />
                                </strong>
                                <br>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <br>
            
    <jsp:include page="footer.jsp" />
    
    <div ng-app="myApp">
        <jsp:include page="signup_modal.jsp" />

        <jsp:include page="login_modal.jsp" />

        <jsp:include page="profile_modal.jsp" />
    </div>
                
    <!--Scripts
    ============================================================-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/angular-messages.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        function pc_change(){
                document.getElementById("game_cover").src="<%= pc_cover %>";
                document.getElementById("game_name").innerHTML="<%= pc_name %> (PC)";
                document.getElementById("hardware_platform").innerHTML="<i class='fas fa-desktop'></i>&nbsp;PC";
                document.getElementById("game_platform").innerHTML="<i class='fas fa-desktop'></i>&nbsp;PC";
                document.getElementById("mrp").innerHTML=" <%= pc_price_convert %>";
                document.getElementById("price").innerHTML=" <%= pc_sale_convert %>";
                document.getElementById("price_off").innerHTML=" <%= pc_save %> (<%= pc_off %>%)";
                document.getElementById("platform").value = "PC";
                var stock_var = <%= pc_stock %>;
                if(stock_var > 0) {
                    document.getElementById("stock").innerHTML="<%= pc_stock %>pc(s)&nbsp;In stock";
                    document.getElementById("stock").style.color="#48B316";
                    document.getElementById("add_to_cart").disabled = false;
                    document.getElementById("add_to_cart").style.cursor = "pointer";;
                } else {
                    document.getElementById("stock").innerHTML="Out of Stock";
                    document.getElementById("stock").style.color="red";
                    document.getElementById("add_to_cart").disabled = true;
                    document.getElementById("add_to_cart").style.cursor = "not-allowed";
                }
            }

            function ps4_change(){
                document.getElementById("game_cover").src="<%= ps4_cover %>";
                document.getElementById("game_name").innerHTML="<%= ps4_name %> (PS4)";
                document.getElementById("hardware_platform").innerHTML="<i class='fab fa-playstation'></i>&nbsp;PS4";
                document.getElementById("game_platform").innerHTML="<i class='fab fa-playstation'></i>&nbsp;PS4";
                document.getElementById("mrp").innerHTML=" <%= ps4_price_convert %>";
                document.getElementById("price").innerHTML=" <%= ps4_sale_convert %>";
                document.getElementById("price_off").innerHTML=" <%= ps4_save %> (<%= ps4_off %>%)";
                document.getElementById("platform").value = "PS4";
                var stock_var = <%= ps4_stock %>;
                if(stock_var > 0) {
                    document.getElementById("stock").innerHTML="<%= ps4_stock %>pc(s)&nbsp;In stock";
                    document.getElementById("stock").style.color="#48B316";
                    document.getElementById("add_to_cart").disabled = false;
                    document.getElementById("add_to_cart").style.cursor = "pointer";;
                } else {
                    document.getElementById("stock").innerHTML="Out of Stock";
                    document.getElementById("stock").style.color="red";
                    document.getElementById("add_to_cart").disabled = true;
                    document.getElementById("add_to_cart").style.cursor = "not-allowed";
                }
            }

            function xbox_change(){
                document.getElementById("game_cover").src="<%= xbox_cover %>";
                document.getElementById("game_name").innerHTML="<%= xbox_name %> (Xbox One)";
                document.getElementById("hardware_platform").innerHTML="<i class='fab fa-xbox'></i>&nbsp;Xbox One";
                document.getElementById("game_platform").innerHTML="<i class='fab fa-xbox'></i>&nbsp;Xbox One";
                document.getElementById("mrp").innerHTML=" <%= xbox_price_convert %>";
                document.getElementById("price").innerHTML=" <%= xbox_sale_convert %>";
                document.getElementById("price_off").innerHTML=" <%= xbox_save %> (<%= xbox_off %>%)";
                document.getElementById("platform").value = "Xbox";
                var stock_var = <%= xbox_stock %>;
                if(stock_var > 0) {
                    document.getElementById("stock").innerHTML="<%= xbox_stock %>pc(s)&nbsp;In stock";
                    document.getElementById("stock").style.color="#48B316";
                    document.getElementById("add_to_cart").disabled = false;
                    document.getElementById("add_to_cart").style.cursor = "pointer";;
                } else {
                    document.getElementById("stock").innerHTML="Out of Stock";
                    document.getElementById("stock").style.color = "red";
                    document.getElementById("add_to_cart").disabled = true;
                    document.getElementById("add_to_cart").style.cursor = "not-allowed";
                }
            }
        $(document).ready(function(){
            $('[data-toggle="popover"]').popover(); 
        });
        <%
            if(session.getAttribute("login_prompt") == "1") {
        %>
            $('#login').modal({
                show: 'true'
            }); 
        <%
            session.removeAttribute("login_prompt");
            }
        %>
    </script>
    </body>
</html>