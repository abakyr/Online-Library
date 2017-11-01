<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="font-awesome stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Fjord+One" rel="stylesheet">

    <script type="text/javascript">
        $(document).ready(function () {
            $(target1).css("background-color","#4A96AD");
            $(target2).css("background-color","#4A96AD");
        });

        function booklist() {
            window.location.href = "/books/books";
        }

        function newbook() {
            window.location.href = "/books/newbook";
        }
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
        .rowOne{
            position: relative;
            height: inherit;
            margin: 60px 10px 60px;
            font-size: 16px;
            font-style: normal;
            font-variant: normal;
            font-weight: 500;
            line-height: 16px;
        }
    </style>
</head>
<body style="background-color: #F5F3EE;text-align: center">

<div class="container">

    <div class="panel panel-default">
        <div class="panel-heading" style="color: #7D1935">
            <div class="header">
                <h1>Welcome to Online Library!</h1>
                <hr class="outer-line">
                <i class="fa fa-database fa-3x" aria-hidden="true"></i>
            </div>
        </div>
        <div class="panel-body">
            <div class="rowOne" id="description">
                <h4>
                    This is an online-library to store books, short descriptions.<br>
                    It is great as a notebook for those who often
                    forget "what book he/she wanted to read!".<br>
                    Enjoy!
                </h4>
            </div>
            <br>
            <div class="rowTwo" id="buttons">
                <button class="btn btn-lg btn-primary" id="target2" onclick="newbook()">
                    <span class="glyphicon glyphicon-plus"></span> Add Book</button> |
                <button class="btn btn-lg btn-primary" id="target1" onclick="booklist()">
                    <span class="glyphicon glyphicon-book"></span> List of Books</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>