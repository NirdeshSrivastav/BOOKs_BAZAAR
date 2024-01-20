/*
/*
/*
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
public class add_book extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("book_name");
        String author = request.getParameter("book_author");
        String cost = request.getParameter("book_cost");
        String genre = request.getParameter("book_genre");
        
PrintWriter out = response.getWriter(); 
        try  {
        HttpSession s =request.getSession();
        String email = (String) s.getAttribute("email");
//            out.println("alert('this is from server');");
//            if(name!=null ||author!=null||cost!=null||genre!=null){
                if(addBook(email,name,author,cost,genre,out)){
                    out.println("done");
                }else{
                    out.println("Something went wrong");
                }
//            }
        
        }catch(Exception e){
            e.printStackTrace();
            out.println(e);
        }
    }
    private boolean addBook(String email, String name,String author,String cost,String genre, PrintWriter out) {
        try{
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con ;
                con = DriverManager.getConnection("jdbc:mysql://monorail.proxy.rlwy.net:50400/railway", "root", "D4CC3D4hBH-a4dFGbGHc-Gdgb3Fbd3aB");
                 Date date = new Date();
             //query
             String q = "insert into books(book_name,book_author,book_cost,book_genre,creater_email,date_created) values(?,?,?,?,?,?)";
             PreparedStatement pstmt = con.prepareStatement(q);
             pstmt.setString(1, name);
             pstmt.setString(2, author);
             pstmt.setString(3, cost);
             pstmt.setString(4, genre);
             pstmt.setString(5, email);
             pstmt.setString(6, date.toString());
             
             pstmt.executeUpdate();            
             return true;
        }catch(ClassNotFoundException |SQLException  e){
             e.printStackTrace();
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
