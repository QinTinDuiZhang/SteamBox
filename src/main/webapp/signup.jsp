<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div class="container container-small">
    <h1>注册
        <small>已有账号，<a href="signup.jsp">登录</a></small>
    </h1>
    <form action="User/Signup">
        <div class="form-group">
            <label for="email">QQ邮箱</label>
            <input id="email" type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="authCode">验证码</label>
            <div class="input-group">
                <input id="authCode" type="text" class="form-control">
                <div class="input-group-btn">
                    <div class="btn btn-default">获取验证码</div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input id="password" type="password" class="form-control">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">注册</button>
        </div>
        <div class="form-group">
            注册蒸汽盒平台账号即代表您同意<a href="#">蒸汽盒开发者服务条款</a>
        </div>
    </form>
</div>
<div class="footer">
    Copyright © 2022 zqh.cn | 蒸汽盒发者2022版
</div>
</body>
</html>
