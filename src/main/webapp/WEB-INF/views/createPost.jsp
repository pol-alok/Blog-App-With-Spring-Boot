<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 22/12/2019
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>New Post</title>
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
    </style>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 m-auto">
            <div class="contact-form">
                <h1>Create New Post</h1>

                <%--@elvariable id="post" type="com.alok.blogappwithboot.resources.models.Posts"--%>
                <form:form action="create-post" method="post" modelAttribute="post">
                <div class="row">
                    <div class="form-group">
                        <label for="PostTitle">Post Title</label>
                        <form:input type="text" class="form-control" id="PostTitle" path="title"/>
                        <!--required remaining-->
                    </div>
                    <div class="form-group">
                        <label for="inputMessage">Content</label>
                        <form:textarea class="form-control" id="inputMessage" rows="10" path="content"/>
                        <!--required remaining-->
                    </div>

                    <div class="container">
                      <label><form:checkboxes items="${mpOfCategory}" path="categories" itemValue="cid" cssClass="checkbox"/></label>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i> Publish
                        </button>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
