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
<link rel="stylesheet" href="./kindeditor/themes/default/default.css"/>
<link rel="stylesheet" href="./kindeditor/plugins/code/prettify.css"/>
<script charset="utf-8" src="./kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="./kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="./kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="./kindeditor/plugins/code/prettify.js"></script>
<script type="application/javascript">
    //配置KindEditor 初始化参数
    KindEditor.create('#editor_id', {
        filePostName: "imgFile",//设置上传图片的名称
        uploadJson: "${path}/essay/contentUpload",  //指定上传图片的路径
        allowFileManager: true, //是否展示浏览图片空间
    });
</script>
<script>
    KindEditor.ready(function (K) {
        window.editor = K.create('#editor_id');
    });
</script>
</head>
<body>
<div id="main">
    <div id="opt_area">
        <h1 id="opt_type"> 添加游戏文章： </h1>
        <form name="AddForm" action="User/Publish" method="post">
            <p>
                <label for="ntid"> 主题 </label>
                <select name="ntid" id="ntid">
                    <c:forEach var="TopicItem" items="${AllTopic}">
                        <option value="${TopicItem.tid}">${TopicItem.tname}</option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label for="ntitle"> 标题 </label>
                <input name="ntitle" id="ntitle" type="text" class="opt_input"/>
            </p>
            <p>
                <label for="nauthor"> 作者 </label>
                <input name="nauthor" id="nauthor" type="text" class="opt_input"/>
            </p>
            <p>
                <label for="nsummary"> 摘要 </label>
                <textarea name="nsummary" id="nsummary" cols="40" rows="3"></textarea>
            </p>
            <p>
                <label for="content"> 内容 </label>
                <textarea name="content" id="content" cols="100" rows="8"
                          style="width:700px;height:400px;visibility:hidden;"></textarea>
                <span id="productIntroduceId"></span> <!--将要显示文本编辑器内容部分-->
                <input id="productIntroduce" th:value="${product.productIntroduce}" hidden="hidden"><!--获取文本编辑器内容部分-->
                <script type="text/javascript">
                    window.onload = function () {//将文本编辑器内容 用js进行替换显示
                        document.getElementById("productIntroduceId").innerHTML = $("#productIntroduce").val();
                    }
                </script>
            </p>
            <p>
                <label> 上传图片 </label>
                <input type="file" name="nfile"/>
            </p>
            <input name="action" type="hidden" value="addnews"/>
            <input type="submit" value="提交" class="opt_sub"/>
            <input type="reset" value="重置" class="opt_sub"/>
        </form>
    </div>
</div>
<div id="footer">
</div><script type="text/javascript">

    let editor1;
    /**页面初始化 创建文本编辑器工具**/
    KindEditor.ready(function (K) {
        //定义生成编辑器的文本类型
        editor1 = K.create('textarea[name="content"]', {
            cssPath: './kindeditor/plugins/code/prettify.css',
            allowImageUpload: true, //上传图片框本地上传的功能，false为隐藏，默认为true
            allowImageRemote: false, //上传图片框网络图片的功能，false为隐藏，默认为true
            formatUploadUrl: false,
            uploadJson: '/kindEditor/upLoad',//文件上传请求后台路径
            allowFileManager: true,
            afterCreate: function () {
                let self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });
        prettyPrint();
    });
</script>
</body>
</html>

