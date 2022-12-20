<%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-06
  Time: 18:02
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
    <title>登录</title>
    <link href="css/pintuer.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<%
    String error = (String) session.getAttribute("err");
%>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="Admin/Login" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                    <div style="text-align: center;color: red"><%=error != null ? error : ""%>
                    </div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input class="input input-big" data-validate="required:请填写账号" name="name"
                                       placeholder="登录账号"
                                       type="text"/>
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input class="input input-big" data-validate="required:请填写密码" name="password"
                                       placeholder="登录密码"
                                       type="password"/>
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                    </div>
                    <div style="padding:30px;"><input class="button button-block bg-main text-big input-big"
                                                      type="submit" value="登录">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
