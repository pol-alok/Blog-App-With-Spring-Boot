<%--
  Created by IntelliJ IDEA.
  User: alok
  Date: 22/12/2019
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<html lang="en">
<jsp:include page="header.jsp" />
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 m-auto">
            <div class="contact-form">
                <security:authorize access="isAuthenticated()">
                    <h1 class="text-success"> Welcome Mr. <security:authentication property="name"/> !</h1>
                </security:authorize>

<%--                    <security:authorize access="hasRole('ADMIN')"> ADMIN LEVEL PRIVILEGE  </h3>--%>
<%--                        <p>With Great Power Comes great Responsibility</p> </security:authorize>--%>
                <h1>Create New Post</h1>
                <%--@elvariable id="post" type="com.alok.blogappwithboot.resources.models.Posts"--%>
                <form:form action="create-post" method="post" modelAttribute="post">
                <div class="row">
                    <div class="form-group">
                        <label for="PostTitle">Post Title</label>
                        <form:input type="text" class="form-control" id="PostTitle" path="title" required="required"/>


                        <!--required remaining-->
                    </div>
                    <div class="form-group">
                        <label for="inputMessage">Content</label>
                        <form:textarea class="form-control" id="inputMessage" rows="10" path="content" required="required"/>
                        <form:errors path="content" cssClass="error"/>
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
