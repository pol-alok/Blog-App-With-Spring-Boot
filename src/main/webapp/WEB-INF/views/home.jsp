<%@ page import="java.util.List" %>
<%@ page import="com.alok.blogappwithboot.dao.Posts" %>
<%@ page import="com.alok.blogappwithboot.dao.Category" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<jsp:include page="header.jsp" />
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 m-auto">
                <div class="contact-form">
                    <h1>Welcome to Blog</h1>
                    <div class="row">

                        <div class="text-center">
                            <a href="../../create-post" class="btn btn-primary"><i class="fa fa-paper-plane"></i><i
                                    class="fa fa-plus"></i> Create New Post </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 m-auto">
                <div class="contact-form">
                    <%List<Posts> posts = (List<Posts>) request.getAttribute("lstOfPosts");%>
                    <% for (Posts post : posts) { %>
                    <section class="wrapper">
                        <div class="container-fostrap">
                            <div class="content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-10">
                                            <div class="card">
                                                <a class="img-card"
                                                   href="/post/<%=post.getPid()%>">
                                                    <img src="https://blog.hdwallsource.com/wp-content/uploads/2016/02/tree-bark-26070-26755-hd-wallpapers.jpg"/>
                                                </a>
                                                <div class="card-content">
                                                    <h4 class="card-title">
                                                        <a href="/post/<%=post.getPid()%>"><%=post.getTitle()%>
                                                        </a>
                                                    </h4>
                                                    <p class="">
                                                        <% if(post.getContent().length()>200) { %>
                                                        <%=post.getContent().substring(0, 200)%>...
                                                        <%} else {%>
                                                        <%=post.getContent()%>
                                                        <%}%>

                                                    </p>
                                                </div>
                                                <div class="card-content">
                                                    <%List<Category> currentPostCategories = post.getCategories();%>
                                                    <%for (Category cat : currentPostCategories) {%>
                                                    <a href="?category=<%=cat.getCName()%>"><span class="badge" style="background: dodgerblue">#<%=cat.getCName()%></span></a>
                                                    <%}%>
                                                </div>
                                                <div class="card-content">
                                                    <div class="chip">
                                                        <a href="?author=<%=post.getAuthor().getName()%>"><img src="https://retohercules.com/images/img_avatar-png.png"
                                                             alt="Author Name"> <%=post.getAuthor().getName()%></a>
                                                    </div>
                                                </div>
                                                <div class="card-content">
                                                <span class="badge" style="background: forestgreen">Created At :<%=post.getCreatedAt()%>s</span>&nbsp; &nbsp; &nbsp; &nbsp;
                                                <span class="badge" style="background: yellowgreen">Last Updated At : <%=post.getUpdatedAt()%></span>
                                                </div>
                                                <div class="card-read-more">
                                                    <a href="/post/<%=post.getPid()%>"
                                                       class="btn btn-link btn-block">
                                                        Read More
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageNo > 0}">
                        <li class="page-item">
                            <a class="page-link" onclick="setUrl('page',${pageNo - 1})" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" onclick="setUrl('page',${pageNo - 1})">${pageNo-1}</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" onclick="setUrl('page',${pageNo})">${pageNo}</a></li>
                    <c:if test="${pageNo < lastPage}">
                        <li class="page-item"><a class="page-link" onclick="setUrl('page',${pageNo +1})">${pageNo + 1}</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" onclick="setUrl('page',${pageNo + 1})" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>

