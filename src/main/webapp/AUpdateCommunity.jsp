<%@ page import="com.niuma.impl.CommunityDaoImpl" %>
<%@ page import="com.niuma.model.Community" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-09
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="webkit" name="renderer">
    <title>网站信息</title>
    <link href="css/pintuer.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <style>
        @font-face {

            font-family: 'Alimama_ShuHeiTi_Bold';

            src: url('./fonts/Alimama_ShuHeiTi_Bold.woff') format('woff'),
            url('./fonts/Alimama_ShuHeiTi_Bold.ttf') format('truetype')
        }

        p, header, a {
            text-decoration: none;
            font-family: Alimama_ShuHeiTi_Bold, serif;
        }
    </style>
</head>
<body>
<%
    String communityId = request.getParameter("comId");
    CommunityDaoImpl communityDao = new CommunityDaoImpl();
    List<Community> community = communityDao.getAllCommunity(Integer.parseInt(communityId));
%>
<div class="panel admin-panel margin-top">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加/修改社区</strong></div>
    <div class="body-content">
        <form action="Community/UpdateCommunityInfo?comId=<%=community.get(0).getId()%>" class="form-x" method="post">
            <input name="id" type="hidden" value=""/>
            <div class="form-group">
                <div class="label">
                    <label for="title">社区名字：</label>
                </div>
                <div class="field">
                    <input class="input w50"
                           data-validate="required:请输入社区名字"
                           id="title"
                           name="title"
                           type="text"
                           value="<%=community.get(0).getName()%>"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="ETitle">商店链接：</label>
                </div>
                <div class="field">
                    <input class="input w50" data-validate="required:请输入商店链接" id="ETitle" name="entitle" type="text"
                           value="<%=community.get(0).getShopLink()%>"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<%--<script>--%>
<%--  var title=document.getElementById("title");--%>
<%--  var link=document.getElementById("ETitle");--%>
<%--  title.addEventListener("change",function () {--%>
<%--    alert(title.value)--%>
<%--  })--%>
<%--  link.addEventListener("change",function () {--%>
<%--    alert(link.value)--%>
<%--  })--%>
<%--</script>--%>
</html>
