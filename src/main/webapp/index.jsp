<%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-11-30
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>蒸汽盒平台</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
</head>
<style>
    @font-face{

        font-family: 'Alimama_ShuHeiTi_Bold';

        src:url('./fonts/Alimama_ShuHeiTi_Bold.woff') format('woff'),

        url('./fonts/Alimama_ShuHeiTi_Bold.ttf') format('truetype')
    }
    p,header,a{
        text-decoration: none;
        font-family: Alimama_ShuHeiTi_Bold, serif;
    }
</style>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div id="bq">
    <span id="zi1">全球最开放的、最简洁的</span><br>
    <span id="zi2">实时游戏论坛平台</span>
</div>

<video autoplay muted loop src="videos/first.mp4" class="movie"  id="videoId"></video>
<div id="btns">
    <a href="login.jsp" class="btn" style="--clr:#00ccff;--i:0;"><span>登陆/注册</span></a>
    <a href="first.jsp" class="btn" style="--clr:#22e622;--i:1;"><span>进入首页</span></a>
</div>

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
        <img src="img/蒸汽盒LOGO.jpg" alt="">
    </div>
</div>
<script>
    document.getElementById("title").style.display = "none";
</script>
</body>
</html>