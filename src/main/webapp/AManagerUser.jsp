<%@ page import="com.niuma.impl.AdminDaoImpl" %>
<%@ page import="com.niuma.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.niuma.tool.TimeFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: 41150
  Date: 2022-12-07
  Time: 15:26
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
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
  AdminDaoImpl adminDao=new AdminDaoImpl();
  List<User> allUser = adminDao.getAllUser();
%>
<form action="" method="post">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 用户管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button class="button border-green" id="checkall" type="button"><span class="icon-check"></span> 全选
          </button>
          <button class="button border-red" type="submit"><span class="icon-trash-o"></span> 批量禁用</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>禁用与否</th>
        <th width="120">ID</th>
        <th>昵称</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>账号</th>

        <th width="120">注册时间</th>
        <th>操作</th>
      </tr>
      <%for(int i=0;i<allUser.size();i++){%>
      <tr class="lie">
        <td>
          <input name="id[]" type="checkbox" value="1"/>
        </td>
        <td>
          <%=allUser.get(i).getId()%>
        </td>
        <td><%=allUser.get(i).getNickName()%></td>
        <td><%=allUser.get(i).getMobile()%></td>
        <td><%=allUser.get(i).getEmail()%></td>
        <td><%=allUser.get(i).getAccount()%></td>
        <%
          String dateStr = String.valueOf(allUser.get(i).getRegDate());
          DateFormat cstFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          DateFormat gmtFormate = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
          Date dateTime = gmtFormate.parse(dateStr);
          String dateString = cstFormate.format(dateTime);
        %>
        <td><%=dateString%></td>
        <td>
          <div class="button-group"><a class="button border-red"
                                       onclick="del(<%=allUser.get(i).getId()%>)"><span class="icon-trash-o"></span> 禁用</a></div>
        </td>
      </tr>
      <%}%>
<%--      <tr>--%>
<%--        <td colspan="8">--%>
<%--          <div class="pagelist"><a href="">上一页</a> <span class="current">1</span><a href="">2</a><a--%>
<%--                  href="">3</a><a href="">下一页</a><a href="">尾页</a></div>--%>
<%--        </td>--%>
<%--      </tr>--%>
    </table>
  </div>
</form>
<script type="text/javascript">
  window.onload = function (){
    let  user= document.getElementsByClassName('lie');
    console.log(user)
    for(var i = 0;i<user.length;i++){
      user[i].addEventListener('dblclick',function (e) {
        window.open('book.html');
      })
    }
  }



  function del(id) {
    // const axios = require('axios').default;
    alert(id)
    if (confirm("您确定要禁用吗?")) {
      // axios({
      //   method:"get",
      //   url:"http://localhost:8080/SteamBox_war_exploded/Admin/BanUser",
      //   data:{
      //     userid:id,
      //     operate:"1",
      //   }
      // }).then(function (resp) {
      //   alert('666')
      // })
      axios({url:'http://localhost:8080/SteamBox_war_exploded/Admin/BanUser',method:"POST",data:qs.stringify(
                { userid:id,
                  operate:1,
		 	    }
			 )
          })
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
      var t = confirm("您确认要禁用选中的内容吗？");
      if (t == false) return false;
    } else {
      alert("请选择您要删除的内容!");
      return false;
    }
  }

</script>
</body>
</html>
