<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse ">
    <div class="container-fluid ">
        <div class="navbar-header">
            <a class="navbar-brand logo" href="../">Blog</a>
        </div>
        <c:if test="${pageContext.request.httpServletMapping.matchValue.endsWith('home')}">
        <ul class="nav navbar-nav">
            <li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Sort By <span
                    class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a onclick="setUrl('sortBy','title')">Title</a></li>
                    <li><a onclick="setUrl('sortBy','createdAt')">Created Date</a></li>
                    <li><a onclick="setUrl('sortBy','updatedAt')">Updated Date</a></li>
                </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Category <span
                    class="caret"></span></a>

                <ul class="dropdown-menu">
                    <c:forEach items="${lstOfCategory}" var="cat">
                        <li><a onclick="setUrl('category','${cat.CName}')">${cat.CName}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>
        <div class="navbar-form navbar-left">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" id="SearchBox" name="keyword">
                <div class="input-group-btn">
                    <button class="btn btn-default" onclick='setUrl("keyword",document.getElementById("SearchBox").value)'>
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </div>
        </c:if>


        <ul class="nav navbar-nav navbar-right">

            <security:authorize access="isAuthenticated()">
                <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <li><a href="create-category"><span class="glyphicon glyphicon-user"></span>Create New Category</a></li>
            </security:authorize>
            <security:authorize access="!isAuthenticated()">
                <li><a href="signUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </security:authorize>
        </ul>
    </div>

</nav>
