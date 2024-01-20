/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sriva
 */
public class Update_Book extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            String name = request.getParameter("book_data");
            String book_id = request.getParameter("book_id");
            String new_name = request.getParameter("new-name");
            String new_author = request.getParameter("new-author");
            String new_cost = request.getParameter("new-cost");
            String new_genre = request.getParameter("new-genre");
            
            
            HttpSession s = request.getSession();
            String updatedBy = (String) s.getAttribute("email");

            if (!name.equalsIgnoreCase("Select the book which you want to update") || !name.equalsIgnoreCase("")) {
                boolean upDateBookResult = updateBooks(book_id, new_name, new_cost, new_author, new_genre, updatedBy);
                if (upDateBookResult) {
                    out.println("done");
                    return;
                }
            }
            out.println("Something went wrong");
        }
    }

    private boolean updateBooks(String book_id, String new_name, String new_author, String new_cost, String new_genre, String updatedBy) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://monorail.proxy.rlwy.net:50400/railway", "root", "D4CC3D4hBH-a4dFGbGHc-Gdgb3Fbd3aB");
//query
            String q = "update books set book_name=?, book_author=? ,book_cost=? ,book_genre=? ,last_updated=?, last_updated_by=? where book_id=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, new_name);
            pstmt.setString(2, new_author);
            pstmt.setString(3, new_cost);
            pstmt.setString(4, new_genre);
            pstmt.setString(5, new Date().toString());
            pstmt.setString(6, updatedBy);
            pstmt.setString(7, book_id);
            int i = pstmt.executeUpdate();
            if (i >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
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
