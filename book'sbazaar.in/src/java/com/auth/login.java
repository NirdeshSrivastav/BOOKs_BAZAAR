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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sriva
 */
public class login extends HttpServlet {

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
            String email = request.getParameter("user_email");
            String pass = request.getParameter("user_password");
            System.out.println("got the request");
            if (!validateUser(email, pass, out, response)) {

//                out.println("<h1>success</h1>");
                HttpSession s = request.getSession();
             s.setAttribute("email", email);
             out.println("done");
//             response.sendRedirect("http://localhost:9494/book_sbazaar.in/home");
            } else {
                /* TODO output your page here. You may use following sample code. */
//                response.sendRedirect("login.jsp");
out.println("invalid credentials");
            }

        }
    }

    private boolean validateUser(String email, String pass, PrintWriter out, HttpServletResponse response) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://monorail.proxy.rlwy.net:50400/railway", "root", "D4CC3D4hBH-a4dFGbGHc-Gdgb3Fbd3aB");
//                System.out.println("connection"+con);

            //query
            String q = "select name,email,contact,password,dob from users where email = '" + email + "' and password='" + pass + "'";
            PreparedStatement pstmt = con.prepareStatement(q);

            ResultSet resultSet = pstmt.executeQuery();
            if (!resultSet.isBeforeFirst()) {
                return true;
            }
            return false;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h1>something went wrong in database: " + e + "</h1>");
            return false;
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
