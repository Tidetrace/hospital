<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/16
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户角色</title>

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
<form action="" id="role_form" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <input type="hidden" name="id" value="${role.id}" />
        <tr>
            <td width="10%" class="tableleft">角色名称</td>
            <td><input type="text" name="role_name"/></td>
        </tr>
        <tr>
            <td class="tableleft">状态</td>
            <td>
                <input type="radio" name="state" value="1" id="r1"/> 启用  <input type="radio" name="state" value="0" id="r2"/> 禁用
            </td>
        </tr>
        <tr>
            <td class="tableleft">权限</td>
            <td>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />挂号信息管理</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />门诊医生管理</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />药品管理</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />住院办理</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />收费项目登记</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />在院发药</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />住院结算</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />月营业额统计</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />年营业额统计</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />用户管理</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />角色管理</label></ul>--%>
                <%--<ul><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />资源管理</label></ul>--%>
                <c:forEach var="autho" items="${autho}">
                    <ul><label class='checkbox inline'><input type='checkbox' name='authority_name' value='${autho.id}' />${autho.authority_name}</label></ul>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="button" class="btn btn-primary" id="btSave"><c:choose><c:when test="${not empty role.id}">更新角色</c:when><c:otherwise>添加角色</c:otherwise></c:choose></button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
<script>
    $(function () {
        $(':checkbox[name="group[]"]').click(function () {
            $(':checkbox', $(this).closest('li')).prop('checked', this.checked);
        });

        $('#backid').click(function(){
            window.location.href="role/roleIndex.do";
        });



    });
    $(function () {
        if (${role.state==1}) {
            $("#r1").attr("checked","checked");
        }else {
            $("#r2").attr("checked","checked");
        }
    });
    $('#btSave').click(function () {
        $.post('role/updateAddRoleByParam.do',$('#role_form').serialize(),function (result) {
            if(result.message){
                window.location.href="role/roleIndex.do";
            }else {
                alert(result.error);
            }
        },'json')

    });

</script>
