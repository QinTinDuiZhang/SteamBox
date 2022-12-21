<%@ page import="java.util.List" %>
<%@ page import="com.niuma.model.Comment" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-08
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="webkit" name="renderer">
    <title></title>
    <link href="../css/pintuer.css" rel="stylesheet">
    <link href="../css/admin.css" rel="stylesheet">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
</head>
<body>
<form action="" method="post">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">${name}的管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>搜索：</li>
                <li>
                    <input id="search" class="input" name="keywords" placeholder="请输入搜索的评论内容"
                           style="width:250px; line-height:17px;display:inline-block"
                           type="text"/>
                    <a class="button border-main icon-search" href="javascript:void(0)" onclick="searchComments()">
                        搜索</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120">ID</th>
                <th>评论内容</th>
                <th>评论时间</th>
                <th>IP地址</th>
                <th>所属文章ID</th>
                <th>操作</th>
            </tr>
            <%
                List<Comment> commentList = (List<Comment>) session.getAttribute("UserComments");
            %>
            <%for (Comment comment : commentList) {%>
            <tr>
                <td>
                    <%=comment.getId()%>
                </td>
                <td><%=comment.getContent()%>
                </td>
                <%
                    String dateStr = String.valueOf(comment.getPubDate());
                    DateFormat cstFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    DateFormat gmtFormate = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                    Date dateTime = gmtFormate.parse(dateStr);
                    String dateString = cstFormate.format(dateTime);
                %>
                <td><%=dateString%>
                </td>
                <td><%=comment.getIpAddress()%>
                </td>
                <td><%=comment.getArticle().getId()%>
                </td>
                <td>
                    <div class="button-group"><a class="button border-red" href="javascript:void(0)"
                                                 onclick="return del(<%=comment.getId()%>,<%=comment.getCreator().getId()%>)"><span
                            class="icon-trash-o"></span> 删除</a></div>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</form>
<script type="text/javascript">
    function del(id, cetId) {
        if (confirm("您确定要删除吗?")) {
            window.location.replace("${pageContext.request.contextPath}/Comment/DeleteComment?cid=" + id + "&cetId=" + cetId);
        }
    }

    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            this.checked = !this.checked;
        });
    })
    var selectContent;
    var serarch = document.getElementById("search");
    serarch.addEventListener("change", function (e) {
        selectContent = serarch.value;
    })

    function searchComments() {
        window.location.replace("${pageContext.request.contextPath}/Comment/SearchComment?searchcontent=" + selectContent + "&userId=" +${uId});
    }

</script>
</body>
</html>
