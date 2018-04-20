<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/16
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加权信息</title>
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
    <script>
        $(function () {
            $('#backid').click(function(){
                window.location.href="/resource/authoIndex.do";
            });
        });
    </script>
</head>
<body>
<form action="" id="autho_form" method="post" class="definewidth m20">
    <input type="hidden" name="id" value="${autho.id}" />
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">资源名称</td>
            <td><input type="text" name="authority_name" value="${autho.authority_name}"/></td>
        </tr>
        <tr>
            <td class="tableleft">url</td>
            <td><input type="text" name="authority_url" value="${autho.authority_url}"/></td>
        </tr>
        <tr>
            <td class="tableleft">是否有效</td>
            <td>
                <input type="radio" id="a1" name="state" value="1"/> 有效
                <input type="radio" id="a2" name="state" value="0" /> 无效
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button id="btSave" class="btn btn-primary" type="button"><c:choose><c:when test="${not empty autho.id}">更新资源</c:when><c:otherwise>添加资源</c:otherwise></c:choose> </button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        if (${autho.state==1}) {
            $("#a1").attr("checked","checked");
        }else {
            $("#a2").attr("checked","checked");
        }
    });

    $('#btSave').click(function () {
        $.post('resource/updateResourceByParam.do',$('#autho_form').serialize(),function (result) {
            if(result.message){
                window.location.href="resource/authoIndex.do";
            }else {
                alert(result.error);
            }
        },'json')

    });

</script>
</body>
</html>