<%@ page import="com.niuma.dao.ArticleDao" %>
<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.tool.TimeFormat" %>
<%@ page import="com.niuma.dao.CategoryDao" %>
<%@ page import="com.niuma.impl.CategoryDaoImpl" %>
<%@ page import="com.niuma.model.Category" %>
<%@ page import="com.niuma.dao.CommunityDao" %>
<%@ page import="com.niuma.impl.CommunityDaoImpl" %>
<%@ page import="com.niuma.model.Community" %>
<%@ page import="com.niuma.dao.CommentDao" %>
<%@ page import="com.niuma.impl.CommentDaoImpl" %>
<%@ page import="com.niuma.model.Comment" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.niuma.tool.CommentUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/3
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻详情</title>
    <link rel="stylesheet" href="./css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="css/quill.snow.css" rel="stylesheet">
    <link href="css/quill-emoji.css" rel="stylesheet">
    <script src="js/quill.min.js"></script>
    <script src="js/quill-emoji.js"></script>
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

        CommentDao commentDao = new CommentDaoImpl();
        int id = Integer.parseInt(request.getParameter("article"));
        List<Comment> comments = commentDao.getCommentsByArticleId(id);
        Map<Long, Comment> longCommentMap = CommentUtil.toMap(comments);
        request.setAttribute("comments", comments);
        request.setAttribute("commentMap", longCommentMap);
        Article article = articleDao.selectAll(Integer.parseInt(request.getParameter("article"))).get(0);
        request.setAttribute("article", article);
    %>
    <div class="col-7">
        <h1 class="article-title"><%= article.getTitle() %>
        </h1>
        <div class="article-status">25k阅读•<%= TimeFormat.getInterval(article.getPubDate()) %>
            <nav style="--bs-breadcrumb-divider: '';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <%
                        CategoryDao categoryDao = new CategoryDaoImpl();
                        CommunityDao communityDao = new CommunityDaoImpl();
                        List<Community> communities = communityDao.getAll();
                        List<Category> categories = categoryDao.toGainByArticle(article.getId());
                        for (Category category : categories) {%>
                    <div class="breadcrumb-item active" aria-current="page"
                         style="border-radius: 50px; background-color: #d69200; color: #ffffff"><%= category.getName()%>
                    </div>
                    <%}%>
                </ol>
            </nav>

        </div>
        <div class="article-content">
            <%= article.getContent()%>
        </div>
        <div>
            <h3>我要评论</h3>
            <form class="form-horizontal" action="/Comment/putComment?articleId=${article.id}" method="post"
                  onsubmit="return setContent()">
                <div id="editor"></div>
                <input type="hidden" name="content" id="content">
                <button type="submit" class="btn btn-default" <c:if test="${empty sessionScope.user}">disabled</c:if>>
                    发布
                </button>
                <c:if test="${empty sessionScope.user}">您还未登陆，请先<a href="login.jsp">登陆</a></c:if>
            </form>
        </div>
        <c:forEach items="${comments}" var="reply">
            <jsp:include page="common/comment.jsp">
                <jsp:param name="commentId" value="${reply.id}"/>
            </jsp:include>
        </c:forEach>
    </div>
    <div class="col-3">
        <div class="side-bar-card">
            <div class="card-title">相关推荐</div>
            <div class="card-body">
                <div class="list">
                    <% for (Community community : communities) {%>
                    <a href="first.jsp?community=<%= community.getId()%>">
                        <button class="btn"
                                style="background-color: #ff9b27; color: #000000; margin-top: 5px; margin-left: 10px; border-radius: 50px"
                                type="button"><%= community.getName()%>
                        </button>
                    </a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
<script>
    var toolbarOptions = {
        container: [
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block'],
            ['emoji']
        ],
        handlers: {
            'emoji': function () {
            }
        }
    };

    var quill = new Quill('#editor', {
        modules: {
            "toolbar": toolbarOptions,
            "emoji-toolbar": true,
            "emoji-shortname": true,
            "emoji-textarea": true
        },
        theme: 'snow'
    });

    function setContent() {
        if (quill && quill.getLength() > 1) {
            $("#content").val(quill.root.innerHTML);
            return true;
        } else {
            alert("内容不能为空！")
            return false;
        }
    }

    var replyQuill; //定义全局变量

    function setReplyContent() {
        if (replyQuill && replyQuill.getLength() > 1) {
            $("#reply-content").val(replyQuill.root.innerHTML);
            return true;
        } else {
            alert("内容不能为空！")
            return false;
        }
    }

    function reply(commentId) {
        $(".editor-form").remove(); //清除编辑表单
        $(".btn-reply").removeAttr("disabled"); // 恢复按钮功能

        $("#btn-" + commentId).attr("disabled", "disabled");  //停止重复点击
        $("#comment-" + commentId).append("<form action='${pageContext.request.contextPath}/Comment/putComment?newsId=${param.id}&replyForId=" + commentId
            + "' class='editor-form' method='post' onsubmit='return setReplyContent()'><div id='ql-editor'></div><input type='hidden' name='content' id='reply-content'><button class='btn btn-default'"
            <c:if test="${empty sessionScope.user}"> + ' disabled'</c:if> + ">回复</button>"
            <c:if test="${empty sessionScope.user}"> + '您还未登陆，请先<a href="login.jsp">登陆</a>'</c:if> + "</form>");
        replyQuill = new Quill('#ql-editor', {
            modules: {
                "toolbar": toolbarOptions,
                "emoji-toolbar": true,
                "emoji-shortname": true,
                "emoji-textarea": true
            },
            theme: 'snow'
        });
    }

    function like(commentId) {
        let like = $.cookie('comment-like-' + commentId);  // 从Cookie中获取点赞记录
        let operate = like ? 'unlike' : 'like';

        $.post('${pageContext.request.contextPath}/Comment/Like?id=' + commentId + '&operate=' + operate, function (num) {
            // 更新点赞数和图标状态
            console.log(num)
            console.log(typeof num)
            $('#like-num-' + commentId).text(num > 0 ? num : '赞');
            if (like) {
                $('#like-icon-' + commentId).removeClass('alert-danger');
                $.removeCookie('comment-like-' + commentId, {path: "/"});  // 删除Cookie
            } else {
                $('#like-icon-' + commentId).addClass('alert-danger');
                $.cookie('comment-like-' + commentId, true, {path: "/"}); // 写入Cookie
            }
        });
    }

    function dislike(commentId) {
        let dislike = $.cookie('comment-dislike-' + commentId);  // 从Cookie中获取点踩记录
        let operate = dislike ? 'undislike' : 'dislike';

        $.post('${pageContext.request.contextPath}/Comment/Like?id=' + commentId + '&operate=' + operate, function (num) {
            // 更新点赞数和图标状态
            $('#dislike-num-' + commentId).text(num > 0 ? num : '踩');
            if (dislike) {
                $('#dislike-icon-' + commentId).removeClass('alert-danger');
                $.removeCookie('comment-dislike-' + commentId, {path: "/"});  // 删除Cookie
            } else {
                $('#dislike-icon-' + commentId).addClass('alert-danger');
                $.cookie('comment-dislike-' + commentId, true, {path: "/"}); // 写入Cookie
            }
        });
    }
</script>
</body>
</html>
