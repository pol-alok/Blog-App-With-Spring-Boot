<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Blog App</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Courgette|Pacifico:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        .error {
            color: #ff0000;
            font-style: italic;
            font-weight: bold;
        }
    </style>
    <script>
        function setUrl(param, paramValue) {
            var params = new URLSearchParams(location.search);
            params.set(param, paramValue);
            window.history.replaceState({}, "", location.pathname + '?' + params);
            location.reload();
        }

    </script>

</head>