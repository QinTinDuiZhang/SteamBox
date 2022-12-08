<%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-08
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="webkit" name="renderer">
    <title></title>
    <link href="css/pintuer.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<form action="" method="post">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">xxx的管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button class="button border-green" id="checkall" type="button"><span class="icon-check"></span> 全选
                    </button>
                    <button class="button border-red" type="submit"><span class="icon-trash-o"></span> 批量删除</button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120">ID</th>
                <th>评论内容</th>
                <th>评论时间</th>
                <th>IP地址</th>
                <th>所属文章</th>
                <th>回复的用户</th>
                <th>操作</th>
            </tr>
            <tr>
                <td><input name="id[]" type="checkbox" value="1"/>
                    1
                </td>
                <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
                <td>2016-07-01</td>
                <td>神夜</td>
                <td>大表哥</td>
                <td>564379992@qq.com</td>
                <td>
                    <div class="button-group"><a class="button border-red" href="javascript:void(0)"
                                                 onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a></div>
                </td>
            </tr>
            <tr>
                <td><input name="id[]" type="checkbox" value="1"/>
                    1
                </td>
                <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
                <td>2016-07-01</td>
                <td>神夜</td>
                <td>大表哥</td>
                <td>564379992@qq.com</td>
                <td>
                    <div class="button-group"><a class="button border-red" href="javascript:void(0)"
                                                 onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a></div>
                </td>
            </tr>
            <tr>
                <td><input name="id[]" type="checkbox" value="1"/>
                    1
                </td>
                <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
                <td>2016-07-01</td>
                <td>神夜</td>
                <td>大表哥</td>
                <td>564379992@qq.com</td>
                <td>
                    <div class="button-group"><a class="button border-red" href="javascript:void(0)"
                                                 onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a></div>
                </td>
            </tr>
            <tr>
                <td><input name="id[]" type="checkbox" value="1"/>
                    1
                </td>
                <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
                <td>2016-07-01</td>
                <td>神夜</td>
                <td>大表哥</td>
                <td>564379992@qq.com</td>
                <td>
                    <div class="button-group"><a class="button border-red" href="javascript:void(0)"
                                                 onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a></div>
                </td>
            </tr>
            <tr>
                <td><input name="id[]" type="checkbox" value="1"/>
                    1
                </td>
                <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
                <td>2016-07-01</td>
                <td>神夜</td>
                <td>大表哥</td>
                <td>564379992@qq.com</td>
                <td>
                    <div class="button-group"><a class="button border-red" href="javascript:void(0)"
                                                 onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a></div>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <div class="pagelist"><a href="">上一页</a> <span class="current">1</span><a href="">2</a><a
                            href="">3</a><a href="">下一页</a><a href="">尾页</a></div>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    function del(id) {
        if (confirm("您确定要删除吗?")) {

        }
    }

    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            this.checked = !this.checked;
        });
    })

    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
        } else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body>
</html>
