<%-- 
    Document   : index.jsp
    Created on : Jan 4, 2024, 7:48:21 AM
    Author     : sriva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />

        <link rel="stylesheet" href="styles/style.css" />
        <title>Books'Bazaar</title>
    </head>
    <body>
        <%@include  file="header.jsp"%>

        <div class="buttons">
            <button class="btn btn-success"><a style="color: white; text-decoration: none" href="http://localhost:9494/book_sbazaar.in/signup-page">Register</a></button>
            <button class="btn btn-success"><a style="color: white; text-decoration: none" href="http://localhost:9494/book_sbazaar.in/login-page">Login</a></button>

        </div>

        <div class="container">
            <div class="content">
                <h1>Book's Bazaar</h1>
                <br />
                <p style="font-weight: 600; font-size: 1.5rem">
                    Where passion for reading meets a world of possibilities
                </p>
                <p>
                    Book's Bazaar is the one shot solution for all the
                    students,teachers,mentors and even for all the Book Lovers
                </p>
            </div>
        </div>
        <%@include  file="footer.jsp"%>
    </body>
</html>

