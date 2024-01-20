<%-- 
    Document   : search_book
    Created on : Jan 7, 2024, 1:36:02 PM
    Author     : sriva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="styles/update-book.css" />
                <style>
        
        #goHome {
          height: 60%;
          width: 80%;
        }
                </style>
        <title>SEARCH BOOK</title>
    </head>
    <body>
        <%@include  file="header.jsp"%>
        <%@include  file="topper.jsp"%>
        <div class="containers">
            <form action="/search_books" class="first" id="myForm" method="post">
                <div class="search">
                    <input
                        type="text"
                        placeholder="Enter book name"
                        class="book_name"
                        name="book-name"
                        required
                        />
                    <button type="submit" id="sub1" class="btn btn-primary">
                        Search Book
                    </button>
                </div>
            </form>

            <div class="second" id="myForm2" >
                <div class="search">
                    <select
                        id="bookSelect" 
                        name="book_data"
                        class="form-select"
                        aria-label="Disabled select example"
                        required
                        >
                        <option selected>Select the book which you want to update</option>
                    </select>

                    <input
                        type="text"
                        placeholder="book name"
                        class="inputs"
                        name="new-name"
                        id="new-name"
                        readonly
                        />
                    <input
                        type="text"
                        placeholder="book author"
                        class="inputs"
                        name="new-author"
                        id="new-author"
                        readonly
                        />
                    <input
                        type="text"
                        placeholder="book cost"
                        class="inputs"
                        name="new-cost"
                        id="new-cost"
                        readonly
                        />

                    <input
                        type="text"
                        placeholder="book genre"
                        class="inputs"
                        name="new-genre"
                        id="new-genre"
                        readonly
                        />
                    <div class="buttons">

                        <button id="goHome" class="btn btn-primary">
                            Go To Home Page
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"
        ></script>

        <script>
            var books;


            function changing(book_id) {
                console.log("-----option selected-----");
               
                // Get the selected book ID from the dropdown
                var selectedBookId = book_id;
                console.log("-----option selected-----");

                var selectedBook = findBookById(selectedBookId);

                if (selectedBook) {
                    $("#new-name").val(selectedBook[1]);
                    $("#new-cost").val(selectedBook[2]);
                    $("#new-author").val(selectedBook[3]);
                    $("#new-genre").val(selectedBook[4]);
                }
            }

            $(document).ready(function () {

                $("#goHome").on("click", function () {
                    window.location.href = "http://localhost:9494/book_sbazaar.in/home";
                });

                $("#myForm").on("submit", function (event) {
                    event.preventDefault();
                    $("#new-name").val("");
                    $("#new-cost").val("");
                    $("#new-author").val("");
                    $("#new-genre").val("");
                    var formData = $(this).serialize();
                    console.log("Form Data:", formData);

                    $.ajax({
                        url: "search_books",
                        data: formData,
                        type: "post",
                        dataType: 'json',
                        success: function (data, textStatus, jqXHR) {
                            var selectOptions = $("#bookSelect");

                            // Clear existing options
                            selectOptions.empty();
                            console.log(data);
                            console.log("success.......");
                            if (data.length > 0) {
                                alert("Books found");
                                $("#myForm").show();
                                books = data;
                                for (var i = 0; i < data.length; i++) {
                                    let rs = data[i].split('||');
                                    selectOptions.append("<option value='" + rs[0] + "' onclick='changing(" + rs[0] + ")' >" + rs[1] + "</option>");
                                }
                            } else {
                                alert("Book Not Found");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("error.......");
                            console.log(jqXHR.responseText);
                            alert("Something went wrong");
                        }
                    });
                });
            });

            function findBookById(bookId) {
                console.log("-----getting the values by id-----");
                // Assuming books array has been received from the server
                for (var i = 0; i < books.length; i++) {
                    let rs = books[i].split('||');
                    if (rs[0] == bookId) {
                        return rs;
                    }
                }
                return null;
            }

        </script> 
        <%@include  file="footer.jsp"%>
    </body>
</html>