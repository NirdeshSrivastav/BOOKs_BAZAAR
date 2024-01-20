<%-- 
    Document   : update_book
    Created on : Jan 6, 2024, 2:48:55 PM
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
        <title>UPDATE BOOK</title>
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

            <form action="/update_book" class="second" id="myForm2" >
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
                        placeholder="book id"
                        class="inputs"
                        name="book_id"
                        id="book_id"
                        hidden
                        />

                    <input
                        type="text"
                        placeholder="Enter book name"
                        class="inputs"
                        name="new-name"
                        id="new-name"
                        required
                        />
                    <input
                        type="text"
                        placeholder="Enter book author"
                        class="inputs"
                        name="new-author"
                        id="new-author"
                        required
                        />
                    <input
                        type="text"
                        placeholder="Enter book cost"
                        class="inputs"
                        name="new-cost"
                        id="new-cost"
                        required
                        />
                    
                    <input
                        type="text"
                        placeholder="Enter book cost"
                        class="inputs"
                            name="new-genre"
                        id="new-genre"
                        readonly
                        />
                    <div class="buttons">
                        <button type="submit" id="sub2" class="btn btn-primary">
                            Update Book
                        </button>
                        <button id="goHome" class="btn btn-primary">
                            Cancel
                        </button>
                    </div>
                </div>
            </form>
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
                    
                    var selectedBookId = book_id;
                    console.log("-----option selected-----");

                    var selectedBook = findBookById(selectedBookId);

                    if (selectedBook) {
                        $("#book_id").val(book_id);
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
                     $("#book_id").val("");
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

                            // Clearing existing options
                            selectOptions.empty();
                            console.log(data);
                            console.log("success.......");
                            if (data.length > 0) {
                                // Books found, populating the select options
                                alert("Books found");
                                $("#myForm").show();
                                books = data;
                                // Populatimg the select options with book names
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

                //for form 2
                $("#myForm2").on("submit", function (event) {
                    event.preventDefault();

                    var formData = $(this).serialize();
                    console.log("Form Data:", formData);
                     let confirmation = confirm("Do you want to update this book");
                     if(confirmation){
                    $.ajax({
                        url: "update_book",
                        data: formData,
                        type: "post",
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success.......");
                            if (data.trim() === "done") {
                                alert("Successfully updated");
                                window.location.href = "http://localhost:9494/book_sbazaar.in/home";
                            } else {
                                alert("updation failed!");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("error.......");
                            console.log(jqXHR.responseText);
                            alert("Something Went Wrong");
                        }
                    });
                }else{
                    alert("Operation cancelled");
                }
                });
            });

            function findBookById(bookId) {
                console.log("-----getting the values by id-----");
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