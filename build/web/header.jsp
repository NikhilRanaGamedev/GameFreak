<%-- 
    Document   : header
    Created on : Dec 16, 2018, 3:26:46 PM
    Author     : NightPredetor
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String username = "";
    int cart_items = 0;
    int wishlist_items = 0;
    int purchased_items = 0;
%>
<%  
    if(session.getAttribute("user_id") != null) {
        String user_id = (String)session.getAttribute("user_id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
        
        PreparedStatement sql = con.prepareStatement("SELECT * FROM `user_info` WHERE `user_id` = ?");

        sql.setString(1, user_id);
        
        ResultSet rs = sql.executeQuery();
        if(rs.next()) {
            String first_name = rs.getString("first_name");
            String last_name = rs.getString("last_name");
            username = first_name+" "+last_name;
        }

        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM `cart` WHERE `user_id` = ?");

        ps.setString(1, user_id);

        ResultSet result = ps.executeQuery();
        if(result.next()) {
            cart_items = result.getInt("count(*)");
        }
        
        PreparedStatement sql2 = con.prepareStatement("SELECT COUNT(*) FROM `wishlist` WHERE `user_id` = ?");

        sql2.setString(1, user_id);

        ResultSet rs2 = sql2.executeQuery();
        if(rs2.next()) {
            wishlist_items = rs2.getInt("count(*)");
        }
        
        PreparedStatement sql3 = con.prepareStatement("SELECT COUNT(*) FROM `purchases` WHERE `user_id` = ?");

        sql3.setString(1, user_id);

        ResultSet rs3 = sql3.executeQuery();
        if(rs3.next()) {
            purchased_items = rs3.getInt("count(*)");
        }
    }
%>
        <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.jsp">GameFreak</a>
                            <button class="navbar-toggle" data-target="#mainNavbar" data-toggle="collapse" type="button">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                    <div class="navbar-collapse collapse" id="mainNavbar">
                        <ul class="nav navbar-nav">
                            <li><a href="index.jsp"><i class="fas fa-home"></i>&nbsp;Home</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Games&nbsp;<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-submenu">
                                        <a href="#">
                                            <strong>Open World RPG&nbsp;<i class="caret"></i></strong>
                                        </a>
                                        <ul class="dropdown-menu submenu">
                                            <li>
                                                <a href="buy.jsp?game_id=${1}">
                                                    <strong>The Witcher 3: Wild Hunt</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${2}">
                                                    <strong>The Elder Scrolls V: Skyrim</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${3}">
                                                    <strong>Grand Theft Auto V</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${4}">
                                                    <strong>Far Cry 4</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${8}">
                                                    <strong>God Of War</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${9}">
                                                    <strong>Assassin's Creed: Odyssey</strong>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    
                                    <li class="divider"></li>
                                    
                                    <li class="dropdown-submenu">
                                        <a href="#">
                                            <strong>Action RPG&nbsp;<i class="caret"></i></strong>
                                        </a>
                                        <ul class="dropdown-menu submenu">
                                            <li>
                                                <a href="buy.jsp?game_id=${5}">
                                                    <strong>Dark Souls III</strong>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    
                                    <li class="divider"></li>
                                    
                                    <li class="dropdown-submenu">
                                        <a href="#">
                                            <strong>Battle Royale&nbsp;<i class="caret"></i></strong>
                                        </a>
                                        <ul class="dropdown-menu submenu">
                                            <li>
                                                <a href="buy.jsp?game_id=${6}">
                                                    <strong>PUBG</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${7}">
                                                    <strong>Overwatch</strong>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    
                                    <li class="divider"></li>
                                    
                                    <li class="dropdown-submenu">
                                        <a href="#">
                                            <strong>MOBA&nbsp;<i class="caret"></i></strong>
                                        </a>
                                        <ul class="dropdown-menu submenu">
                                            <li>
                                                <a href="buy.jsp?game_id=${10}">
                                                    <strong>League of Legends</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${7}">
                                                    <strong>Dota 2</strong>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    
                                    <li class="divider"></li>
                                    
                                    <li class="dropdown-submenu">
                                        <a href="#">
                                            <strong>FPS&nbsp;<i class="caret"></i></strong>
                                        </a>
                                        <ul class="dropdown-menu submenu">
                                            <li>
                                                <a href="buy.jsp?game_id=${12}">
                                                    <strong>CS: GO</strong>
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="buy.jsp?game_id=${13}">
                                                    <strong>Rainbow Six Siege</strong>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Brands <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                        <li><a href="https://www.nintendo.com"><strong>Nintendo</strong></a></li>
                                        <li class="divider"></li>
                                        <li><a href="https://www.rockstargames.com"><strong>Rockstar Games</strong></a></li>
                                        <li class="divider"></li>
                                        <li><a href="http://www.valvesoftware.com"><strong>Valve</strong></a></li>
                                        <li class="divider"></li>
                                        <li><a href="https://www.ubisoft.com/en-gb"><strong>Ubisoft</strong></a></li>
                                        <li class="divider"></li>
                                        <li><a href="https://www.ea.com"><strong>EA</strong></a></li>
                                        <li class="divider"></li>
                                        <li><a href="https://bethesda.net/en/dashboard"><strong>Bethesda</strong></a></li>
                                        <li class="divider"></li>
                                        <li><a href="https://www.cdprojekt.com/pl"><strong>CD Projekt</strong></a></li>
                                </ul>
                            </li>
                            <li><a href="#">About Us</a></li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <%
                                if(session.getAttribute("user_id") == null){
                            %>
                            <li>
                                <a href="#" data-toggle="modal" data-target="#signup">
                                    <i class="fas fa-user">
                                        <span id="test">&nbsp;SignUp</span>
                                    </i></span>
                                </a>
                            </li>
                            <li>
                                <a href="#" data-toggle="modal" data-target="#login">
                                    <i class="fas fa-sign-in-alt">
                                        <span id="test">&nbsp;Login</span></i>
                                    </span>
                                </a>
                            </li>
                            <%
                                } else {
                            %>
                            <li class="dropdown">
                                <a id="cart" href="cart.jsp">
                                    <i class="fas fa-shopping-cart"><% if(cart_items != 0) {out.println("<span id='cart_items'>"+cart_items+"</span>");} %></i>&nbsp;Cart</a>
                            </li>

                            <li class="dropdown">
                                <a id="username" href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user-circle"></i>&nbsp;<%= username %>&nbsp;<i class="caret"></i></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#profile"><i class="fas fa-user-alt"></i>&nbsp;Your Profile</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#address"><i class="fas fa-map-marker-alt"></i>&nbsp;Add Address</a>
                                    </li>
                                     <li class="divider"></li>
                                    <li>
                                        <a href="address.jsp"><i class="fas fa-address-card"></i>&nbsp;Manage Address</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="orders.jsp"><i class="fas fa-box-open"></i>&nbsp;Your Orders&nbsp;(<%= purchased_items %>)</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="wishlist.jsp"><i class="fas fa-clipboard-list"></i>&nbsp;Your Wishlist&nbsp;(<%= wishlist_items %>)</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp;Logout</a>
                                    </li>
                                </ul>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    </div>
                </nav>