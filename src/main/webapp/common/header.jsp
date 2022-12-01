<%@ page import="com.niuma.dao.UserDao" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %>
<%@ page import="com.niuma.model.Community" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand"></a>
        </div>
        <label for="toggle-checkbox" id="toggle-label" class="visible-xs-inline-block">菜单</label>
        <input type="checkbox" class="hidden" id="toggle-checkbox">
        <div class="hidden-xs">
            <ul class="nav navbar-nav" id="title">
            </ul>
            <ul class="nav navbar-nav">
                <%
                    String community = request.getParameter("community"); // 获取新闻分类参数
                    UserDao userDao = new UserDaoImpl();
                    List<Community> communities = userDao.getLikeCommunity();
                %>
                <li <%if (community == null) {%> class="active"<%}%>><a href="index.jsp">首页</a></li>
                <% for (Community c : communities) {%>
                    <li <%if(community!=null && c.getId() == Integer.parseInt(community)){%>class="active"<%}%>>
                        <a href="index.jsp?category=<%=c.getId()%>"><%=c.getName()%></a>
                    </li>
                <%}%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${user== null || user == ''}">
                    <li><a href="login.jsp">登录</a></li>
                    <li><a href="signup.jsp">注册</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="#"><img class="img-circle" width="40px" src="img/photos/${user.photo}" alt=""></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.nickname}<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="userinfo.jsp">个人信息</a></li>
                            <li><a href="changePassword.jsp">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="logout.jsp">退出</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
