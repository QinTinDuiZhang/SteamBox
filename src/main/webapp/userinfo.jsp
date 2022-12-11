<%@ page import="com.niuma.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhao
  Date: 2022/10/12
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>个人信息</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/main.css">
</head>
<style>
    @font-face {

        font-family: 'Alimama_ShuHeiTi_Bold';

        src: url('./fonts/Alimama_ShuHeiTi_Bold.woff') format('woff'),
        url('./fonts/Alimama_ShuHeiTi_Bold.ttf') format('truetype')
    }

    p,
    header,
    a, h1, h2, h3, h4, h5, h6, label {
        text-decoration: none;
        font-family: Alimama_ShuHeiTi_Bold, serif;

    }

    * {
        color: #e5e5e5;
    }
</style>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<% User user = (User) session.getAttribute("user");%>
<div class="container" style="background-color: #444444">
    <div class="container">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">
                    修改个人信息
                </h3>
            </div>
            <div class="panel-body" style="padding: 20px;">
                <form action="User/Userinfo" class="form-horizontal" role="form" method="post"
                      enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="account" class="col-sm-2 control-label">账户：</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control" name="account" id="account">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nickname" class="col-sm-2 control-label">昵称：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nickname" id="nickname"
                                   placeholder="请输入昵称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">生日：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="birthday" id="birthday"
                                   placeholder="请选择您的出生日期" value="<%= user.getBirthday()%>"><%-- 这里不能用vue绑定，日期选择器，有bug --%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">电子邮件：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email" placeholder="请输入电子邮件">
                            <p class="alert alert-danger">此邮箱已绑定其他账号</p>
                            <p class="alert alert-warning">暂时只支持QQ邮箱</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emailE" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <input type="text" class="form-control" id="emailE" name="emailE">
                                <div class="input-group-btn" id="getEmail">
                                    <div class="btn btn-default" style="background-color: #d24c4c">获取验证码</div>
                                </div>
                            </div>
                        </div>
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="col-sm-2 control-label">手机号码：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="mobile" id="mobile" placeholder="请输入手机号码">
                            <p class="alert alert-danger">请填如正确的手机号</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="photo" class="col-sm-2 control-label">
                            <img id="slt" src="img/photo/<%= user.getPhoto()%>" class="img-thumbnail" width="70px"
                                 height="70px" alt="">
                            <br> 头像：
                        </label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" name="photo" id="photo" placeholder="请选择头像照片"
                                   accept="image/jpg,image/jpeg,image/png"
                                   onchange="upload">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" disabled="">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/tail.jsp" flush="true"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script>
    $().ready(function () {
        // 设置日期选择器
        $('#birthday').datepicker({
            language: 'zh-CN', //语言
            clearBtn: true,//清除按钮
            format: "yyyy-mm-dd",//日期格式
        });
    });


    function upload(event) {
        document.getElementById("slt");
        let files = event.target.files[0];
        this.url = this.getObjectUrl(files);
    }

    function getObjectUrl(file) {
        let url = null;
        if (window.createObjectURL !== undefined) {
            // basic
            url = window.createObjectURL(file);
        } else if (window.webkitURL !== undefined) {
            // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        } else if (window.URL !== undefined) {
            // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        }
        return url;
    }
</script>
</body>
</html>