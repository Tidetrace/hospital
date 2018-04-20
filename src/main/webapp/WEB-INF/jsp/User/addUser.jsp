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
    <title>添加用户信息</title>

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
            <td width="10%" class="tableleft">登录名</td>
            <td><input type="text" name="username" placeholder="请输入登录名" value=""></td>
        </tr>
        <tr>
            <td class="tableleft">密码</td>
            <td><input type="password" name="password" placeholder="请输入密码" value=""/></td>
        </tr>
        <tr>
            <td class="tableleft">真实姓名</td>
            <td><input type="text" name="real_name" placeholder="请输入真实姓名" value=""/></td>
        </tr>
        <tr>
            <td class="tableleft">邮箱</td>
            <td><input type="text" name="email" placeholder="请输入邮箱" value=""/></td>
        </tr>
        <tr>
            <td class="tableleft">状态</td>
            <td>
                <input type="radio" id="r1" name="state" value="1" checked/> 启用
                <input type="radio" id="r2" name="state" value="0" /> 禁用
            </td>
        </tr>
        <tr>
            <td class="tableleft">角色</td>
            <td>
                <select name="roleModel.id">
                    <option value="">--请选择--
                    <option value="1">管理员
                    <option value="2">院长
                    <option value="3" selected>医生护士
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button id="btSave" class="btn btn-primary" type="button">添加</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        // 点击按钮后修改信息
        $('#btSave').click(function () {
            $.post('/user/addUserss.do',$('#user_form').serialize(),function (result) {
                if(result.message){
                    window.location.href="user/userIndex.do";
                }else {
                    alert(result.error);
                }
            },'json');
        });
    });

</script>
</body>
</html>
<script>
    $(function () {
        $('#backid').click(function(){
            window.location.href="user/userIndex.do";
        });
    });
</script>