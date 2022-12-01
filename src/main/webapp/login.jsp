<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div class="container container-small">
    <h1>登录
        <small>没有帐号？<a href="signup.jsp">注册</a></small>
    </h1>
    <form action="User/Login">
        <div class="form-group">
            <label for="email">QQ邮箱</label>
            <input id="email" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input id="password" type="password" class="form-control"><input type="checkbox" id="remember"><span id="rep">记住密码？</span>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">登录</button>
        </div>
        <div class="form-group">
            <a href="#">忘记密码？</a>
        </div>
    </form>
</div>
<div class="footer">
    Copyright © 2022 zqh.cn | 蒸汽盒开发者2022版
</div>
</body>
</html>
