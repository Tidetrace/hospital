<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/29
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看住院人员</title>
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
<body>
<form action="" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">姓名</td>
            <td>${reg.regist_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件类型</td>
            <td>
                <c:choose>
                    <c:when test="${reg.regist_papers_type==0}">
                        护照
                    </c:when>
                    <c:when test="${reg.regist_papers_type==1}">
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
            <td>${reg.regist_papers_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">社保号</td>
            <td>${reg.regist_social_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">联系电话</td>
            <td>${reg.phone}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">是否自费</td>
            <td>
                <c:choose>
                    <c:when test="${reg.self_paying==1}">是</c:when>
                    <c:otherwise>否</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">性别</td>
            <td>
                <c:choose>
                    <c:when test="${reg.sex==0}">女</c:when>
                    <c:otherwise>男</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">年龄</td>
            <td>${reg.age}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">职业</td>
            <td>${reg.job}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">初复诊</td>
            <td>
                <c:choose>
                    <c:when test="${reg.early_appointment==1}">复诊</c:when>
                    <c:otherwise>初诊</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">所挂科室</td>
            <td>${reg.officeModel.office_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">指定医生</td>
            <td>${reg.doctorModel.doctor_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">病情</td>
            <td>${ins.illness}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">护理</td>
            <td>${ins.nurse}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">床位号</td>
            <td>${ins.bed_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">押金</td>
            <td>${ins.cash}元</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td>${ins.remark}</td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                </center>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
