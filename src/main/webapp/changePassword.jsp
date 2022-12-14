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
<% User user = (User) session.getAttribute("user");%>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div id="app">
    <div class="container">
        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        修改密码
                    </h3>
                </div>
                <div class="panel-body" style="padding: 20px;">
                    <form action="User/ChangePassword" class="form-horizontal" role="form" method="post"
                          enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="account" class="col-sm-2 control-label">账户：</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control" name="account" id="account"
                                       value="<%= user.getAccount()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">原密码：</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="oldPassword" placeholder="请输入原密码" id="old">
                                <p class="alert alert-danger" id="oldPassword" style="display: none">密码不正确，请重新输入</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新密码：</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="newPassword"
                                       placeholder="请输入您的新密码" onchange="news()" id="new">
                                <p class="alert alert-danger" style="display: none" id="newPassword">
                                    密码不符合规范哦：由8~13位数字、字母或下划线组成，字母至少一位</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">确认密码：</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="enterPassword"
                                       placeholder="请确认您密码" oninput="newEnter()" id="enter">
                                <p class="alert alert-danger" style="display: none" id="enterPassword">两次密码不一致，请重新输入</p>
                            </div>
                        </div>
                        <div class="form-group d-grid col-10">
                            <button class="btn btn-primary" type="submit" id="sub" disabled>提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
<%--<script src="js/lmd5.js"></script>--%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

    let o = document.getElementById("old");
    let n = document.getElementById("new");
    let en = document.getElementById("enter");

    let oldP = document.getElementById("oldPassword");
    let newP = document.getElementById("newPassword");
    let enterP = document.getElementById("enterPassword");

    let sub = document.getElementById("sub");

    let flogOld = false;
    let flogNew = false;
    let flogEnter = false;
    let flogAll = true;

    window.onload = function (){
        o.addEventListener("change",old);
    }

    function old() {
        axios.get('${pageContext.request.contextPath}/User/P?password=' + event.target.value)
            .then(function (response) {
                flogOld = Boolean(response.data);
                oldP.style.display = flogOld ? "none" : "" ;
            })
            .catch(function (error) {
                console.log(error);
            });
        AllCont();
    }

    function newEnter() {
        flogEnter = en.value === n.value;
        enterP.style.display = flogEnter ? "none" : "";
        AllCont();
    }

    function news() {
        flogNew = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9 _]{8,13}$/.test(n.value);
        newP.style.display = flogNew ? "none" : "";
        newEnter();
        AllCont();
    }

    function AllCont() {
        flogAll = !(flogOld && flogEnter && flogNew && newPassword);
        sub.disabled = flogAll
    }
</script>
</body>
</html>