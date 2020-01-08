<%@ page import="com.alok.blogappwithboot.resources.models.Posts" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="com.alok.blogappwithboot.resources.models.Category" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 22/12/2019
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Full Post</title>
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

        .update-delete {
            background: black;
            color: #d8b012;
        }
    </style>

</head>
<body>
<%Posts post = (Posts) request.getAttribute("post");%>
<section class="wrapper">
    <div class="container-fostrap">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
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
                                    <%=post.getContent()%>
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
                                <span class="badge" style="background: forestgreen">Created At :<%=post.getCreatedAt()%>s</span>&nbsp;
                                &nbsp; &nbsp; &nbsp;
                                <span class="badge"
                                      style="background: yellowgreen">Last Updated At : <%=post.getUpdatedAt()%></span>
                            </div>
                            <security:authorize access="isAuthenticated()">


                                <%
                                    String authorName = post.getAuthor().getName();
                                    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                                    String currentAuthor = "";
                                    String authorities = "";
                                    if (principal instanceof UserDetails) {
                                        currentAuthor = ((UserDetails) principal).getUsername();
                                        authorities = String.valueOf(((UserDetails) principal).getAuthorities());
                                    } else {
                                        currentAuthor = principal.toString();
                                    }
                                    if (authorName.equals(currentAuthor) || authorities.equals("[ROLE_ADMIN]")) {
                                %>
                                <hr>
                                <div class="card-edit-delete">
                                    <a href="../../update-post/<%=post.getPid()%>" class="btn update-delete"><i
                                            class="fa fa-edit"></i>
                                        Update Post </a>
                                    <a href="../../delete-post/<%=post.getPid()%>" class="btn update-delete"><i
                                            class="fa fa-trash"></i>
                                        Delete Post </a>
                                    <br>
                                    <br>
                                </div>
                                <%
                                    }
                                %>
                            </security:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
