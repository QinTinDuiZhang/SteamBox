<%@ page import="com.niuma.impl.AdminDaoImpl" %>
<%@ page import="com.niuma.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.tool.TimeFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-07
  Time: 15:26
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
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
    AdminDaoImpl adminDao = new AdminDaoImpl();
    List<User> allUser = adminDao.getAllUser();
%>
<form>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 用户管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <%--          <button class="button border-green" id="checkall" type="button"><span class="icon-check"></span> 全选--%>
                    <%--          </button>--%>
                    <button class="button border-red" onclick="DelSelect()"><span class="icon-trash-o"></span> 批量禁用
                    </button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>禁用与否</th>
                <th width="120">ID</th>
                <th>昵称</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>账号</th>

                <th width="120">注册时间</th>
                <th>操作</th>
            </tr>
            <%for (int i = 0; i < allUser.size(); i++) {%>
            <tr class="lie">

                <td>
                    <input class="allCheck" name="id[]" <%=!allUser.get(i).isForbidden() ? "checked" : ""%>
                           type="checkbox"/>
                </td>
                <td>
                    <%=allUser.get(i).getId()%>
                </td>
                <td><%=allUser.get(i).getNickName()%>
                </td>
                <td><%=allUser.get(i).getMobile()%>
                </td>
                <td><%=allUser.get(i).getEmail()%>
                </td>
                <td><%=allUser.get(i).getAccount()%>
                </td>
                <%
                    String dateStr = String.valueOf(allUser.get(i).getRegDate());
                    DateFormat cstFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    DateFormat gmtFormate = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                    Date dateTime = gmtFormate.parse(dateStr);
                    String dateString = cstFormate.format(dateTime);
                %>
                <td><%=dateString%>
                </td>
                <td>
                    <a class="button border-main"
                       onclick="up1(<%=allUser.get(i).getId()%>,<%=allUser.get(i).isForbidden()%>)" type="button"><span
                            class="icon-edit"></span>启用</a>
                    <div class="button-group"><a class="button border-red"
                                                 onclick="up2(<%=allUser.get(i).getId()%>,<%=allUser.get(i).isForbidden()%>)"><span
                            class="icon-trash-o"></span> 禁用</a></div>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</form>
<script type="text/javascript">
    window.onload = function () {
        let user = document.getElementsByClassName('lie');
        console.log(user)
        for (var i = 0; i < user.length; i++) {
            user[i].addEventListener('dblclick', function (e) {
                var a = this.children.item(1).innerText;
                var b = this.children.item(2).innerText;
                window.location.replace("http://localhost:8080/SteamBox_war_exploded/Comment/GetUserComment?userid=" + a + "&name=" + b);
            })
        }
    }

    function up1(id, info) {
        if (info == false) {
            if (confirm("您确定要启用吗?")) {
                axios({
                    method: "post",
                    url: "http://localhost:8080/SteamBox_war_exploded/Admin/BanUser",
                    data: {
                        id: id,
                        forbidden: 1
                    }
                }).then(function (resp) {
                    window.location.reload()
                })
            }
        }
    }

    function up2(id, info) {
        if (info == true) {
            if (confirm("您确定要禁用吗?")) {
                axios({
                    method: "post",
                    url: "http://localhost:8080/SteamBox_war_exploded/Admin/BanUser",
                    data: {
                        id: id,
                        forbidden: 0
                    }
                }).then(function (resp) {
                    window.location.reload()
                })
            }
        }
    }


    function DelSelect() {
        var userid = [];
        if (confirm("您确定要禁用吗?")) {
            let user = document.getElementsByClassName('lie');
            for (var i = 0; i < user.length; i++) {
                var ckbx = user[i].childNodes.item(1).childNodes.item(1);
                if (ckbx.checked) {
                    userid.push(user[i].children.item(1).innerText)
                }
                console.log(userid)
            }
            if (userid != null) {
                axios({
                    method: "post",
                    url: "http://localhost:8080/SteamBox_war_exploded/Admin/BanManyUsers",
                    data: userid,
                }).then(function (resp) {

                })
            }
        }
    }

</script>
</body>
</html>
