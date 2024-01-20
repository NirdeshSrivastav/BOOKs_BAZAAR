<%-- 
    Document   : login
    Created on : Jan 4, 2024, 11:29:53 AM
    Author     : sriva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%@page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="styles/login-style.css" />

        <title>Login Page</title>
    </head>
    <body>
        <%@include  file="header.jsp"%>
        <div class="container">
            <!--// creating form-->
            <form action="login" method="post" id="myform">
                <div class="inputs">
                    <input
                        class="inp"
                        type="text"
                        name="user_email"
                        placeholder="Enter your email"
                        />
                    <input
                        class="inp"
                        type="password"
                        name="user_password"
                        placeholder="Enter user password"
                        />
                </div>
                <div class="buttons">
                    <button type="submit" >Login</button>
                    <button type="reset" >Reset</button>
                </div>
                    <p>
                        new user?
                        <a
                            href="http://localhost:9494/book_sbazaar.in/signup-page"
                            style="color: red; font-weight: bold"
                            >Register here</a
                        >
                    </p>

            </form>
        </div>
        
    <script
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            console.log("page ready");
            $("#myform").on('submit', function (event) {
                    event.preventDefault();

                    var f = $(this).serialize();       

                console.log(f);

                $.ajax({
                    beforeSend: function () {
                    },
                    url: "login",
                    data: f,
                    type: 'post',
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() === 'done') {
                            alert("Login Successfull ");
                               window.location.href = "http://localhost:9494/book_sbazaar.in/home";
                        } else {
                            console.log("response: "+data)
                           alert("Something went wrong");
//                           window.location.href = "http://localhost:9494/book_sbazaar.in/login-page";
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error.......");
                        console.log(jqXHR.responseText);
                        alert("Login failed! error");
                    }
                });
            });
        });
    </script>
        
        <%@include  file="footer.jsp"%>
    </body>
</html>
