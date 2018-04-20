<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/30
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>录入住院信息</title>
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
                window.location.href="inhosp/inhospIndex.do";
            });
        });
    </script>
</head>
<body id="bd">
<form id="inhoForm" method="post" class="definewidth m20" action="/inhosp/inHospSaveByParam.do">
    <table class="table table-bordered table-hover definewidth m10" id="tables">
        <tr>
            <input type="hidden" name="registinfoModel.regist_num" value="${inhosp.regist_num}">
            <td width="10%" class="tableleft">病历号</td>
            <td><input type="text" name="regNum" value="${inhosp.regist_num}" id="regNum" placeholder="输入病历号" onchange="selectByRegNum()"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">姓名</td>
            <td>${inhosp.regist_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件类型</td>
            <td>
                <c:choose>
                    <c:when test="${inhosp.regist_papers_type==0}">
                        护照
                    </c:when>
                    <c:when test="${inhosp.regist_papers_type==1}">
                        身份证
                    </c:when>
                    <c:otherwise>
                        港澳通行证
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件号</td>
            <td>${inhosp.regist_papers_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">社保号</td>
            <td>${inhosp.regist_social_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">联系电话</td>
            <td>${inhosp.phone}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">是否自费</td>
            <td><input type="radio" name="self_paying" value="0" checked/>否&nbsp;&nbsp;&nbsp;<input type="radio" name="self_paying" value="1"/>是</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">性别</td>
            <td><input type="radio" name="sex" value="1" checked/>男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="0"/>女</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">年龄</td>
            <td>${inhosp.age}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">初复诊</td>
            <td><input type="radio" name="early_appointment" value="0" checked/>初诊&nbsp;&nbsp;&nbsp;<input type="radio" name="early_appointment" value="1"/>复诊</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">所挂科室</td>
            <td>${inhosp.officeModel.office_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">指定医生</td>
            <td>${inhosp.doctorModel.doctor_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">护理</td>
            <td><input type="text" name="nurse" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">床位号</td>
            <td><input type="text" name="bed_num" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">缴费押金</td>
            <td><input type="text" name="cash" value=""/>元</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">病情</td>
            <td><textarea name="illness"></textarea></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td><textarea name="remark">${inhosp.remark}</textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button id="btSave" class="btn btn-primary" type="submit">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                </center>
            </td>
        </tr>
    </table>
</form>
<script>
    function selectByRegNum() {
        /* 输入病历编号 查询这个人的信息*/
        var regNum = $('#regNum').val()
        $('#bd').load('/inhosp/inHospSelectByHospRegNum.do',{regNum:regNum});
    }
    /*当点击按钮时 提交表单信息*/
    /*$(function () {
        $('#btSave').click(function () {
            console.log("控制台打印："+$('#inhoForm').serialize())
            alert("哈哈"+$('#inhoForm').serialize())
            $.post('/inhosp/inHospSaveByParam.do',$('#inhoForm').serialize(),function (result) {
                if(result.message){
                    window.location.href="inhosp/inhospIndex.do";
                }else {
                    alert(result.message);
                }
            },'json')
        });
    });*/
</script>
</body>
</html>
