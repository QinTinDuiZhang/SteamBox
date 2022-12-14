<%@ page import="com.niuma.dao.CategoryDao" %>
<%@ page import="com.niuma.impl.CategoryDaoImpl" %>
<%@ page import="com.niuma.model.User" %>
<%@ page import="com.niuma.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="com.niuma.dao.AdminDao" %>
<%@ page import="com.niuma.dao.ArticleDao" %>
<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/7
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>稿件中心</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/main.css">
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
</head>
<body>
<%
    ArticleDao articleDao = new ArticleDaoImpl();
    User user;
    int userId = 0;
    if(request.getParameter("userId")!= null)
        userId = Integer.parseInt(request.getParameter("userId"));
    if (userId == 0){
        user = (User) session.getAttribute("user");
        userId = user.getId();
    }
    List<Article> articles = articleDao.getUserArticle(userId);
    if ("1".equals(request.getParameter("sort"))) {
        class PersonComparator implements Comparator<Article> {
            @Override
            public int compare(Article o1, Article o2) {
                return o1.getPubDate().compareTo(o2.getPubDate());
            }
        }
        articles.sort(new PersonComparator());
    }
    CategoryDao categoryDao =new CategoryDaoImpl();
    List<Category> categories = categoryDao.getCategoryUserId(userId);
%>
<div class="container ">
    <div class="row">
        <div class="col-10 container" style="color: #ececec;; margin-top: 5%">
            <h2>Ta的投稿</h2>
            <div>
                <a href="${pageContext.request.contextPath}/manuscript.jsp"><span>按时间</span></a>
                <a href="${pageContext.request.contextPath}/manuscript.jsp?sort=1"><span>按评论量</span></a>
            </div>
            <div>
                <span>全部</span>
                <%for (Category category :categories){%>
                <span><%= category.getName()%></span>
                <%}%>
            </div>
        </div>
        <div class="col-12">

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
