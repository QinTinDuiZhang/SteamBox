<%@ page import="com.niuma.model.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-06
  Time: 18:45
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

        #warning {
            color: red;
            position: relative;
            top: 10px;
            left: 30px;
        }
    </style>
</head>
<body>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    String updateInfo = (String) session.getAttribute("updateInfo");
%>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员密码</strong></div>
    <div class="body-content">
        <form action="Admin/ChangePassword" class="form-x" method="post">
            <div class="form-group">
                <div class="label">
                    <label>管理员帐号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <%=admin.getAccount()%>
                    </label><span style="color: green"><%=updateInfo != null ? updateInfo : ""%></span>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="mpass">原始密码：</label>
                </div>
                <div class="field">
                    <input class="input w50" data-validate="required:请输入原始密码" id="mpass" name="mpass"
                           placeholder="请输入原始密码" size="50"
                           type="password"/><label id="warning"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="newpass">新密码：</label>
                </div>
                <div class="field">
                    <input class="input w50"
                           data-validate="required:请输入新密码,length#>=5:新密码不能小于5位"
                           id="newpass"
                           name="newpass"
                           placeholder="请输入新密码"
                           size="50"
                           type="password"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="enterpass">确认新密码：</label>
                </div>
                <div class="field">
                    <input class="input w50"
                           data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致"
                           id="enterpass"
                           name="renewpass"
                           placeholder="请再次输入新密码"
                           size="50"
                           type="password"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button id="btn" class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    let oldPassword = document.getElementById('mpass');
    let newPassword = document.getElementById('newpass');
    let enterPassword = document.getElementById('enterpass');
    let warning = document.getElementById('warning');
    let btn = document.getElementById('btn');
    oldPassword.addEventListener('change', function (e) {
        if (e.target.value !=<%=admin.getPassword()%>) {
            warning.innerHTML = '原始密码不对！'
        }
        if (e.target.value == null || e.target.value == '' || e.target.value ==<%=admin.getPassword()%>) {
            warning.innerHTML = ''
        }
    })
    enterPassword.addEventListener('change', function (e) {
        if (e.target.value != newPassword.value) {
            btn.disabled = true;
        }
        if (e.target.value == newPassword.value) {
            btn.disabled = false;
        }
    })


</script>
</body>
</html>
