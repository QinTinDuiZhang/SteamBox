<%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-06
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="webkit" name="renderer">
    <title>后台管理中心</title>
    <link href="../css/pintuer.css" rel="stylesheet">
    <link href="../css/admin.css" rel="stylesheet">
    <script src="../js/jquery.js"></script>
    <style>
        @font-face {

            font-family: 'Alimama_ShuHeiTi_Bold';

            src: url('../fonts/Alimama_ShuHeiTi_Bold.woff') format('woff'),
            url('../fonts/Alimama_ShuHeiTi_Bold.ttf') format('truetype')
        }

        p, header, a {
            text-decoration: none;
            font-family: Alimama_ShuHeiTi_Bold, serif;
        }
    </style>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img alt=""
                 class="radius-circle rotate-hover"
                 height="50"
                 src="../img/y.jpg"/>后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green"
                           href="../index.jsp"
                           target="_blank"><span class="icon-home"></span>
        前台首页</a> &nbsp;&nbsp;<a class="button button-little bg-blue" href="#"><span class="icon-wrench"></span>
        清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="ALogin.jsp"><span
            class="icon-power-off"></span> 退出登录</a></div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本设置</h2>
    <ul style="display:block">
        <li><a href="AChangePassword.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="AManagerUser.jsp" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>内容管理</h2>
    <ul>
        <li><a href="AManageCommunity.jsp" target="right"><span class="icon-caret-right"></span>社区管理</a></li>
        <li><a href="AManageArticle.jsp" target="right"><span class="icon-caret-right"></span>帖子管理</a></li>
        <li><a href="AManageClassification.jsp" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a class="icon-home" href="{:U('Index/info')}" target="right"> 首页</a></li>
    <li><a href="#" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
    <iframe height="100%" name="right" rameborder="0" scrolling="auto" src="AWelcome.jsp" width="100%">
    </iframe>
</div>
<script>

</script>
</body>
</html>
