<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <title>Sorry! something went wrong</title>
  </head>
  <body>
    <div class="container p-3 text-center">
        <img src="images/error.png" class="img-fluid" style="width: 30%;height: 30%;"/>
        <h1 class="display-3">sorry! something went wrong...</h1>
        <p><%= exception %></p>
        <a class="btn btn-outline-primary" href="http://localhost:9494/book_sbazaar.in/home">Home page</a>  
    </div>
  </body>
</html>
