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
<%@ page import="java.util.Collections" %>
<%@ page import="com.niuma.tool.TimeFormat" %><%--
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
    if (request.getParameter("userId") != null)
        userId = Integer.parseInt(request.getParameter("userId"));
    if (userId == 0) {
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
    CategoryDao categoryDao = new CategoryDaoImpl();
    List<Category> categories = categoryDao.getCategoryUserId(userId);
%>
<div class="container ">
    <div class="row container" style="">
        <div class="col-10 container" style="color: #ececec;; margin-top: 5%">
            <h2>Ta的投稿</h2>
            <div>
                <a href="${pageContext.request.contextPath}/manuscript.jsp"><span>按时间</span></a>
                <a href="${pageContext.request.contextPath}/manuscript.jsp?sort=1"><span>按评论量</span></a>
            </div>
            <hr>
            <div>
                <span>全部</span>
                <%for (Category category : categories) {%>
                <span><a href="${pageContext.request.contextPath}/manuscript.jsp?"><%= category.getName()%></a></span>
                <%}%>
            </div>
        </div>
        <hr>
        <div class="col-10 container">
            <div class="row">
                <% for (Article article : articles) {%>
                <div class="col-3"
                     style="height: 15em; display: flex; justify-content: space-between; flex-direction: column;">
                    <a href="particulars.jsp?article=<%= article.getId()%>" style="color: #ececec;">
                        <div>
                            <img src="img/cover/<%= article.getImg()%>" alt="" style="width: 100%; height: 130px;">
                            <p style="overflow: hidden"><%= article.getTitle()%>
                            </p>
                        </div>
                    </a>
                    <div style="display: flex; justify-content: space-between;">
                        <span style="color: #7c7c7c"><%= TimeFormat.getInterval(article.getPubDate()) %></span>
                        <div class="btn-group dropup">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                            </button>
                            <ul class="dropdown-menu">
                                <li onclick="prompt(<%= article.getId()%>)" class="dropdown-item">删除</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
    <div class="toast-container position-fixed top-50 start-50 translate-middle p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <svg class="icon" height="20" p-id="1235" t="1671544590407" version="1.1"
                     viewBox="0 0 1024 1024" width="20" xmlns="http://www.w3.org/2000/svg">
                    <path d="M512 1024a512 512 0 1 1 512-512 512 512 0 0 1-512 512z m259.072-680.192a42.752 42.752 0 0 0-60.672-60.16l-183.296 183.296-183.04-183.296a43.008 43.008 0 0 0-30.208-12.544 41.984 41.984 0 0 0-30.208 12.544 42.496 42.496 0 0 0 0 60.16l183.552 183.808-183.296 183.552a42.752 42.752 0 0 0 60.416 60.16L527.104 588.8l183.296 183.296a42.752 42.752 0 0 0 60.672-60.16L588.8 527.616l183.296-183.808z"
                          fill="#FF4040"
                          p-id="1236">
                    </path>
                </svg>
                <strong class="me-auto">警告</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                您是否要删除此篇文章？
                <div class="mt-2 pt-2 border-top">
                    <button type="button" class="btn btn-dark btn-sm" onclick="over()">确定</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
    let t = 0;

    function prompt(f) {
        const toastLiveExample = document.getElementById('liveToast')
        const toast = new bootstrap.Toast(toastLiveExample)
        t = f;
        toast.show();
    }

    function over() {
        axios.get('${pageContext.request.contextPath}/User/Del?a=' + t);
        location.reload([true])
    }
</script>
</body>
</html>
