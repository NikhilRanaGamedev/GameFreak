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
public class add_to_wishlist extends HttpServlet {

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
            String user_id = (String)session.getAttribute("user_id");
            String game_id = request.getParameter("game_id");
            String game_platform = request.getParameter("game_platform");
            String space = "";
            
            if(session.getAttribute("user_id") != null) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
                
                PreparedStatement ps = con.prepareStatement("SELECT `game_id` FROM `wishlist` WHERE `user_id` = ? && `game_id` = ? && `platform` = ?");
                ps.setString(1, user_id);
                ps.setString(2, game_id);
                ps.setString(3, game_platform);
                
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    space = rs.getString("game_id");
                }
                if(space == "") {
                    PreparedStatement sql = con.prepareStatement("INSERT INTO `wishlist`(user_id, game_id, platform) values(?, ?, ?)");

                    sql.setString(1, user_id);
                    sql.setString(2, game_id);
                    sql.setString(3, game_platform);

                    int status = sql.executeUpdate();
                    if(status > 0) {
                        response.sendRedirect("wishlist.jsp");
                    } else {
                        response.sendRedirect("404.jsp");
                    }
                } else {
                    session.setAttribute("wishlist_double_entry", game_id);
                    session.setAttribute("platform", game_platform);
                    response.sendRedirect("wishlist.jsp");
                }
            } else {
                session.setAttribute("login_prompt", "1");
                response.sendRedirect("buy.jsp?game_id="+game_id);
            }
        } catch (ClassNotFoundException ex) {
            response.sendRedirect("404.jsp"); // Drivers
        } catch (SQLException ex) {
            response.sendRedirect("404.jsp"); // Connection
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
