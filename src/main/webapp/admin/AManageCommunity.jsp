<%@ page import="com.niuma.impl.CommunityDaoImpl" %>
<%@ page import="com.niuma.model.Community" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-09
  Time: 16:24
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
    <title>网站信息</title>
    <link href="../css/pintuer.css" rel="stylesheet">
    <link href="../css/admin.css" rel="stylesheet">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
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
<body>
<%
    CommunityDaoImpl communityDao = new CommunityDaoImpl();
    List<Community> allCommunity = communityDao.getAllCommunity(0);
%>
<a class="button border-main" onclick="addCommunity()" type="button" style="margin: 10px"><span
        class="icon-edit"></span>添加社区</a>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 社区列表</strong></div>
    <table class="table table-hover text-center">
        <tr>
            <th width="5%">ID</th>
            <th>是否可见</th>
            <th>社区名字</th>
            <th width="30%">商店链接</th>
            <th width="250">操作</th>
            <th>操作2</th>
        </tr>
        <%for (Community community : allCommunity) {%>
        <tr>
            <td><%=community.getId()%>
            </td>
            <td style="font-size: 20px;color: <%=!community.getHidden() ? "red":"#00aa00"%>"><%=community.getHidden()%>
            </td>
            <td><%=community.getName()%>
            </td>
            <td><%=community.getShopLink()%>
            </td>
            <td>
                <div class="button-group">
                    <a class="button border-main" onclick="startCommunity(<%=community.getId()%>)" type="button"><span
                            class="icon-edit"></span>启用</a>
                    <a class="button border-red" onclick="delCommunity(<%=community.getId()%>)"><span
                            class="icon-trash-o"></span>禁用</a>
                </div>
            </td>
            <td>
                <div>
                    <a class="button border-main" onclick="changeCommunity(<%=community.getId()%>)" type="button"><span
                            class="icon-edit"></span>修改</a>
                </div>
            </td>
        </tr>
        <%}%>
    </table>
</div>
<script>
    function delCommunity(comId) {
        if (confirm("您确定要禁用吗?")) {
            window.location.replace("${pageContext.request.contextPath}/Community/SetCommunityLook?comId=" + comId + "&hidden=0");
        }
    }

    function startCommunity(comId) {
        if (confirm("您确定要启用吗?")) {
            window.location.replace("${pageContext.request.contextPath}/Community/SetCommunityLook?comId=" + comId + "&hidden=1");
        }
    }

    function changeCommunity(comId) {
        window.location.replace("${pageContext.request.contextPath}/admin/AUpdateCommunity.jsp?comId=" + comId);
    }

    function addCommunity() {
        window.location.replace("${pageContext.request.contextPath}/admin/AAddCommunity.jsp");
    }
</script>
</body>
</html>
