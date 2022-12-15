<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %>
<%@ page import="com.niuma.model.User" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-14
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
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
    ArticleDaoImpl articleDao = new ArticleDaoImpl();
    Map<String, Object> map = new HashMap<>();
    map.put("auditor", -1);
    List<Article> articles = articleDao.selectAll(map);
%>
<form action="" id="listform" method="post">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 待审核帖子列表</strong> <a href=""
                                                                                  style="float:right; display:none;">添加字段</a>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th style="text-align:left; padding-left:20px;" width="100">ID</th>
                <th width="20%">标题</th>
                <th>图片</th>
                <th width="10%">发布时间</th>
                <th>发布者</th>
                <th width="10%">操作1</th>
                <th width="10%">操作2</th>
            </tr>
            <volist id="vo" name="list">
                <%for (Article article : articles) {%>
                <tr>
                    <th style="text-align:left; padding-left:20px;padding-bottom: 20px;"><%=article.getId()%>
                    </th>
                    <td><%=article.getTitle()%>
                    </td>
                    <td width="10%"><img alt="" height="50" src="img/cover/<%=article.getImg()%>" width="70"/>
                    </td>
                    <%
                        String dateStr = String.valueOf(article.getPubDate());
                        DateFormat cstFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        DateFormat gmtFormate = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                        Date dateTime = gmtFormate.parse(dateStr);
                        String dateString = cstFormate.format(dateTime);
                    %>
                    <td><%=dateString%>
                    </td>
                    <%
                        UserDaoImpl userDao = new UserDaoImpl();
                        User user = userDao.getUserByID(article.getCreator(), null, null);
                    %>
                    <td><font color="#00bfff"><%=user.getNickName()%>
                    </font></td>
                    <td>
                        <a class="button border-main" onclick="Through(<%=article.getId()%>)"><span
                                class="icon-edit"></span> 通过</a>
                    </td>
                    <td>
                        <div class="button-group">
                            <a class="button border-red" onclick="setBack(<%=article.getId()%>)"><span
                                    class="icon-trash-o"></span> 退回</a>
                        </div>
                    </td>
                </tr>
                <%}%>
            </volist>
        </table>
    </div>
</form>
<script type="text/javascript">

    function Through(ArticleId) {
        if (confirm("您确定要通过吗?")) {
            window.location.replace("http://localhost:8080/SteamBox_war_exploded/Article/setArticleLook?articleId=" + ArticleId + "&hidden=1");
        }
    }

    function setBack(ArticleId) {
        if (confirm("您确定要退回吗?")) {
            window.location.replace("http://localhost:8080/SteamBox_war_exploded/Article/setArticleLook?articleId=" + ArticleId + "&hidden=0");
        }
    }

    //全选
    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            this.checked = !this.checked;
        });
    })

    //批量删除
    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
            $("#listform").submit();
        } else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {


            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var i = 0;
            $("input[name='id[]']").each(function () {
                if (this.checked == true) {
                    i++;
                }
            });
            if (i > 1) {
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected", "selected");
            } else {

                $("#listform").submit();
            }
        } else {
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected", "selected");
            return false;
        }
    }

</script>
</body>
</html>

