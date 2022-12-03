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

    <title>登陆</title>
    <link rel="stylesheet" href="css/81.css">
</head>

<body>
<a href="index.html">
    <button id="rtn">返回首页</button>
</a>
<div class="container">
    <div class="form-box" style="--clr:#00ccff;--i:0;">
        <!-- 注册 -->
        <div class="register-box hidden">
            <h1>register</h1>
            <input type="text" placeholder="用户名">
            <input type="password" placeholder="密码">
            <input type="password" placeholder="确认密码">
            <p>
                <input type="email" placeholder="邮箱" style="width: 172px;">
                <button style="width: 50px; height: 40px;">
                    <svg t="1669984435307" class="icon" viewBox="0 0 1024 1024" version="1.1"
                         xmlns="http://www.w3.org/2000/svg" p-id="4891" width="25" height="20">
                        <path d="M914.6368 136.4992L97.1264 565.9648c-9.728 5.12-9.2672 19.1488 0.7168 23.6544l254.4128 114.176c10.9568 4.9152 23.8592-0.5632 27.8016-12.1856 3.4304-10.1376-2.0992-21.1456-11.8272-25.5488l-189.3376-84.992c-4.9152-2.2016-5.12-9.0624-0.3584-11.5712L808.96 238.2336c1.2288-0.6144 2.4064 0.8704 1.4848 1.8944l-406.9376 464.8448c-0.1536 0.2048-7.3728 8.2944-8.192 13.6704l-22.3232 146.2272c-1.4848 9.6768 3.6864 19.456 12.8 22.8864 12.5952 4.7104 25.6512-3.5328 27.5456-16.0256l19.3536-126.7712c1.024-6.8096 7.68-11.3152 14.3872-9.7792L751.36 819.2c6.656 1.4336 13.3632-2.4576 15.36-8.96L933.2224 152.064c3.5328-11.264-8.2432-21.0432-18.5856-15.5648z m-175.872 625.664a13.17888 13.17888 0 0 1-15.36 8.96L482.304 701.3376c-7.9872-1.8432-11.1104-11.5712-5.6832-17.7152l382.2592-436.6336c0.8192-0.9728 2.4064-0.1536 2.0992 1.0752l-122.2144 514.0992z"
                              fill="#ffffff" p-id="4892"></path>
                    </svg>
                </button>
            </p>
            <input type="text" placeholder="验证码">
            <button>注册</button>
        </div>
        <!-- 登录 -->
        <div class="login-box">
            <h1>login</h1>
            <input type="text" placeholder="用户名">
            <input type="text" placeholder="密码">
            <p>
                <input type="password" placeholder="验证码" style="width: 132px;">
                <img src="" style="width: 90px; height: 40px;" alt="">
            </p>
            <button>登录</button>
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
