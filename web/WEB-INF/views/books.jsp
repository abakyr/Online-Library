<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of books</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="font-awesome stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Fjord+One" rel="stylesheet">

    <script type="text/javascript">
        $(document).ready(function () {
            $(target1).css("background-color","#4A96AD");
            $(target2).css("background-color","#4A96AD");
            $(deletebutton).css("background-color", "#d3361d");
        });

        function startPage() {
            window.location.href = "/home/";
        }

        function addABook() {
            window.location.href = "/books/newbook";
        }

        jQuery(document).ready(function($) {
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
        });


        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
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

        .header{
            margin-bottom: 40px;
        }

    </style>

</head>
<body style="background-color: #F5F3EE;text-align: center">
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading" style="color: #7D1935">
            <div class="header">
                <h1><i class="fa fa-book" aria-hidden="true"></i> List of Books</h1>
                <h4>This is a list of books that are currently in the library</h4>
                <br>
                <input class="form-control" id="myInput" type="text" placeholder="Search..">
            </div>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Author</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody id="myTable">
                    <c:forEach var="book" items="${list.listIterator()}">
                        <tr class="clickable-row" data-href="<c:url value="/books/book/${book.id}"/>">
                            <td><c:out value="${book.name}"></c:out></td>
                            <td><c:out value="${book.author}"></c:out></td>
                            <td><form action="/books/delete-book/${book.id}"  method="post">
                                <input class="btn btn-sm btn-danger" type="submit" id="deletebutton" value="Delete"/>
                                <i class="fa fa-trash-o" aria-hidden="true"></i></form></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <br>
            <div>
                <button class="btn btn-lg btn-primary" id="target1" onclick="startPage()">
                    <i class="fa fa-home"></i> Home </button> |
                <button class="btn btn-lg btn-primary" id="target2" onclick="addABook()">
                    <span class="glyphicon glyphicon-plus"></span> Add Book</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
