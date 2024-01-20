<%-- 
    Document   : signup
    Created on : Jan 4, 2024, 12:35:51 PM
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
        <title>ADD BOOK</title>
    </head>
    <body>
        <%@include  file="header.jsp"%>
        <%@include  file="topper.jsp"%>
        <div class="container1">
            <form action="add_book" id="myform" method="post">
                <div class="box" id="box1">
                    <label for="name">Enter Book name</label>
                    <input type="text" id="name" placeholder="name" name="book_name" required>
                </div>
                <div class="box" id="box2">
                    <label for="author">Book Author</label>
                    <input type="text" id="author" placeholder="book author" name="book_author" required>
                </div>
                <div class="box" id="box3">
                    <label for="Cost">Enter Book Cost</label>
                    <input type="number" id="cost" placeholder="book cost" name="book_cost" required>
                </div>
                <div class="box" id="box4">
                    <select name="book_genre" class="form-select" aria-label="Disabled select example" required>
                        <option selected>Select Book Genre/Category</option>
                       <option value="Computer Science">Computer Science</option>
                        <option value="Science & Tech">Science & Tech</option>
                        <option value="arts">arts</option>
                        <option value="novel">novel</option>
                        <option value="stories">stories</option>
                        <option value="poems">poems</option>
                    </select>
                </div>
                <div class="buttons">
                    <button type="submit" class="btn btn-primary">Add</button>
                    <button type="reset" class="btn btn-primary">reset</button>
                    <button id='goHome' class="btn btn-primary">Cancel</button>
                </div>


            </form>
        </div>
    </div>
    <script
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>

    <script>
       $(document).ready(function () {
           
           $("#goHome").on("click", function () {
                    window.location.href = "http://localhost:9494/book_sbazaar.in/home";
                }); 
                
           
    $("#myform").on('submit', function (event) {
        event.preventDefault();

        var formData = $(this).serialize();
        console.log("Form Data:", formData);

        $.ajax({
            url: "add_book",
            data: formData,
            type: 'post',
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                console.log("success.......");
                if (data.trim() === 'done') {
                    alert("Book Added Successfully");
                    window.location.href = "http://localhost:9494/book_sbazaar.in/home";
                } else {
                    alert("OPERATION FAILED!");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("error.......");
                console.log(jqXHR.responseText);
                alert("Registration failed! error");
            },
        });
    });
});

    </script>

    <%@include  file="footer.jsp"%>
</body>
</html>

