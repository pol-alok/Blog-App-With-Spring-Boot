<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="com.alok.blogappwithboot.dao.Posts" %>
<%@ page import="com.alok.blogappwithboot.dao.Category" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<%Posts post = (Posts) request.getAttribute("post");%>
<section class="wrapper">
    <div class="container-fostrap">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="card">
                            <a class="img-card"
                               href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">
                                <img src="https://blog.hdwallsource.com/wp-content/uploads/2016/02/tree-bark-26070-26755-hd-wallpapers.jpg"/>
                            </a>
                            <div class="card-content">
                                <h4 class="card-title">
                                    <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"><%=post.getTitle()%>
                                    </a>
                                </h4>
                                <p class="">
                                    <%=post.getContent()%>
                                </p>
                            </div>
                            <div class="card-content">
                                <%List<Category> currentPostCategories = post.getCategories();%>
                                <%for (Category cat : currentPostCategories) {%>
                                <span class="badge"
                                      style="background: dodgerblue">#<%=cat.getCName()%></span>
                                <%}%>
                            </div>
                            <div class="card-content">
                                <div class="chip">
                                    <img src="https://retohercules.com/images/img_avatar-png.png"
                                         alt="Author Name"> <%=post.getAuthor().getName()%>
                                </div>
                            </div>
                            <div class="card-content">
                                <span class="badge" style="background: forestgreen">Created At :<%=post.getCreatedAt()%>s</span>&nbsp;
                                &nbsp; &nbsp; &nbsp;
                                <span class="badge"
                                      style="background: yellowgreen">Last Updated At : <%=post.getUpdatedAt()%></span>
                            </div>
                            <security:authorize access="isAuthenticated()">


                                <%
                                    String authorName = post.getAuthor().getName();
                                    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                                    String currentAuthor = "";
                                    String authorities = "";
                                    if (principal instanceof UserDetails) {
                                        currentAuthor = ((UserDetails) principal).getUsername();
                                        authorities = String.valueOf(((UserDetails) principal).getAuthorities());
                                    } else {
                                        currentAuthor = principal.toString();
                                    }
                                    if (authorName.equals(currentAuthor) || authorities.equals("[ROLE_ADMIN]")) {
                                %>
                                <hr>
                                <div class="card-edit-delete">
                                    <a href="../../update-post/<%=post.getPid()%>" class="btn update-delete"><i
                                            class="fa fa-edit"></i>
                                        Update Post </a>
                                    <a href="../../delete-post/<%=post.getPid()%>" class="btn update-delete"><i
                                            class="fa fa-trash"></i>
                                        Delete Post </a>
                                    <br>
                                    <br>
                                </div>
                                <%
                                    }
                                %>
                            </security:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
