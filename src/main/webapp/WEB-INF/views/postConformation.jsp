<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Conformation Page</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--    <link rel="stylesheet" href="css/fromStyle.css">--%>
    <%--    <link href="@Url.Content('~/css/formStyle.css')" rel="stylesheet" type="text/css" />--%>
    <style>
        html,
        body{
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
        .contact-form , .contact-form .btn {
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

                <h1>${(delete!=null) ? delete : (create!=null) ? create: (update!=null) ? update :(signUp!=null) ? signUp : "ok"}</h1>
                <div class="row">
                    <div class="text-center">
                        <a href="${(signUp!=null) ? "../login" : (delete!=null) ? "../posts" :"/posts"}" class="btn btn-primary"><i class="fa fa-eye"></i> ${(signUp!=null) ? "Login" : "Show Posts"} </a>
                    </div>
                    <div class="text-center">
                        <a href="${(signUp!=null) ? "../posts" : (delete!=null) ? "../posts" :"/posts"}" class="btn btn-primary"><i class="fa fa-home"></i> Home </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>