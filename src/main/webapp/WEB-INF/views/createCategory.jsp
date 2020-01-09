<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <security:authorize access="hasRole('ADMIN')">
                    <h1>Create New Category</h1>
                    <%--@elvariable id="category" type="com.alok.blogappwithboot.resources.models.Category"--%>
                    <form:form action="create-category" method="post" modelAttribute="category">
                        <div class="row">
                            <div class="form-group">
                                <label for="category-name">Category Name</label>
                                <form:input type="text" class="form-control" id="category-name" path="CName"/>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i> Create
                                </button>
                            </div>
                        </div>
                    </form:form>
                </security:authorize>
                <security:authorize access="!hasRole('ADMIN')">
                <h1 class="ui-state-error-text">Sorry! You are not Admin :( </h1>
                </security:authorize>
            </div>
        </div>
    </div>
</div>
</body>
</html>