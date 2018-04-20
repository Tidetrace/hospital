<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/3
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线发药</title>
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
    <script type="text/javascript">
        $(function () {
            $('#backid').click(function(){
                window.location.href="pills/pillsIndex.do";
            });
        });
    </script>
</head>
<body id="bodys">
<form action="" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">病历号</td>
            <td id="regNum">${reg.regist_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">姓名</td>
            <td>${reg.regist_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">药品名称</td>
            <td>
                <select name="drugModel.drug_num" id="drugNum">
                    <c:forEach items="${drug}" var="drug">
                        <option value="${drug.drug_num}">${drug.drug_name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">发药数量</td>
            <td><input type="text" id="pillsSend" name="pills_send" value=""/></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button type="button" class="btn btn-primary" id="btSave">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                </center>
            </td>
        </tr>
    </table>
</form>
<script>
    /*$(function () {
        $('#bodys').load('pills/savePillsByParam',{regNum:$('#regNum').text(),drugNum:$('#drugNum option:selected').val()},function (result) {
            if(result.message){
                alert(result.message);
            }else {
                alert(result.message);
            }
        },'json');
    });*/

    $(function () {
        $('#btSave').click(function () {
            $.post('pills/savePillsByParam.do',{regNum:$('#regNum').text(),drugNum:$('#drugNum option:selected').val(),pillsSend:$('#pillsSend').val()},function (result) {
                if(result.message){
                    window.location.href="pills/pillsIndex.do";
                }else {
                    alert(result.error);
                }
            },'json')
        });
    });
</script>
</body>
