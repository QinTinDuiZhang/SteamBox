<%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-11-30
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>蒸汽盒平台</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/rotationChart1.css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="index.html" class="navbar-brand"></a>
        </div>
        <!-- class="visible-xs-inline-block"：在超小屏幕上显示-->
        <label for="toggle-checkbox" id="toggle-label" class="visible-xs-inline-block">菜单</label>
        <input type="checkbox" class="hidden" id="toggle-checkbox">
        <div class="hidden-xs">
            <!-- <ul class="nav navbar-nav">
                <li><a href="#">首页</a></li>
                <li><a href="#">英雄联盟</a></li>
                <li><a href="#">魔兽</a></li>
                <li><a href="#">黑魂</a></li>
                <li><a href="#">艾尔登</a></li>
                <li><a href="#">战地5</a></li>
            </ul> -->
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.html">登陆</a></li>
                <li><a href="signup.html">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="bq">
    <span id="zi1">全球最开放的、最简洁的</span><br>
    <span id="zi2">实时游戏论坛平台</span>
</div>

<video autoplay muted loop src="videos/first.mp4" class="movie"  id="videoId"></video>

<div class="footer1">
    <div class="mk6">
        <div class="mk6-part1">
            <p class="part1-title">关注我们</p>
            <i class="fa fa-qq "></i>
            <i class="fa fa-wechat"></i>
            <i class="fa fa-weibo"></i>
            <i class="fa fa-twitter"></i>
            <i class="fa fa-linkedin-square"></i>
        </div>
        <div class="mk6-part2">
            <p class="part2-title">加入我们</p>
            <p class="part2-zi">社会招聘</p>
            <p class="part2-zi">校园招聘</p>
            <p class="part2-zi">国际招聘</p>
        </div>
        <div class="mk6-part3">
            <p class="part3-title">联系我们</p>
            <p class="part3-zi">客户服务</p>
            <p class="part3-zi">合作洽谈</p>
            <p class="part3-zi">公司采购</p>
            <p class="part3-zi">媒体及投资者</p>
        </div>
        <div class="mk6-part4">
            <p class="part4-title">法律信息</p>
            <p class="part4-zi">服务协议</p>
            <p class="part4-zi">隐私政策</p>
            <p class="part4-zi">知识产权</p>
        </div>
        <div class="mk6-part5">
            <p>法律声明 阳光准则 网站地图 粤网文【2022】6138-1456号 粤B2-20090059 粤公网安备44030502008569号</p>
            <p>Copyright © 1998 - 2022 ChengDu. All Rights Reserved. 成都公司 版权所有</p>
        </div>
        <img src="img/蒸汽盒LOGO.jpg">
    </div>
</div>
</body>
</html>