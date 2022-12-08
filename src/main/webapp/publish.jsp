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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="css/quill.snow.css" rel="stylesheet">
    <link href="css/quill-emoji.css" rel="stylesheet">
    <script src="js/quill.min.js"></script>
    <script src="js/quill-emoji.js"></script>
</head>
<body>
<div id="main" class="container text-center">
    <div class="row justify-content-center">
        <h1 id="opt_type">添加游戏文章：</h1>
        <form name="AddForm" action="User/Publish" method="post">
            <div>
                <h3><label>分类</label></h3>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                    <label class="form-check-label" for="flexCheckChecked">
                        Checked checkbox
                    </label>
                </div>
            </div>
            <div>
                <h3>社区</h3>
                <select class="form-select" aria-label="Default select example">
                    <option selected>Open this select menu</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
            <div>
                <h3><label for="ntitle">标题</label></h3>
                <input name="ntitle" id="ntitle" type="text" class="opt_input"/>
            </div>
            <div>
                <h3><label for="content">正文</label></h3>
                <div id="editor"></div>
                <input id="content" type="hidden" name="content"/>
            </div>
            <div>
                <h3><label>选择封面</label></h3>
                <input type="file" name="nfile"/>
            </div>
            <input name="action" type="hidden" value="addnews">
            <input type="submit" value="提交" class="opt_sub">
            <input type="reset" value="重置" class="opt_sub">

        </form>
    </div>
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

    function test() {
        quill && quill.getLength() > 1 ? $("#content").val(quill.root.innerHTML) : alert("内容不能为空！")
    }
</script>
</body>
</html>

