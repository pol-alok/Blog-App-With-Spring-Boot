<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 22/12/2019
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html lang="en">
<jsp:include page="header.jsp" />
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 m-auto">
            <div class="contact-form">
                <h1>Sign Up</h1>

                <%--@elvariable id="author" type="com.alok.blogappwithboot.resources.models.Author"--%>
                <form:form action="signUp" method="post" modelAttribute="author">
                    <div class="row">
                        <div class="form-group">
                            <label for="name">Author Name</label>
                            <spring:bind path="name">
                            <form:input type="text" class="form-control" id="name" path="name" required="required"/>
                            <form:errors path="name"/>
                            </spring:bind>
                            <!--required remaining-->
                        </div>
                        <div class="form-group">
                            <label for="mail">Email</label>
                            <spring:bind path="email">
                            <form:input type="email" class="form-control" id="mail" path="email" required="required"/>
                            <form:errors path="email"/>
                            </spring:bind>
                            <!--required remaining-->
                        </div>
                        <div class="form-group">
                            <label for="mail">Password</label>
                            <spring:bind path="password">
                            <form:input type="password" class="form-control" id="mail" path="password" required="required"/>
                                <form:errors path="password"/>
                            </spring:bind>
                            <!--required remaining-->
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i> Sign Up
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
