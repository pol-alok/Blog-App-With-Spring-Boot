<%@ page import="com.alok.blogappwithboot.dao.Posts" %>
<html lang="en">
<jsp:include page="header.jsp"/>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 m-auto">
            <div class="contact-form">
                <%Posts post = (Posts) request.getAttribute("thisPost");%>
                <h1>${(delete!=null) ? delete : (create!=null) ? create: (update!=null) ? update :(signUp!=null) ? signUp : "ok"}</h1>
                <div class="row">
                    <div class="text-center">
                        <%if (post != null) {%>
                        <a href="/post/<%=post.getPid()%>" class="btn btn-primary"><i class="fa fa-eye"></i> Show Post
                        </a>
                        <%} else {%>
                        <%String del = (String) request.getAttribute("delete");%>
                        <%if (del == null) {%>
                        <a href="${(signUp!=null) ? "../login" : (delete!=null) ? "../" :"/"}"
                           class="btn btn-primary"><i class="fa fa-eye"></i> ${(signUp!=null) ? "Login" : "Show Post"}
                        </a>
                        <%}%>
                        <%}%>
                    </div>
                    <div class="text-center">
                        <a href="${(signUp!=null) ? "../" : (delete!=null) ? "../" :"/"}" class="btn btn-primary"><i
                                class="fa fa-home"></i> Home </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>