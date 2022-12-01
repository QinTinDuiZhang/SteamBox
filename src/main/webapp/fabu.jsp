<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/11/30
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布页面</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <script>
        import {Quill} from "./js/quill.min";

        let quill = new Quill('#editor', {
            theme: 'snow'
        });
    </script>
</head>
<body>
<div id="main">
    <div id="opt_area">
        <h1 id="opt_type"> 添加游戏文章： </h1>
        <form name="AddForm" action="User/Publish" method="post">
            <p>
                <label for="ntid"> 分类 </label>
                <select name="ntid" id="ntid">
                    <c:forEach var="TopicItem" items="${AllTopic}">
                        <option value="${TopicItem.tid}">${TopicItem.tname}</option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label for="ntitle"> 标题 </label>
                <input name="ntitle" id="ntitle" type="text" class="opt_input">
            </p>
            <p>
                <label for="nsummary"> 简介 </label>
                <textarea name="nsummary" id="nsummary" cols="40" rows="3"></textarea>
            </p>
            <p>
                <label for="content"> 正文 </label>
                <div id="editor"></div>
                <input id="content" type="hidden" name="content">
            </p>
            <p>
                <label> 选择封面 </label>
                <input type="file" name="nfile">
            </p>
            <input name="action" type="hidden" value="addnews">
            <input type="submit" value="提交" class="opt_sub">
            <input type="reset" value="重置" class="opt_sub">
        </form>
    </div>
</div>
<div id="footer">
</div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script>
    const toolbarOptions = [
        ['bold', 'italic', 'underline', 'strike'],
        ['blockquote', 'code-block'],

        [{'header': 1}, {'header': 2}],
        [{'list': 'ordered'}, {'list': 'bullet'}],
        [{'script': 'sub'}, {'script': 'super'}],
        [{'indent': '-1'}, {'indent': '+1'}],
        [{'direction': 'rtl'}],

        [{'size': ['small', false, 'large', 'huge']}],
        [{'header': [1, 2, 3, 4, 5, 6, false]}],

        ['link', 'image'],

        [{'color': []}, {'background': []}],
        [{'font': []}],
        [{'align': []}],

        ['clean']
    ];
    let options = {
        debug: 'info',
        modules: {
            toolbar: toolbarOptions
        },
        history: {
            delay: 2000,
            maxStack: 500,
            userOnly: true
        },
        theme: 'snow'
    };
    let quill = new Quill('#editor', options);

    function test(){
        quill && quill.getLength() > 1 ? $("#content").val(quill.root.innerHTML) : alert("内容不能为空！")
    }
</script>
</body>
</html>

