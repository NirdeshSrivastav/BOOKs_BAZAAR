<%-- 
    Document   : home.jsp
    Created on : Jan 4, 2024, 7:48:06 AM
    Author     : sriva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="styles/home.css" />
        <title>HOME</title>
    </head>
    <body>
        
        <%@include  file="header.jsp"%>
        <%@include  file="topper.jsp"%>
        <div class="container">
            <div class="card"><a href="http://localhost:9494/book_sbazaar.in/addBook">Add  New Book</a></div>
      <div class="card"><a href="http://localhost:9494/book_sbazaar.in/updateBook">Update a Book</a></div>
      <div class="card"><a href="http://localhost:9494/book_sbazaar.in/deleteBook">Remove A Book</a></div>
      <div class="card"><a href="http://localhost:9494/book_sbazaar.in/searchBook">Search for A Book</a></div>
    </div>
        <%@include  file="footer.jsp"%>
    </body>
</html>

