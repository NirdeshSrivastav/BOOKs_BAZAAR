<%-- 
    Document   : delete_book
    Created on : Jan 8, 2024, 11:37:57 AM
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
        <title>DELETE BOOK</title>
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

            <form action="/delete_book" class="second" id="myForm2" >
                <div class="search">
                    <!--     <select id="bookSelect" style="display:none;">
                   <option value="NONE">NONE</option>-->
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
                        readonly
                        />
                    <input
                        type="text"
                        placeholder="Enter book author"
                        class="inputs"
                        name="new-author"
                        id="new-author"
                        readonly
                        />
                    <input
                        type="text"
                        placeholder="Enter book cost"
                        class="inputs"
                        name="new-cost"
                        id="new-cost"
                        readonly
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
                            Delete Book
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
                // Rest of your code

                // Get the selected book ID from the dropdown
                var selectedBookId = book_id;
                console.log("-----option selected-----");

                // Find the selected book details using the findBookById function
                var selectedBook = findBookById(selectedBookId);

                // Fill the input fields in Form 2 with the selected book details
                if (selectedBook) {
                    $("#book_id").val(book_id);
                    $("#new-name").val(selectedBook[1]);
                    $("#new-cost").val(selectedBook[2]);
                    $("#new-author").val(selectedBook[3]);
                    $("#new-genre").val(selectedBook[4]);
                }
            }

            $(document).ready(function () {
                
               // Click event for the "Go to Home" button
                $("#goHome").on("click", function () {
                    window.location.href = "http://localhost:9494/book_sbazaar.in/home";
                }); 
                
                
                //          $("#myForm2").hide();
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
                        beforeSend: function () {
                            //              $(".loader").show();
                            //              $(".form").hide();
                        },
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
                                // Books found, populate the select options
                                alert("Books found");
                                $("#myForm").show();
                                books = data;
                                // Populate the select options with book names
                                for (var i = 0; i < data.length; i++) {
                                    let rs = data[i].split('||');
                                    selectOptions.append("<option value='" + rs[0] + "' onclick='changing(" + rs[0] + ")' >" + rs[1] + "</option>");
                                }
                                //                $(".myForm2").show();
                                //                window.location.href = "home.jsp";
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
                    let confirmation = confirm("Do you want to delete this book");
                    if (confirmation) {
                        $.ajax({
                            beforeSend: function () {
                                //              $(".loader").show();
                                //              $(".form").hide();
                            },
                            url: "delete_book",
                            data: formData,
                            type: "post",
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                console.log("success.......");
                                if (data.trim() === "done") {
                                    alert("Successfully deleted");
                                    window.location.href = "home.jsp";
                                } else {
                                    alert("deletion failed!");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("error.......");
                                console.log(jqXHR.responseText);
                                alert("dletion failed! error");
                            }
                        });
                    } else {
                        alert("Operation cancelled");
                    }
                });






                // Helper function to find a book by ID in the response array
            });

            function findBookById(bookId) {
//                var result;
                console.log("-----getting the values by id-----");
                // Assuming books array has been received from the server
                for (var i = 0; i < books.length; i++) {
                    let rs = books[i].split('||');
                    if (rs[0] == bookId) {
                        return rs;
                    }
//                                    selectOptions.append("<option value='" + rs[0] + "'>" + rs[1] + "</option>");
                }
                // Return null if book not found (you can handle this case accordingly)
                return null;
            }

        </script> 
        <%@include  file="footer.jsp"%>
    </body>
</html>