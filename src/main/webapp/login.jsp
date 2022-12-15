<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/3
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script src="https://kit.fontawesome.com/d7ff2bf92c.js" crossorigin="anonymous"></script>
    <title>欢迎来到蒸汽盒论坛</title>
    <link rel="stylesheet" href="css/81.css">
</head>

<body>
<a href="first.jsp">
    <button id="return">返回首页</button>
</a>
<div class="container">
    <div class="form-box" style="--clr:#00ccff;--i:0;">
        <!-- 注册 -->
        <div class="register-box hidden">
            <h1>register</h1>
            <form method="post" action="User/Signup" style="padding: 0; width: 230px">
                <input type="text" id="acc" placeholder="用户名" name="acc">
                <div id="ac" style="display: none"><span style="color: #ff6d4a; font-size: 10px;">账号已被注册</span></div>
                <input type="password" id="Spassword" placeholder="密码" name="password">
                <div id="pa" style="display: none"><span style="color: #ff6d4a; font-size: 10px">密码不符合规范哦：由8~13位数字、字母或下划线组成，字母至少一位</span></div>
                <input type="password" id="enterPassword" placeholder="确认密码" oninput="newEnter()">
                <div id="epa" style="display: none"><span style="color: #ff6d4a; font-size: 10px">两次密码不同</span></div>
                <p>
                    <input type="email"
                        placeholder="邮箱"
                        style="width: 172px;margin-top: 0;"
                        name="email"
                        id="email"
                    >
                    <button type="button" style="width: 50px; height: 40px; margin-top: 0" onclick="getEmail()">
                        <i class="fa-sharp fa-solid fa-paper-plane"></i>
                    </button>
                </p>
                <div id="emx" style="display: none"><span style="color: #ff6d4a; font-size: 10px">暂只支持qq邮箱</span></div>
                <div id="em" style="display: none"><span style="color: #d6d02a; font-size: 10px">此邮箱已绑定账号</span></div>
                <input type="text" placeholder="验证码" name="authCode">
                <button type="submit" id="sub">注册</button>
            </form>
        </div>
        <!-- 登录 -->
        <div class="login-box">
            <h1>login</h1>
            <form action="User/Login" method="post">
                <input type="text" name="account" id="account" placeholder="用户名">
                <input type="password" name="Lpassword" id="Lpassword" placeholder="密码">
                <button type="submit">登录</button>
            </form>
        </div>
    </div>
    <div class="con-box left">
        <h2>欢迎来到<span>蒸汽盒</span></h2>
        <p>快来查阅你的专属<span>攻略</span>吧</p>
        <img src="img/黄昏星空.png" style="width: 200px;height: 200px;" alt="">
        <p>已有账号?</p>
        <button id="login">去登录</button>
    </div>
    <div class="con-box right">
        <h2>欢迎来到<span>蒸汽盒</span></h2>
        <p>快来看看你的变强<span>秘籍</span>吧</p>
        <img src="img/山峰星空.png" style="width: 200px;height: 200px;" alt="">
        <p>没有账号？</p>
        <button id="register">去注册</button>
    </div>
</div>
<video id="video" src="videos/登陆注册.mp4"
       style="width: 100%;height: 100%;object-fit: cover;position: absolute;top: 0;left: 0;" autoplay="autoplay"
       loop="loop" muted="muted"></video>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

    let ac = document.getElementById("ac");
    let pa = document.getElementById("pa")
    let epa = document.getElementById("epa");
    let emx = document.getElementById("emx");
    let em = document.getElementById("em");
    let sub = document.getElementById("sub");

    let flogAcc = false;
    let flogPass = false;
    let flogEnPass = false;
    let flogEmail = false;

    window.onload = function () {
        let Spassword = document.getElementById("Spassword");
        let account = document.getElementById("acc");
        let email = document.getElementById("email");
        Spassword.addEventListener("change",news)
        account.addEventListener("change",acc);
        email.addEventListener("change",emailOnblur);
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

    function acc(e){
        if (e.target.value.length === 0) return;
        axios.get('${pageContext.request.contextPath}/User/SelectUser?userName=' + e.target.value)
            .then(function (response){
                flogAcc = !response.data;
                ac.style.display = flogAcc ? "none" : "";
            })
    }

    function getEmail() {
        let email = document.getElementById("email");
        if (email.value.length === 0) return;
        axios.get('${pageContext.request.contextPath}/User/GetEmail?email=' + email.value)
    }

    function newEnter() {
        let S = document.getElementById("Spassword");
        let E = document.getElementById("enterPassword");
        if (E.value.length === 0) return;
        flogEnPass = S.value === E.value;
        epa.style.display = flogEnPass ? "none" : "";
        Cont();
    }

    function news(e) {
        if (e.target.value.length === 0) return;
        flogPass = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9 _]{8,13}$/.test(e.target.value);
        pa.style.display = flogPass ? "none" : "";
        newEnter();
        Cont();
    }

    function emailOnblur(e) {
        if (e.target.value.length === 0) return;
        let reg = /^[1-9]([0-9]{4,10})@qq\.com$/;
        if (reg.test(e.target.value)) {
            //邮箱格式 true
            em.style.display = "none";
            emx.style.display = "none";
        } else {
            //邮箱格式 false
            flogEmail = false;
            emx.style.display = "";
            return;
        }
        axios.get('${pageContext.request.contextPath}/User/SelectEmail?email=' + e.target.value)
            .then(function (response) {
                // 处理成功情况
                console.log(response.data);
                flogEmail = response.data !== "sign";
                em.style.display = flogEmail ? "none" : "";
            })
        Cont();
    }

    function Cont() {
        sub.disabled = (flogAcc && flogEnPass && flogEmail && flogPass);
    }
</script>
</body>

</html>
