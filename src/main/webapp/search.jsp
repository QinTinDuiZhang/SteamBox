<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/5
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>蒸汽盒平台</title>
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
    a {
        text-decoration: none;
        font-family: Alimama_ShuHeiTi_Bold, serif;
    }

    * {
        color: white;
    }

    .box {
      /* margin-top: 50px; */
        position: absolute;
        width: 50px;
        height: 50px;
        left: 45%;
        margin-top: 70px;
        border-top: 30px solid rgb(11, 203, 242);
        border-left: 30px solid transparent;
        border-right: 30px solid transparent;
        border-bottom: 30px solid transparent;
    }

    .box:hover {
        transition: 0.3s;
        border-top: 30px solid rgb(219, 15, 15);
        border-left: 30px solid transparent;
        border-right: 30px solid transparent;
        border-bottom: 30px solid transparent;
    }

    .box:hover + #community {
        display: inline-block;
    }

    #community:hover {
        display: inline-block;
    }

    #community {
        z-index: 5;
        background-color: #310534;
        width: 1000px;
        height: auto;
        transition: 0.5s;
        display: none;
        position: absolute;
        border: 3px solid rgb(163, 159, 159);
        left: 250px;
        top: 110px;
    }

    #father {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-around;

    }

    .child {
        display: flex;
        flex-direction: column;
    }

    .child > a {
        margin-top: 15px;
    }
</style>

<body>
<!--    <jsp:include page="common/header.jsp" flush="true"></jsp:include>-->
<div class="container" style="background-color: rgb(9, 26, 65);">
    <div class="box"></div>
    <div id="community" style="padding: 50px;">
        <div id="father">
            <div class="child">
                <a>你好</a>
                <a>你好522</a>
                <a>你好254</a>
                <a>你好244</a>
                <a>你好4254</a>
            </div>
            <div>
                <a>为什么</a>
            </div>
            <div>
                <a>为什么</a>
            </div>
            <div>
                <a>为什么</a>
            </div>
            <div>
                <a>为什么</a>
            </div>

        </div>
    </div>
    <div class="row" id="row" style="margin-top: 110px;background-color: #2c355b;">
        <div class="col" style="margin: 20px;">
            <div>
                <a href="particulars.jsp" class="row">
                    <div class="col-4">
                        <img src="img/game.png" alt="">
                    </div>
                    <div class="col-8 row">
                        <div class="col-12">
                            <p class="title h3" style="margin-top: 18px;">游戏商城的下一场黑色星期五特卖即将来临</p>
                        </div>
                        <div class="col-7 align-self-end" style="margin-bottom: 10px;">
                            <div class="info">
                                <span class="avatar"><img src="img/game.png" alt=""></span>
                                <span>sadhkj-xicuo</span>•
                                <span>25k评论</span>•
                                <span>10分钟前</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <hr style="margin-top: 15px;">
        <div class="col" style="margin: 20px;">
            <div>
                <a href="particulars.jsp" class="row">
                    <div class="col-4">
                        <img src="img/game.png" alt="">
                    </div>
                    <div class="col-8 row">
                        <div class="col-12">
                            <p class="title h3" style="margin-top: 18px;">游戏商城的下一场黑色星期五特卖即将来临</p>
                        </div>
                        <div class="col-7 align-self-end" style="margin-bottom: 10px;">
                            <div class="info">
                                <span class="avatar"><img src="img/game.png" alt=""></span>
                                <span>sadhkj-xicuo</span>•
                                <span>25k评论</span>•
                                <span>10分钟前</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <hr style="margin-top: 15px;">
        <div class="col" style="margin: 20px;">
            <div>
                <a href="particulars.jsp" class="row">
                    <div class="col-4">
                        <img src="img/game.png" alt="">
                    </div>
                    <div class="col-8 row">
                        <div class="col-12">
                            <p class="title h3" style="margin-top: 18px;">游戏商城的下一场黑色星期五特卖即将来临</p>
                        </div>
                        <div class="col-7 align-self-end" style="margin-bottom: 10px;">
                            <div class="info">
                                <span class="avatar"><img src="img/game.png" alt=""></span>
                                <span>sadhkj-xicuo</span>•
                                <span>25k评论</span>•
                                <span>10分钟前</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <hr style="margin-top: 15px;">
    </div>
</div>
<!--    <jsp:include page="common/tall.jsp" flush="true"></jsp:include>-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>
