<%-- 
    Document   : signup
    Created on : Jan 4, 2024, 12:35:51 PM
    Author     : sriva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Compiled and minified CSS -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
            />

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

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
        <link rel="stylesheet" href="styles/signup-style.css" />
        <title>Sign Up</title>
    </head>
    <body>
        <%@include  file="header.jsp"%>
        <div class="container1">
            <form action="signup" id="myform" method="post">
                <div class="box" id="box1">
                    <label for="name">Enter your name</label>
                    <input type="text" id="name" placeholder="name" name="user_name">
                </div>
                <div class="box" id="box2">
                    <label for="email">Enter your email</label>
                    <input type="email" id="email" placeholder="email" name="user_email">
                </div>
                <div class="box" id="box3">
                    <label for="contact">Enter your contact</label>
                    <input type="number" id="contact" placeholder="contact" name="user_contact">
                </div>
                <div class="box" id="box4">
                    <label for="password">Enter your password</label>
                    <input type="password" id="password" placeholder="password" name="user_password">
                </div>
                <div class="box" id="box5">
                    <label for="cpassword">confirm password</label>
                    <input type="password" id="cpassword" placeholder="confirm password" name="user_confirm">
                </div>
                <div class="box" id="box6">
                    <label for="dob">Enter your DOB</label>
                    <input type="date" id="dob" placeholder="Date Of Birth" name="user_dob">
                </div>
<!--                <div class="box" id="box7">
                     <label for="image">choose profie image</label> 
                    <input type="file" id="image" placeholder="image" name="user_profile">
                </div>-->
                <div class="buttons">
                    <button type="submit" class="btn">Register</button>
                    <button type="reset" class="btn">reset</button>
                </div>

                <p>
                    Already have an account?
                    <a
                        href="http://localhost:9494/book_sbazaar.in/login-page"
                        style="color: red; font-weight: bold"
                        >Login here</a
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
                    url: "signup",
                    data: f,
                    type: 'post',
                    success: function (data, textStatus, jqXHR) {

                        if (data.trim() === 'done') {
                            alert("Successfully registered..Now you can login using your email and password");
                               window.location.href = "http://localhost:9494/book_sbazaar.in/login-page";
                        } else {
                           alert("Email already registered");
                           window.location.href = "http://localhost:9494/book_sbazaar.in/login-page";
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error.......");
                        console.log(jqXHR.responseText); 
                        alert("Registeration failed! error");
                    }
                });
            });
        });
    </script>

    <%@include  file="footer.jsp"%>
</body>
</html>
