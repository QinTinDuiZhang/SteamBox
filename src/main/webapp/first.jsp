<%@ page import="com.niuma.dao.UserDao" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %>
<%@ page import="com.niuma.dao.ArticleDao" %>
<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.tool.TimeFormat" %>
<%@ page import="com.niuma.dao.CategoryDao" %>
<%@ page import="com.niuma.impl.CategoryDaoImpl" %>
<%@ page import="com.niuma.model.Category" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.niuma.model.Community" %>
<%@ page import="com.niuma.dao.CommunityDao" %>
<%@ page import="com.niuma.impl.CommunityDaoImpl" %><%--
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
    <title>蒸汽盒游戏论坛</title>
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
<%
    CategoryDao categoryDao = new CategoryDaoImpl();
    List<Category> allCategory = categoryDao.getAllCategory();
    Iterator<Category> categoryIterator = allCategory.iterator();
%>
<div class="container">
    <div class="row" style="margin-top: 10px">
        <div class="col-2">
            <div class="list-group side-bar hidden-xs sticky-top">
                <% while (categoryIterator.hasNext()) {
                    Category category = categoryIterator.next();%>
                <a href="first.jsp?category=<%= category.getId()%>" class="list-group-item"><%= category.getName()%>
                </a>
                <%}%>
            </div>
        </div>
        <div class="col-7">
            <%
                String community = request.getParameter("community");
                String category = request.getParameter("category");
                UserDao userDao = new UserDaoImpl();
                ArticleDao articleDao = new ArticleDaoImpl();
                List<Article> articles = community != null ? articleDao.selectAll(Integer.parseInt(community)) : articleDao.selectAll(0);
                if (category != null) articles = categoryDao.getCategoryArticle(Integer.parseInt(category));
                for (Article article : articles) {%>
            <div>
                <a href="particulars.jsp?article=<%= article.getId()%>">
                    <div class="news-list-item clearfix">
                        <div class="col-xs-7">
                            <p class="title h3 text-white"><%= article.getTitle()%>
                            </p>
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
        <div class="col-3">
            <div class="side-bar-card">
                <div class="card-title text-white"><p>热门社区:</p></div>
                <div class="card-body">
                    <div class="list">
                        <%
                            CommunityDao communityDao = new CommunityDaoImpl();
                            List<Community> communities = communityDao.getAll();
                            for (Community temp : communities) {%>
                        <a href="first.jsp?community=<%= temp.getId()%>">
                            <button class="btn"
                                    style="background-color: #ff9b27; color: #000000; margin-top: 5px; margin-left: 10px; border-radius: 50px"
                                    type="button"><%= temp.getName()%>
                            </button>
                        </a>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="publish.jsp">
        <button style="background-color: #13d5d6; border-radius: 50px;width: 80px;height: 80px;"
                class="=position-absolute bottom-0 end-0">
            <svg class="icon"
                 height="40"
                 p-id="2533"
                 t="1670398512804"
                 version="1.1"
                 viewBox="0 0 1024 1024"
                 width="40"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="M925.696 384q19.456 0 37.376 7.68t30.72 20.48 20.48 30.72 7.68 37.376q0 20.48-7.68 37.888t-20.48 30.208-30.72 20.48-37.376 7.68l-287.744 0 0 287.744q0 20.48-7.68 37.888t-20.48 30.208-30.72 20.48-37.376 7.68q-20.48 0-37.888-7.68t-30.208-20.48-20.48-30.208-7.68-37.888l0-287.744-287.744 0q-20.48 0-37.888-7.68t-30.208-20.48-20.48-30.208-7.68-37.888q0-19.456 7.68-37.376t20.48-30.72 30.208-20.48 37.888-7.68l287.744 0 0-287.744q0-19.456 7.68-37.376t20.48-30.72 30.208-20.48 37.888-7.68q39.936 0 68.096 28.16t28.16 68.096l0 287.744 287.744 0z"
                      fill="#ffffff"
                      p-id="2534">
                </path>
            </svg>
        </button>
    </a>
</div>
<jsp:include page="common/tall.jsp" flush="true"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
