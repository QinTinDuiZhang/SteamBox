<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/3
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script src="https://kit.fontawesome.com/d7ff2bf92c.js" crossorigin="anonymous"></script>
    <title>登陆</title>
    <link rel="stylesheet" href="css/81.css">
</head>

<body>
<a href="first.jsp">
    <button id="rtn">返回首页</button>
</a>
<div class="container">
    <div class="form-box" style="--clr:#00ccff;--i:0;">
        <!-- 注册 -->
        <div class="register-box hidden">
            <h1>register</h1>
            <form method="post" action="User/Signup" style="padding: 0; width: 230px">
                <input type="text" id="acc" placeholder="用户名">
                <input type="password" id="Spassword" placeholder="密码">
                <input type="password" id="enterPassword" placeholder="确认密码">
                <p>
                    <input type="email" placeholder="邮箱" style="width: 172px;">
                    <button type="button" style="width: 50px; height: 40px;">
                        <i class="fa-sharp fa-solid fa-paper-plane"></i>
                    </button>
                </p>
                <input type="text" placeholder="验证码">
                <button type="submit">注册</button>
            </form>
        </div>
        <!-- 登录 -->
        <div class="login-box">
            <h1>login</h1>
            <form action="User/Login" method="post">
                <input type="text" name="account" id="account" placeholder="用户名">
                <input type="password" name="Lpassword" id="Lpassword" placeholder="密码">
                <p>
                    <input type="text" placeholder="验证码" style="width: 132px;">
                    <img src="img/a.jpg" style="width: 38%; height: 40px;" alt="">
                </p>
                <button type="submit">登录</button>
            </form>
        </div>
    </div>
    <div class="con-box left">
        <h2>欢迎来到<span>蒸汽盒</span></h2>
        <p>快来查阅你的专属<span>攻略</span>吧</p>
        <img src="img/黄昏星空.png" alt="" style="width: 200px;height: 200px;">
        <p>已有账号</p>
        <button id="login">去登录</button>
    </div>
    <div class="con-box right">
        <h2>欢迎来到<span>蒸汽盒</span></h2>
        <p>快来看看你的变强<span>秘籍</span>吧</p>
        <img src="img/山峰星空.png" alt="" style="width: 200px;height: 200px;">
        <p>没有账号？</p>
        <button id="register">去注册</button>
    </div>
</div>
<video id="vdeo" src="videos/登陆注册.mp4"
       style="width: 100%;height: 100%;object-fit: cover;position: absolute;top: 0;left: 0;" autoplay="autoplay"
       loop="loop" muted="muted"></video>

<script>
    window.onload = function () {

    }
    // 要操作到的元素
    let login = document.getElementById('login');
    let register = document.getElementById('register');
    let form_box = document.getElementsByClassName('form-box')[0];
    let register_box = document.getElementsByClassName('register-box')[0];
    let login_box = document.getElementsByClassName('login-box')[0];
    // 去注册按钮点击事件
    register.addEventListener('click', () => {
        form_box.style.transform = 'translateX(80%)';
        login_box.classList.add('hidden');
        register_box.classList.remove('hidden');
    })
    // 去登录按钮点击事件
    login.addEventListener('click', () => {
        form_box.style.transform = 'translateX(0%)';
        register_box.classList.add('hidden');
        login_box.classList.remove('hidden');
    })
</script>
</body>

</html>
