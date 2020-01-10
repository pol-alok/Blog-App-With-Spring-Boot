<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h1>Update Post</h1>
                <%--@elvariable id="singlePost" type="com.blog.Model.Post"--%>
                <form:form action="../update-post" modelAttribute="singlePost">
                    <div class="row">
                        <form:hidden path="pid"/>
                        <div class="form-group">
                            <label for="inputSubject">Post Title</label>
                            <form:hidden path="author"/>
                            <form:input type="text" class="form-control" id="inputSubject" path="title" required="required"/>
                            <!--required remaining-->
                        </div>
                        <div class="form-group">
                            <label for="inputMessage">Content</label>
                            <form:textarea  class="form-control" id="inputMessage" rows="10" path="content" required="required"/><!--required remaining-->
                        </div>

                    </div>
                    <div class="container">
                        <label><form:checkboxes items="${mpOfCategory}" path="categories" itemValue="cid" cssClass="checkbox"/></label>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i> Update
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
