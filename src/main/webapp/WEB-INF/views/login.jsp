<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 22/12/2019
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>



<html lang="en">
<jsp:include page="header.jsp" />
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 m-auto">
            <div class="contact-form">
                <h1>Log In</h1>
                ${SPRING_SECURITY_LAST_EXCEPTION.message}
                <%--@elvariable id="post" type="com.alok.blogappwithboot.resources.models.Posts"--%>
                <form action="login" method="post" >
                    <div class="row">
                        <div class="form-group">
                            <label for="AuthorName">Author Name</label>
                            <input type="text" class="form-control" id="AuthorName" name="username" />
                            <!--required remaining-->
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password"/>
                            <!--required remaining-->
                        </div>

                        <div class="container">
                            <label for="checkbox">Remember me</label>
                            <input type="checkbox" id="checkbox" name="remember-me">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i> Log In
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
