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
                <li><a href="login.html">登陆</a></li>
                <li><a href="signup.html">注册</a></li>
            </ul>
        </div>
    </div>
</div>
