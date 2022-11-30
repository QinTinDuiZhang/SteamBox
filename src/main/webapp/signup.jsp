<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="index.html" class="navbar-brand"></a>
        </div>
        <label for="toggle-checkbox" id="toggle-label" class="visible-xs-inline-block">菜单</label>
        <input type="checkbox" class="hidden" id="toggle-checkbox">
        <div class="hidden-xs">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#">社区</a></li>
                <li><a href="#">模块</a></li>
                <li><a href="#">模块</a></li>
                <li><a href="#">个人中心</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.html">登陆</a></li>
                <li><a href="signup.html">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container container-small">
    <h1>注册
        <small>已有帐号，<a href="signup.html">登录</a></small>
    </h1>
    <form>
        <div class="form-group">
            <label>QQ邮箱</label>
            <input type="text" class="form-control">
        </div>
        <div class="form-group">
            <label>验证码</label>
            <div class="input-group">
                <input type="text" class="form-control">
                <div class="input-group-btn">
                    <div class="btn btn-default">获取验证码</div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" class="form-control">
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
