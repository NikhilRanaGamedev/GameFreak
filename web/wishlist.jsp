<%-- 
    Document   : wishlist
    Created on : Dec 24, 2018, 1:59:29 AM
    Author     : NightPredetor
--%>

<%-- 
    Document   : cart
    Created on : Dec 23, 2018, 2:41:31 AM
    Author     : NightPredetor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int items = 0;
%>
<%
    String user_id = (String)session.getAttribute("user_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql2 = con.prepareStatement("SELECT COUNT(*) FROM `wishlist` WHERE `user_id` = ?");

    sql2.setString(1, user_id);

    ResultSet rs2 = sql2.executeQuery();
    if(rs2.next()) {
        items = rs2.getInt("count(*)");
    }
    
    PreparedStatement sql = con.prepareStatement("SELECT `game_id`, `platform` FROM `wishlist` WHERE `user_id` = ?");
    
    sql.setString(1, user_id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>GameFreak: Wishlist</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="font awesome/css/all.css" />
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
            
            input[name="delete"], input[name="add_to_cart"] {
                padding: 3px 0;
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
        if(items > 0) {
        %>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="fw" style="font-family: Vtks Velhos Tempos;">GameFreak&emsp;WishList</h1>
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
                    while(rs.next()) {
                        String game_id = rs.getString("game_id");
                        String platform = rs.getString("platform");
                        
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM `games` WHERE `game_id` = ?");
    
                        ps.setString(1, game_id);
                        
                        ResultSet result = ps.executeQuery();
                        if(result.next()) {
                            String game_name = "";
                            String show_cover = "";
                            
                            float show_price = 0;
                            float show_sale = 0;
                            float show_save = 0;
                            float show_off = 0;
                            
                            int show_stock = 0;
                            
                            String wishlist_double_entry = "";
                            String game_platform = "";
                            
                            if(session.getAttribute("wishlist_double_entry") != null && session.getAttribute("platform") != null) {
                                wishlist_double_entry = (String)session.getAttribute("wishlist_double_entry");
                                game_platform = (String)session.getAttribute("platform");
                            }
                            
                            if(platform.equals("PC")) {
                                game_name = result.getString("pc_name")+" || PC";
                                show_cover = result.getString("pc_cover");
                                show_price = result.getInt("pc_price");
                                show_sale = result.getInt("pc_sale");
                                show_save = show_price - show_sale;
                                show_off = Math.round((show_save/show_price)*100);
                                show_stock = result.getInt("pc_stock");
                                
                            }
                            
                            if(platform.equals("PS4")) {
                                game_name = result.getString("ps4_name")+" || PS4";
                                show_cover = result.getString("ps4_cover");
                                show_price = result.getInt("ps4_price");
                                show_sale = result.getInt("ps4_sale");
                                show_save = show_price - show_sale;
                                show_off = Math.round((show_save/show_price)*100);
                                show_stock = result.getInt("ps4_stock");
                            }
                            
                            if(platform.equals("Xbox")) {
                                game_name = result.getString("xbox_name")+" || Xbox One";
                                show_cover = result.getString("xbox_cover");
                                show_price = result.getInt("xbox_price");
                                show_sale = result.getInt("xbox_sale");
                                show_save = show_price - show_sale;
                                show_off = Math.round((show_save/show_price)*100);
                                show_stock = result.getInt("xbox_stock"); 
                            }
                %>
                <div class="row">
                <div class="col-md-1">
                    <img src="<%= show_cover %>" />
                </div>
                <div class="col-md-6">
                    <a id="game_name" href="buy.jsp?game_id=<%= game_id %>"><%= game_name %></a>
                    <br />
                    <!--<h5>Fulfilled by <a href="index.jsp">GameFreak</a></h5>-->
                    <%
                        if(show_stock > 0) {
                    %>
                        <h5 style="color: #52B31A">Available in stock</h5>
                    <%
                    } else {
                    %>
                        <h5 style="color: #E02A2A">Out of stock</h5>
                    <%
                        }
                    %>
                    <form method="POST">
                        <input type="hidden" name="game_id" value="<%= game_id %>" />
                        <input type="hidden" name="game_platform" value="<%= platform %>" />
                        <i style="font-size: 20px; color: red;" class="fas fa-trash-alt"></i>&nbsp
                        <input type="submit" formaction="delete_wishlist_item" name="delete" value="Delete" /> <span class="fw">|</span>
                        <input type="submit" formaction="add_to_cart" name="add_to_cart" value="Add to Cart" />
                    </form>
                    <%
                        if(wishlist_double_entry.equals(game_id) && game_platform.equals(platform)) {
                    %>
                    <br><span class="fw" style="color: red;">NOTE: You have already added this game to wishlist.</span>
                    <%
                        session.removeAttribute("wishlist_double_entry");
                        session.removeAttribute("platform");
                        }
                    %>
                </div>
                <div class="col-md-3">
                    <label>
                        MRP:&nbsp;
                    </label>
                    <del><i class="fas fa-rupee-sign"></i>&nbsp;<span class="fw" style="color:red;"><%= show_price %>0</span></del>
                    <br>
                    <label>
                        Price:&nbsp;
                    </label>
                    <i class="fas fa-rupee-sign"></i>&nbsp;<span class="fw" style="color: #24C13A;"><%= show_sale %>0</span>
                    <br>
                    <label>
                        You Save:&nbsp;
                    </label>
                    <i class="fas fa-rupee-sign"></i>&nbsp;<span class="fw" style="color: #24C13A;"><%= show_save %>0 (<%= show_off %>%)</span>
                </div>
            </div>
                <hr>
                <%
                        }
                    }
                %>
            </div>
        <%
            } else {
        %>
            <img class="img-responsive" style="width:100%" src="images/make_a_wish.jpg" />
        <%
        }
        %>
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
