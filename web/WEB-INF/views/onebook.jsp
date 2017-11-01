<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="font-awesome stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Fjord+One" rel="stylesheet">

    <script type="text/javascript">
        function startPage() {
            window.location.href = "/home/";
        }

        function updatePage(id) {
            window.location.href = "/books/update-book/"+id;
        }

        function books() {
            window.location.href = "/books/books";
        }

        function deleteBook(id) {
            window.location.href = "/books/delete-book/"+id;
        }

        $(document).ready(function () {
            $(startpage).css("background-color","#4A96AD");
            $(updatebook).css("background-color","#4A96AD");
            $(booksid).css("background-color","#4A96AD");
        });
    </script>

    <style>
        .container{
            position: relative;
            height: inherit;
            margin-top: 80px;
            color: #7D1935;
            font-family: 'Fjord One', serif;
        }

        .outer-line {
            width: 85%;
            border-bottom: 2px solid #7D1935;
        }

        .header{
            margin-bottom: 40px;
        }
    </style>
</head>
<body style="background-color: #F5F3EE; text-align: center">
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading" style="color: #7D1935">
            <div class="header">
                <h2>A Name of the Book: ${book.name}</h2>
                <hr class="outer-line">
            </div>
        </div>
        <div class="panel-body">
            <div class="media">
                <div class="media-left">
                    <img class="media-object" style="width:140px"
                            <c:choose>
                                <c:when test="${empty book.image}">
                                    src="<c:url value="img/if_image_118660.png"/>"
                                </c:when>
                                <c:otherwise>
                                    src="<c:url value="/books/showimage/${book.id}"/>"
                                </c:otherwise>
                            </c:choose>
                    />
                </div>
                <div class="media-body">
                    <table class="table table-user-information">
                        <tbody>
                        <tr>
                            <td>Name</td>
                            <td>${book.name}</td>
                        </tr>
                        <tr>
                            <td>Author</td>
                            <td>${book.author}</td>
                        </tr>
                        <tr>
                            <td>Short Description</td>
                            <td>${book.description}</td>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <div>
                        <form method="post" action="/books/uploadimage/${book.id}" enctype="multipart/form-data">
                            <table border="0">
                                <tr>
                                    <td>Pick an image: </td>
                                    <td><input type="file" name="fileToUpload" size="50" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"><input type="submit" value="Upload" /></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <br>
                    <div>
                        <button class="btn btn-lg btn-success" id="updatebook" onclick="updatePage(${book.id})">
                            <i class="fa fa-pencil-square-o"></i> Update Book</button> |
                        <button class="btn btn-lg btn-primary" id="startpage" onclick="startPage()">
                            <i class="fa fa-home"></i> Home </button> |
                        <button class="btn btn-lg btn-primary" id="booksid" onclick="books()">
                            <i class="fa fa-list"></i> List of Books</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
