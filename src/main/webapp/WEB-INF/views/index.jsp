<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--    <link rel="stylesheet" href="css/fromStyle.css">--%>
    <%--    <link href="@Url.Content('~/css/formStyle.css')" rel="stylesheet" type="text/css" />--%>
    <style>
        html,
        body {
            color: #000;
            background-color: #fcda2e !important;
            font-family: "Roboto", sans-serif;
        }

        .contact-form {
            padding: 50px;
            margin: 30px auto;
        }

        .contact-form h1 {
            font-size: 42px;
            font-family: 'Pacifico', sans-serif;
            margin: 0 0 50px;
            text-align: center;
        }

        .contact-form .form-group {
            margin-bottom: 20px;
        }

        .contact-form, .contact-form .btn {
            min-height: 38px;
            border-radius: 2px;
        }

        .contact-form:focus {
            border-color: #d8b012;
            box-shadow: 0 0 8px #dcae10;
        }

        .contact-form .btn-primary {
            min-width: 250px;
            color: #fcda2e;
            background: #000;
            margin-top: 20px;
            border: none;
        }

        .contact-form .btn-primary:hover {
            color: #fff;
        }

        .contact-form .btn-primary i {
            margin-right: 5px;
        }

        .contact-form label {
            opacity: 0.9;
        }

        .contact-form textarea {
            resize: vertical;
        }

        .card {
            border-radius: 10px;
            box-shadow: 5px 5px 8px rgba(91, 91, 91, 0.8), 10px 10px 8px rgba(91, 91, 91, 0.8);
        }

        .logo {
            font-family: 'Pacifico', sans-serif;
        }

        .nav.navbar-nav.navbar-right li a {
            color: #fcda2e;
        }

        .nav.navbar-nav.navbar-right li a:hover {
            color: #fff;
        }
    </style>

</head>

<body>
<nav class="navbar navbar-inverse ">
    <div class="container-fluid ">
        <div class="navbar-header">
            <a class="navbar-brand logo" href="#">Blog</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="../0">Home</a></li>
            <li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Sort By <span
                    class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/home/page/order-by-title/0">Title</a></li>
                    <li><a href="/home/page/order-by-create/0">Created Date</a></li>
                    <li><a href="/home/page/order-by-update/0">Updated Date</a></li>
                </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Category <span
                    class="caret"></span></a>

                <ul class="dropdown-menu">
                    <c:forEach items="${lstOfCategory}" var="cat">
                        <li><a href="/posts/find-by-${cat.CName}/${cat.cid}/0">${cat.CName}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-left" action="/post">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="text">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="create-category"><span class="glyphicon glyphicon-user"></span>Create New Category</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 m-auto">
                <div class="contact-form">
                    <h1>Welcome to Blog</h1>
                    <div class="row">
                        <div class="text-center">
                            <a href="../../create-post" class="btn btn-primary"><i class="fa fa-paper-plane"></i><i
                                    class="fa fa-plus"></i> Create New Post </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 m-auto">
                <div class="contact-form">
                    <c:forEach var="pst" items="${lstOfPosts}">
                        <div class="row card">
                            <div class="col-md-8 m-auto">

                                <h3>${pst.title}</h3>
                                <p>${pst.content}</p>
                                    <%--                            <c:set var = "now" value = "<%=%>" />--%>
                                    <%--                            <p>Formatted Date (6): <fmt:formatDate type = "both" dateStyle = "long" timeStyle = "long" value = "${pst.createdAt}" /></p>--%>
                                <span><h4>Created At : </h4>${pst.createdAt}</span> &nbsp; &nbsp; &nbsp; &nbsp;
                                <span><h4>Updated At : </h4>${pst.updatedAt}</span>
                            </div>
                            <div class="col-md-3">
                                <a href="../../update-post/${pst.pid}" class="btn btn-primary"><i
                                        class="fa fa-edit"></i>
                                    Update Post </a>
                                <a href="../../delete-post/${pst.pid}" class="btn btn-primary"><i
                                        class="fa fa-trash"></i>
                                    Delete Post </a>
                            </div>
                        </div>
                        <br>
                        <br>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageNo > 0}">
                        <li class="page-item">
                            <a class="page-link" href="${pageNo - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="${pageNo - 1}">${pageNo}</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${pageNo}">${pageNo + 1}</a></li>
                    <c:if test="${pageNo < lastPage}">
                        <li class="page-item"><a class="page-link" href="${pageNo + 1}">${pageNo + 2}</a></li>
                        <li class="page-item">
                            <a class="page-link" href="${pageNo + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>

