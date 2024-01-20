/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.auth;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author sriva
 */
@WebServlet
public class signup extends HttpServlet {

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
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String contact=request.getParameter("user_contact");
            String pass1=request.getParameter("user_password");
            String pass2=request.getParameter("user_confirm");
            String dob=request.getParameter("user_dob");
          
//            System.out.println("NAME:  "+name);
//                             out.println("1: got the signup request");

           if(name == "" ||email == ""||pass1 == ""||contact==""||pass1==""||pass2==""||dob=="")
             {
//                 out.println("<h1 style='color:red;'>Bhai kuch to enter kar de yarr</h1>");
                 out.println("null value got");
             }else{
//               out.println("2");
                if(!validateEmail(email,out,response)){
                    out.println("Email already registered");
                    System.out.println("Email already registered");
//                    Thread.sleep(1000);
//                    response.sendRedirect("login.jsp");
                    return;
                }
//                out.println("3");
             //connection
             try{
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con ;
                con = DriverManager.getConnection("jdbc:mysql://monorail.proxy.rlwy.net:50400/railway", "root", "D4CC3D4hBH-a4dFGbGHc-Gdgb3Fbd3aB");
                System.out.println("connection"+con);
//                 out.println("4");
             //query
             String q = "insert into users(name,email,contact,password,dob) values(?,?,?,?,?)";
             PreparedStatement pstmt = con.prepareStatement(q);
             pstmt.setString(1, name);
             pstmt.setString(2, email);
             pstmt.setString(3, contact);
             pstmt.setString(4, pass1);
             pstmt.setString(5, dob);
//             out.println("5");
             pstmt.executeUpdate();
//             upload...
//             out.println("6");
             out.println("done");
             HttpSession s = request.getSession();
             s.setAttribute("email", email);
//             response.sendRedirect("home.jsp");
             }catch(ClassNotFoundException | SQLException e){
                 out.println("something went wrong");
                 System.out.println("error: "+e);
//                 out.println("7");
             }
             }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private boolean validateEmail(String email, PrintWriter out, HttpServletResponse response) {
        try{
//            out.println("8");
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con ;
                con = DriverManager.getConnection("jdbc:mysql://monorail.proxy.rlwy.net:50400/railway", "root", "D4CC3D4hBH-a4dFGbGHc-Gdgb3Fbd3aB");
//                System.out.println("connection"+con);
//                 out.println("9");
             //query
             String q = "select name,email,contact,password,dob from users where email = '"+email+"'";
             PreparedStatement pstmt = con.prepareStatement(q);            
//             out.println("10");
             ResultSet resultSet = pstmt.executeQuery();
                if(!resultSet.isBeforeFirst()){
//                    out.println("10");
                    return true;
                }
                return false;
        }catch(ClassNotFoundException |SQLException e){
             System.out.println("Error: "+e);
                 out.println("something went wrong in database: "+e);
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
