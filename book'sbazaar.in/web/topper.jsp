<%-- 
    Document   : header.jsp
    Created on : Jan 4, 2024, 7:48:54 AM
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

        <link rel="stylesheet" href="styles/header-footer.css" />

        <style>
            .top{
               width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <%
            session = request.getSession();
            String email = (String) session.getAttribute("email");

        %>
        <div class="top" style="border-top: 2px solid black;">
            <h3 style="text-align: center; color:green;">-: Welcome back :- <br><a style="color:navy; text-decoration: none;" href="#"><%=email%></a>&nbsp;&nbsp;<a style='color: red; text-decoration: none;' href='http://localhost:9494/book_sbazaar.in/logout'>Log out</a></h3>
        </div>
    </body>
</html>

