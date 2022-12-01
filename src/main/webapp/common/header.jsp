<%@ page import="com.niuma.dao.UserDao" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    UserDao userDao = new UserDaoImpl();
%>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand"></a>
        </div>
        <!-- class="visible-xs-inline-block"：在超小屏幕上显示-->
        <label for="toggle-checkbox" id="toggle-label" class="visible-xs-inline-block">菜单</label>
        <input type="checkbox" class="hidden" id="toggle-checkbox">
        <div class="hidden-xs">
            <ul class="nav navbar-nav" id="title">
                <c:forEach var="" items="" ></c:forEach>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${user== null || user == ''}">
                    <li><a href="./login.jsp">登录</a></li>
                    <li><a href="./signup.jsp">注册</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="#"><img class="img-circle" width="40px" src="img/photos/${user.photo}" alt=""></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.nickname}<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="./userinfo.jsp">个人信息</a></li>
                            <li><a href="./changePassword.jsp">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="./logout.jsp">退出</a></li>
                        </ul>
                    </li>
                    <li><a href="./signup.jsp">注册</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
