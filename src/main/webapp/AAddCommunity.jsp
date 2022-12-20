<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="webkit" name="renderer">
    <title>网站信息</title>
    <link href="css/pintuer.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
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

<div class="panel admin-panel margin-top">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加社区</strong></div>
    <div class="body-content">
        <form action="Community/AddCommunity" class="form-x" method="post">
            <input name="id" type="hidden" value=""/>
            <div class="form-group">
                <div class="label">
                    <label for="title">社区名字：</label>
                </div>
                <div class="field">
                    <input class="input w50"
                           data-validate="required:请输入社区名字"
                           id="title"
                           name="title"
                           type="text"
                           value=""/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="ETitle">商店链接：</label>
                </div>
                <div class="field">
                    <input class="input w50" data-validate="required:请输入商店链接" id="ETitle" name="entitle"
                           type="text"
                           value=""/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

