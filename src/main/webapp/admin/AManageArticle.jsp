<%@ page import="com.niuma.impl.ArticleDaoImpl" %>
<%@ page import="com.niuma.model.Article" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.niuma.impl.UserDaoImpl" %>
<%@ page import="com.niuma.model.User" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-10
  Time: 18:34
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
    <style>
        @font-face {

            font-family: 'Alimama_ShuHeiTi_Bold';

            src: url('../fonts/Alimama_ShuHeiTi_Bold.woff') format('woff'),
            url('../fonts/Alimama_ShuHeiTi_Bold.ttf') format('truetype')
        }

        p, header, a {
            text-decoration: none;
            font-family: Alimama_ShuHeiTi_Bold, serif;
        }
    </style>
</head>
<body>
<%
    List<Article> articles;
    articles = (List<Article>) session.getAttribute("articles");
    Object limit = session.getAttribute("limit");
    List<Article> sArticles = (List<Article>) session.getAttribute("sArticles");
    ArticleDaoImpl articleDao = new ArticleDaoImpl();
    Map<String, Object> map = new HashMap<>();
    if (sArticles != null) {
        articles = sArticles;
    }
    if (articles == null && limit == null) {
        map.put("limit", 0);
        map.put("auditor", 0);
        articles = articleDao.selectAll(map);
    }
    if (limit != null) {
        int a = (int) limit;
        map.put("limit", a);
        map.put("auditor", 0);
    }
%>
<form action="" id="listform" method="post">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> ?????????????????????</strong> <a href=""
                                                                                  style="float:right; display:none;">????????????</a>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li>?????????</li>
                <li>
                    <input id="searchConten" class="input" name="keywords" placeholder="????????????????????????"
                           style="width:250px; line-height:17px;display:inline-block"
                           type="text"/>
                    <a class="button border-main icon-search" href="javascript:void(0)" onclick="changesearch()">
                        ??????</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>????????????</th>
                <th style="text-align:left; padding-left:20px;" width="100">ID</th>
                <th width="20%">??????</th>
                <th>??????</th>
                <th width="10%">????????????</th>
                <th>?????????</th>
                <th>?????????</th>
                <th width="10%">??????</th>
            </tr>
            <volist id="vo" name="list">
                <%for (Article article : articles) {%>
                <tr>
                    <td style="color:<%=!article.isHidden() ? "red":"#00aa00"%>"><%=article.isHidden()%>
                    </td>
                    <th style="text-align:left; padding-left:20px;padding-bottom: 20px;"><%=article.getId()%>
                    </th>
                    <td><%=article.getTitle()%>
                    </td>
                    <td width="10%"><img alt="" height="50" src="../img/cover/<%=article.getImg()%>" width="70"/></td>
                    <%
                        String dateStr = String.valueOf(article.getPubDate());
                        DateFormat cstFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        DateFormat gmtFormate = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                        Date dateTime = gmtFormate.parse(dateStr);
                        String dateString = cstFormate.format(dateTime);
                    %>
                    <td><%=dateString%>
                    </td>
                    <%
                        UserDaoImpl userDao = new UserDaoImpl();
                        User user = userDao.getUserByID(article.getCreator(), null, null);
                    %>
                    <td><font color="#00bfff"><%=user.getNickName()%>
                    </font></td>
                    <td><%=article.getAuditor()%>
                    </td>
                    <td>
                        <div class="button-group">
                            <%if (!article.isHidden()) {%>
                            <a class="button border-main" onclick="setLook(<%=article.getId()%>)"><span
                                    class="icon-edit"></span> ??????</a>
                            <%} else {%>
                            <a class="button border-red" onclick="setUnLook(<%=article.getId()%>)"><span
                                    class="icon-trash-o"></span> ??????</a>
                            <%}%>
                        </div>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <td colspan="7" style="text-align:left;padding-left:20px;"><a
                            class="button border-blue icon-edit"
                            href="${pageContext.request.contextPath}/admin/AManageExamine.jsp"
                            onclick="sorts()" style="padding:5px 15px; margin:0 10px;"> ???????????????</a></td>
                </tr>
                <%if (sArticles == null) {%>
                <tr>
                    <td colspan="8">
                        <div class="pagelist"><a id="upPage"
                                                 href="${pageContext.request.contextPath}/Article/TurnPage?page=<%=map.get("limit")%>&status=up">?????????</a>
                            <a id="downPage" href="${pageContext.request.contextPath}/Article/TurnPage?page=<%=map.get("limit")%>&status=down">?????????</a>
                        </div>
                    </td>
                </tr>
                <%}%>
            </volist>
        </table>
    </div>
</form>
<script type="text/javascript">
    var upPage = document.getElementById("upPage");
    var downPage = document.getElementById("downPage");
    window.onload = function () {
        <%
            ArticleDaoImpl articleDao1=new ArticleDaoImpl();
            int articleCounts = articleDao1.getArticleCounts();
            int yu=articleCounts % 5;
            int pg=articleCounts / 5;
        %>
        if (0 ===<%=map.get("limit")%>) {
            upPage.style.display = 'none';
        }
        if (<%=yu==0%> &&
        <%=(pg-1)*5%>==<%=map.get("limit")%>)
        {
            downPage.style.display = 'none';
        }
        if (<%=yu!=0%> &&
        <%=pg*5%>==<%=map.get("limit")%>)
        {
            <%session.setAttribute("yu",yu);%>
            downPage.style.display = 'none';
        }
    }

    //??????
    function changesearch() {
        var content = document.getElementById("searchConten").value;
        if (content == null) {
            <%sArticles=null;articles=null;limit=0;%>
        }
        window.location.replace("${pageContext.request.contextPath}/Article/SearchArticles?content=" + content);
    }

    function setLook(ArticleId) {
        if (confirm("??????????????????????")) {
            window.location.replace("${pageContext.request.contextPath}/Article/setArticleLook?articleId=" + ArticleId + "&hidden=1");
        }
    }

    function setUnLook(ArticleId) {
        if (confirm("??????????????????????")) {
            window.location.replace("${pageContext.request.contextPath}/Article/setArticleLook?articleId=" + ArticleId + "&hidden=0");
        }
    }

    //??????
    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            this.checked = !this.checked;
        });
    })

    //????????????
    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("???????????????????????????????????????");
            if (t == false) return false;
            $("#listform").submit();
        } else {
            alert("??????????????????????????????!");
            return false;
        }
    }

    //????????????
    <%--function sorts() {--%>
    <%--    window.location.replace("${pageContext.request.contextPath}/AManageExamine.jsp" );--%>
    <%--}--%>


    //??????????????????
    function changeishome(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("???????????????????????????!");

            return false;
        }
    }

    //????????????
    function changeisvouch(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {


            $("#listform").submit();
        } else {
            alert("???????????????????????????!");

            return false;
        }
    }

    //????????????
    function changeistop(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("???????????????????????????!");

            return false;
        }
    }


    //????????????
    function changecate(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        } else {
            alert("???????????????????????????!");

            return false;
        }
    }

    //????????????
    function changecopy(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var i = 0;
            $("input[name='id[]']").each(function () {
                if (this.checked == true) {
                    i++;
                }
            });
            if (i > 1) {
                alert("????????????????????????!");
                $(o).find("option:first").prop("selected", "selected");
            } else {

                $("#listform").submit();
            }
        } else {
            alert("???????????????????????????!");
            $(o).find("option:first").prop("selected", "selected");
            return false;
        }
    }

</script>
</body>
</html>
