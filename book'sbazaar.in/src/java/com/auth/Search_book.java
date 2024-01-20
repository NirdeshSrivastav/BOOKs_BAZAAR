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
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author sriva
 */
@WebServlet("/search_book")
public class Search_book extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response````````
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //getting the writer
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("book-name");
//            creating the arraylist to store all the book names
            ArrayList<String> bookNames = getBookNames(out);
//            filtering books that contains the serched book names 
            bookNames = filterBooks(name, bookNames);
            // checking wheter the arraylist is empty or not
            if (bookNames != null) {
//                converting the arraylist to array
                String[] stringArray = bookNames.toArray(new String[0]);
//                converting the array to json format
                String jsonString = new Gson().toJson(stringArray);

                // Set content type and write JSON to response
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonString);
            } else {
                //returning nothing as the client will understarnd that no books are found.
            }
        }
    }

    private ArrayList<String> filterBooks(String name, ArrayList<String> bookNames) {
        ArrayList<String> filteresBookNames = new ArrayList<>();
        for (String s : bookNames) {
            if (s.toLowerCase().contains(name.toLowerCase())) {
                filteresBookNames.add(s);
            }
        }
        return filteresBookNames;
    }

    private ArrayList<String> getBookNames(PrintWriter out) {
        // logic to get the list of book names
        ArrayList<String> bookNames = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://monorail.proxy.rlwy.net:50400/railway", "root", "D4CC3D4hBH-a4dFGbGHc-Gdgb3Fbd3aB");
            //query
            String q = "select book_id, book_name,book_author,book_cost,book_genre from books";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet resultSet = pstmt.executeQuery();
            if (!resultSet.isBeforeFirst()) {
//                out.println("Book Not Found");
                return bookNames;
            } else {
                while (resultSet.next()) {
                    int id = resultSet.getInt("book_id");
                    String name = resultSet.getString("book_name");
                    String author = resultSet.getString("book_author");
                    String cost = resultSet.getString("book_cost");
                    String genre = resultSet.getString("book_genre");
                    String b =id+"||"+name+"||"+author+"||"+cost+"||"+genre;
                    bookNames.add(b);
                }

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
//            out.println("something went wrong in database: " + e );
        }
        // Example:
        return bookNames;
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
