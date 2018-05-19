<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/21
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${basePath}">
    <link rel="shortcut icon" href="Images/logo.png.png">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
   <%-- <script type="text/javascript" src="Js/bootstrap.js"></script>--%>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
    <script type="text/javascript" src="Js/jquery.js"></script>
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>
</head>
<body>
<div class="container">

    <form class="form-signin" id="loginForm" onsubmit="return false;" method="post" action="">
        <h2 class="form-signin-heading">&nbsp;&nbsp;&nbsp;登录系统</h2>
        <input type="text" id="username" name="username" class="input-block-level" placeholder="账号" class="required" >
        <input type="password" name="password" class="input-block-level" placeholder="密码" class="required" >
        <input type="text" name="verify" class="input-medium" placeholder="验证码" class="required" >
        <td nowrap width="437"></td>
        <td>
            <img id="img" src="${ctx}/authImage" style="margin-top: -13px"/>
            <a href='#' onclick="javascript:changeImg()" style="color:white;float: right"><label style="color:blue;">看不清？</label></a>
        </td>
        <p>

        </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-large btn-primary" type="submit" onclick="loginIn()" id="bt_lon">登录</button></p>
    </form>
</div>
<!-- 触发JS刷新-->
<script type="text/javascript" src="Js/jquery.js"></script>
<script>
   //聚焦
   $(function () {
       $("input[name='username']").focus();
   })
    function loginIn() {
        if(false){
            return false;
        }else {
            $('#loginForm').submit(function () {
                $.post('user/loginIn.do',$('#loginForm').serialize(),function (result) {
                    if(result.message){
                        window.location.href="index.do";
                    }else {
                        alert(result.error);
                        window.location.href="user/login.do";
                    }
                },'json');
            });
        }
    }
</script>
<script type="text/javascript">
    function changeImg(){
        var img = document.getElementById("img");
        img.src = "${ctx}/authImage?date=" + new Date();
    }
</script>
</body>
</html>
