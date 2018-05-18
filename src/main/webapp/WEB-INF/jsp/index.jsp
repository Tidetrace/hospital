<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/21
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>蓝天医院信息管理系统</title>
    <base href="${basePath}">
    <link rel="shortcut icon" href="Images/logo.png.png">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <jsp:include page="lead/stylecss.jsp"/>
</head>
<body>

<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">欢迎您!&nbsp;<span class="dl-log-user" style="font-weight: bolder">${user.username}</span>

        <a href="/outLogin.do" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content" style="background: #5984de">
    <div class="dl-main-nav" style="background: #5970a6">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">医院管理系统</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
</div>
<jsp:include page="lead/scriptjs.jsp"/>
<script>
   var menus;
   $(function () {

       $.get('user/menus.do',function (result) {

           menus = result;

           BUI.use('common/main',function(){
               var config = [
                   {id:'1',menu:[
                           {text:'系统功能',items:menus	}
                       ]}
               ];
               new PageUtil.MainPage({
                   modulesConfig : config
               });
           });

       },'json');

   });
</script>

</body>
</html>
