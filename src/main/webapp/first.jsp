<%@ page import="com.niuma.dao.UserDao" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %>
<%@ page import="com.niuma.dao.ArticleDao" %>
<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.tool.TimeFormat" %>
<%@ page import="com.niuma.model.User" %><%--
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
    <div class="row" style="margin-top: 100px">
        <div class="col-2">
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
        <div class="col-7">
            <%
                String community = request.getParameter("community");
                UserDao userDao = new UserDaoImpl();
                ArticleDao articleDao = new ArticleDaoImpl();
                List<Article> articles = community != null ? articleDao.selectAll(Integer.parseInt(community)): articleDao.selectAll(0);
                for (Article article : articles){%>
            <div>
                <a href="particulars.jsp?article=<%= article.getId()%>">
                    <div class="news-list-item clearfix">
                        <div class="col-xs-7">
                            <p class="title h3 text-white"><%= article.getTitle()%></p>
                        </div>
                        <div class="col-xs-5">
                            <img src="img/cover/<%= article.getImg()%>" alt="">
                        </div>
                        <div class="col-xs-7">
                            <div class="info">
                                <span class="avatar"><img src="img/game.png" alt=""></span>
                                <span><%= userDao.getUserByID(article.getCreator()).getNickName() %></span>•
                                <span>25k评论</span>•
                                <span><%= TimeFormat.getInterval(article.getPubDate())%></span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%}%>
        </div>
    </div>
</div>
<jsp:include page="common/tall.jsp" flush="true"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
