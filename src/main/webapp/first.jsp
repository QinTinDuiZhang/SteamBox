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
<%@ page import="com.niuma.impl.CommunityDaoImpl" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
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
    session.setAttribute("categories", allCategory);
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
                <%
                    }
                    if (session.getAttribute("user") != null) {
                %>
                <a href="publish.jsp">
                    <button style="background-color: #13d5d6; border-radius: 50px;width: 80px;height: 80px;">
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
                <%}%>
            </div>
        </div>
        <div class="col-7">
            <%
                String community = request.getParameter("community");
                request.setAttribute("community", community);
                String category = request.getParameter("category");
                UserDao userDao = new UserDaoImpl();
                ArticleDao articleDao = new ArticleDaoImpl();
                Map<String,Object> map=new HashMap<>();
                if (community!= null)
                    map.put("id",Integer.parseInt(community));
                map.put("hidden",1);
                Map<String,Object> map2=new HashMap<>();
                map2.put("hidden",1);
                List<Article> articles = community != null ? articleDao.selectAll(map) : articleDao.selectAll(map2);
                if (category != null) articles = categoryDao.getCategoryArticle(Integer.parseInt(category));
                for (Article article : articles) {%>
            <div>
                <a href="particulars.jsp?article=<%= article.getId()%>">
                    <div class="news-list-item clearfix">
                        <div class="col-xs-7">
                            <p class="title h3 text-white"><%= article.getTitle()%>
                            </p>
                        </div>
                        <div class="col-xs-5 img-fluid">
                            <img src="img/cover/<%= article.getImg()%>" alt="" style="width: 100%">
                        </div>
                        <div class="col-xs-7">
                            <div class="info">
                                <span class="avatar"><img src="img/game.png" alt=""></span>
                                <span><%= userDao.getUserByID(article.getCreator(),null).getNickName() %></span>•
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
                            List<Community> communities = communityDao.getAllCommunity(0);
                            session.setAttribute("communities", communities);
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
                <% if (session.getAttribute("user") != null && request.getParameter("community") != null) {%>
                <button class="col offset-md-3"
                        id="like"
                        style="border-radius: 50px; margin-top: 50px">
                    <%
                        boolean f = false;
                        List<Community> likeCommunities = (List<Community>) session.getAttribute("likeCommunities");
                        for (Community like : likeCommunities)
                            if (like.getId() == Integer.parseInt(request.getParameter("community"))) f = true;
                        request.setAttribute("f", f);
                        if (f) {
                    %>
                    <svg class="icon"
                         height="55"
                         p-id="3141"
                         t="1670663813080"
                         version="1.1"
                         viewBox="0 0 1024 1024"
                         width="50"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M667.786667 117.333333C832.864 117.333333 938.666667 249.706667 938.666667 427.861333c0 138.250667-125.098667 290.506667-371.573334 461.589334a96.768 96.768 0 0 1-110.186666 0C210.432 718.368 85.333333 566.112 85.333333 427.861333 85.333333 249.706667 191.136 117.333333 356.213333 117.333333c59.616 0 100.053333 20.832 155.786667 68.096C567.744 138.176 608.170667 117.333333 667.786667 117.333333z"
                              fill="#d81e06"
                              p-id="3142">
                        </path>
                    </svg>
                    <%} else {%>
                    <svg class="icon"
                         height="55"
                         p-id="2938"
                         t="1670663561782"
                         version="1.1"
                         viewBox="0 0 1024 1024"
                         width="50"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M667.786667 117.333333C832.864 117.333333 938.666667 249.706667 938.666667 427.861333c0 138.250667-125.098667 290.506667-371.573334 461.589334a96.768 96.768 0 0 1-110.186666 0C210.432 718.368 85.333333 566.112 85.333333 427.861333 85.333333 249.706667 191.136 117.333333 356.213333 117.333333c59.616 0 100.053333 20.832 155.786667 68.096C567.744 138.176 608.170667 117.333333 667.786667 117.333333z m0 63.146667c-41.44 0-70.261333 15.189333-116.96 55.04-2.165333 1.845333-14.4 12.373333-17.941334 15.381333a32.32 32.32 0 0 1-41.770666 0c-3.541333-3.018667-15.776-13.536-17.941334-15.381333-46.698667-39.850667-75.52-55.04-116.96-55.04C230.186667 180.48 149.333333 281.258667 149.333333 426.698667 149.333333 537.6 262.858667 675.242667 493.632 834.826667a32.352 32.352 0 0 0 36.736 0C761.141333 675.253333 874.666667 537.6 874.666667 426.698667c0-145.44-80.853333-246.218667-206.88-246.218667z"
                              fill="#d81e06"
                              p-id="2939">
                        </path>
                    </svg>
                    <%}%>
                </button>
                <%}%>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    let likeButton = document.getElementById("like");
    likeButton.addEventListener("click", function (e) {
// 向给定ID的用户发起请求
        axios.get('${pageContext.request.contextPath}/Community/Like?community=${community}&f=${f}')
            .then(function (response) {
                // 处理成功情况
                // alert(response.data)
                location.reload([true])
            })
            .catch(function (error) {
                // 处理错误情况
                console.log(error);
            })
            .then(function () {
                // 总是会执行
            });
    })
</script>
</body>
</html>
