<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="another stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/WEB-INF/views/css/newbook.css" />
    <link rel="font-awesome stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Fjord+One" rel="stylesheet">

    <script type="text/javascript">

        $(document).ready(function () {
            $(returnback).css("background-color","#4A96AD");
            $(updatebook).css("background-color","#4A96AD");
        });

        function backPage(id) {
            window.location.href = "/books/book/"+id;
        }

        function create() {
            var serviceUrl = "/books/update-book/${book.id}";

            function validateRequiredField(field) {
                if (field.val() == "") {
                    field.parent().addClass("has-error");
                    field.parent().children(".help-block").html("Attribute can not be blank");
                    return false;
                }
                else {
                    field.parent().removeClass("has-error");
                    return true;
                }
            }

            function validateRequiredFields() {
                if (!validateRequiredField($("#name")))
                    return false;
                if (!validateRequiredField($("#author")))
                    return false;
                if (!validateRequiredField($("#description")))
                    return false;
                return true;
            }

            function validateForm() {
                if (!validateRequiredFields())
                    return false;
                return true;
            }

            function clearForm() {
                $("#name").val("");
                $("#author").val("");
                $("#description").val("");
            }

            if (validateForm()) {
                var book = {
                    name: $("#name").val(),
                    author: $("#author").val(),
                    description: $("#description").val()
                };

                $.ajax({
                    url: serviceUrl,
                    type: "PUT",
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    data: JSON.stringify(book),
                    async: false,
                    success: function (result) {
                        $(".alert").addClass("alert-success");
                        $(".alert").html("Book has been updated successfuly!");
                        clearForm();
                        window.scrollTo(0, 0);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $(".alert").addClass("alert-danger");
                        $(".alert").html("Book addition failed!");
                        window.scrollTo(0, 0);
                    }
                });
            }

            jQuery(document).ready(function () {
                $("#name").on("blur", function () {
                    validateRequiredField($(this));
                });
                $("#author").on("blur", function () {
                    validateRequiredField($(this));
                });
                $("#description").on("blur", function () {
                    validateRequiredField($(this));
                });
            })
        }
    </script>

    <style>
        .container{
            color: #7D1935;
            font-family: 'Fjord One', serif;
        }
    </style>
</head>
<body style="background-color: #F5F3EE">
<div class="wrap">
    <div class="container">
        <div class="alert"></div>
        <div class="form-group required">
            <label for="name" class="control-label">Name of the Book</label>
            <input id="name" class="form-control" placeholder="${book.name}">
            <div class="help-block"></div>
        </div>

        <div class="form-group required">
            <label for="author" class="control-label">Author's first and last names</label>
            <input id="author" class="form-control" placeholder="${book.author}">
            <div class="help-block"></div>
        </div>

        <div class="form-group required">
            <label for="description" class="control-label">Short Description</label>
            <input id="description" class="form-control input-lg" type="text" placeholder="${book.description}">
            <div class="help-block"></div>
        </div>
        <br>
        <div>
            <button class="btn btn-lg btn-success" id="updatebook" onclick="create()">
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update Book</button> |
            <button class="btn btn-lg btn-primary" id="returnback" onclick="backPage(${book.id})">
                <i class="fa fa-home" aria-hidden="true"></i> Book Page</button>
        </div>

    </div>
</div>
</body>
</html>