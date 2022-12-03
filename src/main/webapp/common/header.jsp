<%@ page import="com.niuma.dao.UserDao" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %>
<%@ page import="com.niuma.model.Community" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<header class="p-3 text-bg-dark fixed-top">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-between">
            <a href="first.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg t="1670046522107"
                     class="icon"
                     viewBox="0 0 1024 1024"
                     version="1.1"
                     xmlns="http://www.w3.org/2000/svg"
                     p-id="5523"
                     width="32"
                     height="32">
                    <path d="M725.333333 170.666667a213.333333 213.333333 0 1 1-38.058666 423.253333l-113.109334 84.864A170.624 170.624 0 0 1 405.333333 874.666667a170.624 170.624 0 0 1-169.216-193.024L72.874667 615.68l32-79.104 163.242666 65.92a170.496 170.496 0 0 1 157.696-67.925333l87.125334-130.602667A213.333333 213.333333 0 0 1 725.333333 170.666667zM405.333333 618.666667c-19.797333 0-38.058667 6.741333-52.522666 18.090666l68.522666 27.690667a42.666667 42.666667 0 1 1-32 79.104L320.853333 715.946667a85.376 85.376 0 0 0 169.856-11.904 85.333333 85.333333 0 0 0-85.333333-85.333334z m143.530667-114.773334l-41.941333 62.976c12.117333 8.96 23.04 19.541333 32.341333 31.36l58.026667-43.52a215.722667 215.722667 0 0 1-48.426667-50.816zM725.333333 256a128 128 0 1 0 0 256 128 128 0 0 0 0-256z m0 42.666667a85.333333 85.333333 0 1 1 0.042667 170.624A85.333333 85.333333 0 0 1 725.333333 298.666667z"
                          fill="#ffffff"
                          p-id="5524">
                    </path>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
                id="title">
                <%
                    String community = request.getParameter("community"); // 获取新闻分类参数
                    UserDao userDao = new UserDaoImpl();
                    User user = (User) session.getAttribute("user");
                    List<Community> communities;
                    if (user != null) {
                        communities = userDao.getLikeCommunity(user.getId());%>
                <li class="nav-item px-2 ">
                    <a href="first.jsp"
                       class="nav-link px-2<%if (community == null) {%> text-secondary<%}else{%> text-white<%}%>">首页</a>
                </li>
                <%for (Community c : communities) {%>
                <li class="nav-item px-2 ">
                    <a class="nav-link px-2<%if(community!=null && c.getId() == Integer.parseInt(community)){%> text-secondary<%}else{%> text-white<%}%>"
                       href="first.jsp?community=<%=c.getId()%>"><%=c.getName()%></a>
                </li><%}}%>
            </ul>

            <div class="d-flex justify-content-around">
                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
                </form>

                <div class="dropdown text-end">
                    <%if (user == null){%>
                    <a class="nav-link" href="login.jsp" style="margin-top: 10px">登录</a>
                    <%}else{%>
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="img/photos/${user.photo}" alt="mdo" width="32" height="32" class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small">
                        <li><a class="dropdown-item" href="userinfo.jsp">个人信息</a></li>
                        <li><a class="dropdown-item" href="changePassword.jsp">修改密码</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout.jsp">退出</a></li>
                    </ul>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</header>
