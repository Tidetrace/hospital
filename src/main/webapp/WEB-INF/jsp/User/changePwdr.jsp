<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/16
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>

    <base href="${basePath}">
    <jsp:include page="/WEB-INF/jsp/lead/docscript.jsp"/>
    <jsp:include page="/WEB-INF/jsp/lead/docstyle.jsp"/>


    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form action="" id="user_form" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft"><img src="Images/MiMa.png" width="15px" height="15px">&nbsp;旧密码</td>
            <td><input type="text" id="oldpassword" name="oldpassword" placeholder="请输入旧密码" value=""></td>
        </tr>
        <tr>
            <td class="tableleft"><img src="Images/yaoshi.png" width="15px" height="15px">&nbsp;新密码:</td>
            <td><input type="password" id="newpassword1" name="newpassword1" placeholder="请输入新密码" value=""/></td>
        </tr>
        <tr>
            <td class="tableleft"><img src="Images/yaoshi.png" width="15px" height="15px">&nbsp;新密码</td>
            <td><input type="password" id="newpassword2"  name="newpassword2" placeholder="请再次输入新密码" value=""/></td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button id="btSave" class="btn btn-primary" type="button">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        // 点击按钮后修改信息
        $('#btSave').click(function () {
           if($('#newpassword1').val()==$('#newpassword2').val()){
               $.post('/user/changePwdByOld.do',{oldpassword:$('#oldpassword').val(),newpassword1:$('#newpassword1').val(),newpassword2:$('#newpassword2').val()},function (result) {
                   if(result.message){
                       $('body').load('outLogin.do')
                       $('body').load('user/login.do')
                       parent.location.reload()
                   }else {
                       alert(result.error);
                   }
               },'json');
           }else {
               alert("两次密码不一致，请重新输入")
           }
        });
    });

</script>
</body>
</html>
<script>
    $(function () {
        $('#backid').click(function(){
            window.location.reload();
        });
    });
</script>