<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 17:05
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

    p, header, a {
        text-decoration: none;
        font-family: Alimama_ShuHeiTi_Bold, serif;
    }
</style>

<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div class="container">
    <div class="row" style="margin-top: 110px">
        <div class="col-sm-2">
            <div class="list-group side-bar hidden-xs">
                <a href="#" class="list-group-item">动作</a>
                <a href="#" class="list-group-item">单机</a>
                <a href="#" class="list-group-item">经营</a>
                <a href="#" class="list-group-item">策略</a>
                <a href="#" class="list-group-item">网游</a>
                <a href="#" class="list-group-item">塔防</a>
                <a href="#" class="list-group-item">卡牌</a>
                <a href="#" class="list-group-item">模拟</a>
                <a href="#" class="list-group-item">冒险</a>
            </div>
        </div>
        <div class="col-sm-7">
            <div>
                <a href="particulars.jsp">
                    <div class="news-list-item clearfix">
                        <div class="col-xs-7">
                            <p class="title h3">游戏商城的下一场黑色星期五特卖即将来临</p>
                        </div>
                        <div class="col-xs-5">
                            <img src="img/game.png" alt="">
                        </div>
                        <div class="col-xs-7">
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
        <div class="col-sm-3">
            <div class="side-bar-card">
                <div class="card-title">最新折扣</div>
                <div class="card-body">
                    <div class="list">
                        <div class="item">
                            <img src="./img/山羊.png" alt="">
                            <a class="title" href="#">化身山羊。《Goat Simulator 3》现已在Epic游戏商城独占发布。</a>
                            <div class="desc">￥83</div>
                        </div>
                        <div class="item">
                            <img src="./img/山羊.png" alt="">
                            <a class="title" href="#">化身山羊。《Goat Simulator 3》现已在Epic游戏商城独占发布。</a>
                            <div class="desc">￥83</div>
                        </div>
                        <div class="item">
                            <img src="./img/山羊.png" alt="">
                            <a class="title" href="#">化身山羊。《Goat Simulator 3》现已在Epic游戏商城独占发布。</a>
                            <div class="desc">￥83</div>
                        </div>
                        <div class="item">
                            <img src="./img/山羊.png" alt="">
                            <a class="title" href="#">化身山羊。《Goat Simulator 3》现已在Epic游戏商城独占发布。</a>
                            <div class="desc">￥83</div>
                        </div>
                        <div class="item">
                            <img src="./img/山羊.png" alt="">
                            <a class="title" href="#">化身山羊。《Goat Simulator 3》现已在Epic游戏商城独占发布。</a>
                            <div class="desc">￥83</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/tall.jsp" flush="true"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
