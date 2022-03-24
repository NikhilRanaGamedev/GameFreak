/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamefreak_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NightPredetor
 */
public class order_placement extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String address_id = (String)session.getAttribute("address_checkout");
            String user_id = (String)session.getAttribute("user_id");
            
            String game_id = "";
            String platform = "";
            
            int status = 0;
            int original_price = 0;
            int sale_price = 0;
            String cover = "";
            String name = "";
            
            int total_price = 0;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");

            PreparedStatement sql = con.prepareStatement("SELECT * FROM `cart` WHERE `user_id` = ?");

            sql.setString(1, user_id);
            
            ResultSet rs = sql.executeQuery();
            while(rs.next()) {
                game_id = rs.getString("game_id");
                platform = rs.getString("platform");
                
                PreparedStatement sql4 = con.prepareStatement("SELECT * FROM `games` WHERE `game_id` = ?");

                sql4.setString(1, game_id);
                
                ResultSet rs2 = sql4.executeQuery();
                if(rs2.next()) {
                    if(platform.equals("PC")) {
                        original_price = rs2.getInt("pc_price");
                        sale_price = rs2.getInt("pc_sale");
                        cover = rs2.getString("pc_cover");
                        name = rs2.getString("pc_name");
                        
                        PreparedStatement sql5 = con.prepareStatement("UPDATE games SET pc_stock = pc_stock - 1 WHERE game_id = ? && pc_stock > 0");
                        
                        sql5.setString(1, game_id);
                       
                        int status2 = sql5.executeUpdate();
                        if(status2 <= 0 ) {
                            response.sendRedirect("404.jsp");
                        }
                    } else if(platform.equals("PS4")) {
                        original_price = rs2.getInt("ps4_price");
                        sale_price = rs2.getInt("ps4_sale");
                        cover = rs2.getString("ps4_cover");
                        name = rs2.getString("ps4_name");
                        
                        PreparedStatement sql5 = con.prepareStatement("UPDATE games SET ps4_stock = ps4_stock - 1 WHERE game_id = ? && ps4_stock > 0");

                        sql5.setString(1, game_id);
                        
                        int status2 = sql5.executeUpdate();
                        if(status2 <= 0 ) {
                            response.sendRedirect("404.jsp");
                        }
                    } else {
                        original_price = rs2.getInt("xbox_price");
                        sale_price = rs2.getInt("xbox_sale");
                        cover = rs2.getString("xbox_cover");
                        name = rs2.getString("xbox_name");
                        
                        PreparedStatement sql5 = con.prepareStatement("UPDATE games SET xbox_stock = xbox_stock - 1 WHERE game_id = ? && xbox_stock > 0");

                        sql5.setString(1, game_id);
                        
                        int status2 = sql5.executeUpdate();
                        if(status2 <= 0 ) {
                            response.sendRedirect("404.jsp");
                        }
                    }
                    total_price = total_price + sale_price;
                    PreparedStatement sql2 = con.prepareStatement("INSERT INTO `purchases`(user_id, address_id, game_id, name, platform, original_price, sale_price, cover, status, refund) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

                    sql2.setString(1, user_id);
                    sql2.setString(2, address_id);
                    sql2.setString(3, game_id);
                    sql2.setString(4, name);
                    sql2.setString(5, platform);
                    sql2.setInt(6, original_price);
                    sql2.setInt(7, sale_price);
                    sql2.setString(8, cover);
                    sql2.setString(9, "delivery");
                    sql2.setString(10, "n/a");

                    status = sql2.executeUpdate();
                } else {
                    response.sendRedirect("404.jsp");
                }
            }
            if(status > 0) {
                PreparedStatement sql3 = con.prepareStatement("DELETE FROM `cart` WHERE `user_id` = ?");

                sql3.setString(1, user_id);

                int status2 = sql3.executeUpdate();
                if(status2 > 0) {
                    String string_total_price = String.valueOf(total_price);
                    session.setAttribute("total_price", string_total_price);
                    session.setAttribute("address_id", address_id);
                    session.setAttribute("order_placed", "1");
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("404.jsp");
                }
            } else {
                response.sendRedirect("404.jsp");
            }
        } catch (ClassNotFoundException ex) {
            response.sendRedirect("404.jsp");
        } catch (SQLException ex) {
            response.sendRedirect("404.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
