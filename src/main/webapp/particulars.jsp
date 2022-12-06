<%@ page import="com.niuma.dao.ArticleDao" %>
<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.tool.TimeFormat" %>
<%@ page import="com.niuma.dao.CategoryDao" %>
<%@ page import="com.niuma.impl.CategoryDaoImpl" %>
<%@ page import="com.niuma.model.Category" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.niuma.dao.CommentDao" %>
<%@ page import="com.niuma.impl.CommentDaoImpl" %>
<%@ page import="com.niuma.dao.CommunityDao" %>
<%@ page import="com.niuma.impl.CommunityDaoImpl" %>
<%@ page import="com.niuma.model.Community" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/3
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻详情</title>
    <link rel="stylesheet" href="./css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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

    #bg {
        background: #d1d5d6;
        padding: 20px;
    }
</style>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div class="row justify-content-center" id="bg" style="margin-top: 88px">
    <%
        ArticleDao articleDao = new ArticleDaoImpl();
        Article article = articleDao.selectAll(Integer.parseInt(request.getParameter("article"))).get(0);
    %>
    <div class="col-7">
        <h1 class="news-title"><%= article.getTitle() %></h1>
        <div class="news-status">25k阅读•<%= TimeFormat.getInterval(article.getPubDate()) %>
            <%
                CategoryDao categoryDao = new CategoryDaoImpl();
                CommunityDao communityDao = new CommunityDaoImpl();
                List<Community> communities = communityDao.getAll();
                List<Category> categories = categoryDao.toGainByArticle(article.getId());
                for (Category category : categories) {%>
            <div class="label label-default"><%= category.getName()%></div>
            <%}%>
        </div>
        <div class="news-content">
            <%= article.getContent()%>
        </div>
    </div>
    <div class="col-3">
        <div class="side-bar-card">
            <div class="card-title">相关推荐</div>
            <div class="card-body">
                <div class="list">
                    <% for (Community community :communities){%>
                    <a href="first.jsp?community=<%= community.getId()%>">
                        <button class="btn" style="background-color: #ff9b27; color: #084f6b; margin-top: 5px; margin-left: 10px; border-radius: 50px" type="button"><%= community.getName()%></button>
                    </a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/tall.jsp" flush="true"></jsp:include>
</body>
</html>
