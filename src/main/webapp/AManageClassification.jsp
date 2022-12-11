<%@ page import="com.niuma.impl.CategoryDaoImpl" %>
<%@ page import="com.niuma.model.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-10
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="webkit" name="renderer">
    <title></title>
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
    CategoryDaoImpl categoryDao = new CategoryDaoImpl();
    List<Category> allCategory = categoryDao.getAllCategory();
%>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 分类列表</strong></div>
    <table class="table table-hover text-center">
        <tr>
            <th width="15%">ID</th>
            <th width="20%">分类名</th>
            <th width="20%">是否可用</th>
            <th width="30%">操作</th>
        </tr>
        <%for (Category category : allCategory) {%>
        <tr>
            <td style="font-size: 20px"><%=category.getId()%>
            </td>
            <td style="font-size: 20px"><%=category.getName()%>
            </td>
            <td style="font-size: 20px;color: <%=!category.getHidden() ? "red":"#00aa00"%>"><%=category.getHidden()%>
            </td>
            <td>
                <a class="button border-main"
                   onclick="openClassification(<%=category.getId()%>)" type="button"><span
                        class="icon-edit"></span>启用</a>
                <div class="button-group"><a class="button border-red"
                                             onclick="closeClassification(<%=category.getId()%>)"><span
                        class="icon-trash-o"></span>
                    禁用</a></div>
            </td>
        </tr>
        <%}%>
    </table>
</div>
<script type="text/javascript">
    function closeClassification(classId) {
        if (confirm("您确定要禁用吗?")) {
            window.location.replace("http://localhost:8080/SteamBox_war_exploded/Category/SetClassLook?classId=" + classId + "&hidden=0");
        }
    }

    function openClassification(classId) {
        if (confirm("您确定要启用吗?")) {
            window.location.replace("http://localhost:8080/SteamBox_war_exploded/Category/SetClassLook?classId=" + classId + "&hidden=1");
        }
    }
</script>
<div class="panel admin-panel margin-top">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加分类</strong></div>
    <div class="body-content">
        <form action="Category/AddClassification" class="form-x" method="post">
            <div class="form-group">
                <div class="label">
                    <label>分类名字：</label>
                </div>
                <div class="field">
                    <input class="input w50" name="title" type="text"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>