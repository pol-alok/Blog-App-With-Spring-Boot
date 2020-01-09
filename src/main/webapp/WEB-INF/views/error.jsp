<html lang="en">
<jsp:include page="header.jsp"/>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 m-auto">
            <div class="contact-form">
                <h1>${(error!=null) ? error : "Somthing Went Wrong!..."}</h1>
                <div class="row">
                    <div class="text-center">
                        <a href="../" class="btn btn-primary"><i class="fa fa-home"></i> Home </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>