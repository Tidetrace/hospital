<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/14
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑用户信息</title>
    <base href="${basePath}">
    <link rel="shortcut icon" href="Images/logo.png.png">
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
    <input type="hidden" name="id" id="id" value="${use.id}" />
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">登录名</td>
            <td><input type="text" name="username" value="${use.username}" readonly></td>
        </tr>
        <tr>
            <td class="tableleft">真实姓名</td>
            <td><input type="text" name="real_name" value="${use.real_name}"/></td>
        </tr>
        <tr>
            <td class="tableleft">邮箱</td>
            <td><input type="text" name="email" value="${use.email}"/></td>
        </tr>
        <c:if test="${user.is_admin==1}">
            <tr>
                <td class="tableleft">状态</td>
                <td>
                    <input type="radio" id="r1" name="state" value="1"/> 启用
                    <input type="radio" id="r2" name="state" value="0" /> 禁用
                </td>
            </tr>
            <tr>
                <td class="tableleft">管理员</td>
                <td>
                    <input type="radio" name="is_admin" value="1" id="is1"/> 是  <input type="radio" name="is_admin" value="0" id="is2"/> 否
                </td>
            </tr>
            <tr>
                <td class="tableleft">角色</td>
                <td>
                    <select name="roleModel.id">
                        <option value="">--请选择--
                            <c:forEach var="role" items="${role}">
                        <option value="${role.id}">${role.role_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
        </c:if>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button id="btSave" class="btn btn-primary" type="button">更新</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        // 点击按钮后修改信息
        $('#btSave').click(function () {
            $.post('/user/editUserss.do',$('#user_form').serialize(),function (result) {
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
    // 判断状态(启动或者禁用)
    $(function () {
        if (${use.state==1}) {
            $("#r1").attr("checked","checked");
        }else {
            $("#r2").attr("checked","checked");
        }
        if (${use.is_admin==1}) {
            $("#is1").attr("checked","checked");
        }else {
            $("#is2").attr("checked","checked");
        }
    });
</script>