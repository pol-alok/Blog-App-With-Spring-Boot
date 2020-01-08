<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="com.alok.blogappwithboot.resources.models.Posts" %>
<%@ page import="java.util.List" %>
<%@ page import="com.alok.blogappwithboot.resources.models.Category" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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

        /*    ------------------------------------*/
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,100,900);

        html,
        body {
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            height: 100%;
            width: 100%;
            background: #FFF;
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
        }

        .wrapper {
            display: table;
            height: 100%;
            width: 100%;
        }

        .container-fostrap {
            display: table-cell;
            padding: 1em;
            text-align: center;
            vertical-align: middle;
        }

        .fostrap-logo {
            width: 100px;
            margin-bottom: 15px
        }

        h1.heading {
            color: #fff;
            font-size: 1.15em;
            font-weight: 900;
            margin: 0 0 0.5em;
            color: #505050;
        }

        @media (min-width: 450px) {
            h1.heading {
                font-size: 3.55em;
            }
        }

        @media (min-width: 760px) {
            h1.heading {
                font-size: 3.05em;
            }
        }

        @media (min-width: 900px) {
            h1.heading {
                font-size: 3.25em;
                margin: 0 0 0.3em;
            }
        }

        .card {
            display: block;
            margin-bottom: 20px;
            line-height: 1.42857143;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            transition: box-shadow .25s;
        }

        .card:hover {
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .img-card {
            width: 100%;
            height: 200px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            display: block;
            overflow: hidden;
        }

        .img-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: all .25s ease;
        }

        .card-content {
            padding: 15px;
            text-align: left;
        }

        .card-title {
            margin-top: 0px;
            font-weight: 700;
            font-size: 1.65em;
        }

        .card-title a {
            color: #000;
            text-decoration: none !important;
        }

        .card-read-more {
            border-top: 1px solid #D4D4D4;
        }

        .card-read-more a {
            text-decoration: none !important;
            padding: 10px;
            font-weight: 600;
            text-transform: uppercase
        }

        .chip {
            display: inline-block;
            padding: 0 25px;
            height: 50px;
            font-size: 16px;
            line-height: 50px;
            border-radius: 25px;
            background-color: #f1f1f1;
        }

        .chip img {
            float: left;
            margin: 0 10px 0 -25px;
            height: 50px;
            width: 50px;
            border-radius: 50%;
        }
    </style>
    <script>
        function setUrl(param, paramValue) {
            const params = new URLSearchParams(location.search);
            params.set(param, paramValue);
            window.history.replaceState({}, "", location.pathname + '?' + params);
            location.reload();
        }
    </script>

</head>

<body>
<nav class="navbar navbar-inverse ">
    <div class="container-fluid ">
        <div class="navbar-header">
            <a class="navbar-brand logo" href="../posts">Blog</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Sort By <span
                    class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a onclick="setUrl('sortBy','title')">Title</a></li>
                    <li><a onclick="setUrl('sortBy','createdAt')">Created Date</a></li>
                    <li><a onclick="setUrl('sortBy','updatedAt')">Updated Date</a></li>
                </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Category <span
                    class="caret"></span></a>

                <ul class="dropdown-menu">
                    <c:forEach items="${lstOfCategory}" var="cat">
                        <li><a onclick="setUrl('category','${cat.CName}')">${cat.CName}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>
        <div class="navbar-form navbar-left">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" id="SearchBox" name="text">
                <div class="input-group-btn">
                    <button class="btn btn-default" onclick="setUrl('text',document.getElementById('SearchBox').value)">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </div>

        <ul class="nav navbar-nav navbar-right">

            <security:authorize access="isAuthenticated()">
                <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <li><a href="create-category"><span class="glyphicon glyphicon-user"></span>Create New Category</a></li>
            </security:authorize>
            <security:authorize access="!isAuthenticated()">
                <li><a href="signUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </security:authorize>
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
                    <%List<Posts> posts = (List<Posts>) request.getAttribute("lstOfPosts");%>
                    <% for (Posts post : posts) { %>
                    <section class="wrapper">
                        <div class="container-fostrap">
                            <div class="content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-10">
                                            <div class="card">
                                                <a class="img-card"
                                                   href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">
                                                    <img src="https://blog.hdwallsource.com/wp-content/uploads/2016/02/tree-bark-26070-26755-hd-wallpapers.jpg"/>
                                                </a>
                                                <div class="card-content">
                                                    <h4 class="card-title">
                                                        <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"><%=post.getTitle()%>
                                                        </a>
                                                    </h4>
                                                    <p class="">
                                                        <% if(post.getContent().length()>200) { %>
                                                        <%=post.getContent().substring(0, 200)%>...
                                                        <%} else {%>
                                                        <%=post.getContent()%>
                                                        <%}%>

                                                    </p>
                                                </div>
                                                <div class="card-content">
                                                    <%List<Category> currentPostCategories = post.getCategories();%>
                                                    <%for (Category cat : currentPostCategories) {%>
                                                    <span class="badge"
                                                          style="background: dodgerblue">#<%=cat.getCName()%></span>
                                                    <%}%>
                                                </div>
                                                <div class="card-content">
                                                    <div class="chip">
                                                        <img src="https://retohercules.com/images/img_avatar-png.png"
                                                             alt="Author Name"> <%=post.getAuthor().getName()%>
                                                    </div>
                                                </div>
                                                <div class="card-content">
                                                <span class="badge" style="background: forestgreen">Created At :<%=post.getCreatedAt()%>s</span>&nbsp; &nbsp; &nbsp; &nbsp;
                                                <span class="badge" style="background: yellowgreen">Last Updated At : <%=post.getUpdatedAt()%></span>
                                                </div>
                                                <div class="card-read-more">
                                                    <a href="/read-post-<%=post.getPid()%>"
                                                       class="btn btn-link btn-block">
                                                        Read More
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageNo > 0}">
                        <li class="page-item">
                            <a class="page-link" href="posts?page=${pageNo - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="posts?page=${pageNo - 1}">${pageNo}</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="posts?page=${pageNo}">${pageNo + 1}</a></li>
                    <c:if test="${pageNo < lastPage}">
                        <li class="page-item"><a class="page-link" href="posts?page=${pageNo + 1}">${pageNo + 2}</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="posts?page=${pageNo + 1}" aria-label="Next">
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

