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
                <h1>Are you sure!</h1>
                <div class="row">
                        <div class="text-center">
                            <a href="../post/${id}" class="btn btn-primary"><i class="fa fa-close"></i> No Cancel </a>
                        </div>
                        <div class="text-center">
                           <form method="post" action="../delete-post/${id}">
                               <button type="submit" class="btn btn-primary"><i class="fa fa-trash"></i> Yes Delete</button>
                           </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>