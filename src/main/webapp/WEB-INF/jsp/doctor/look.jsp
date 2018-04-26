<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/26
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看---2018</title>
    <base href="${basePath}">
    <jsp:include page="docstyle.jsp"/>
    <jsp:include page="docscript.jsp"/>

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
                window.location.href="doctor/index.do";
            });
        });
    </script>
</head>
<body>
<form action="index.html" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">姓名</td>
            <td>${doc.doctor_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件类型</td>
            <td>
                <c:choose>
                    <c:when test="${doc.doctor_papers_type==0}">
                        护照
                    </c:when>
                    <c:when test="${doc.doctor_papers_type==1}">
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
            <td>${doc.doctor_papers_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">手机</td>
            <td>${doc.mobile}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">座机</td>
            <td>${doc.special_plane}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">性别</td>
            <td>
                <c:choose>
                    <c:when test="${doc.sex==0}">
                        女
                    </c:when>
                    <c:otherwise>
                        男
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">出生年月</td>
            <td>
                <f:formatDate value="${doc.birthday}" pattern="yyyy-MM-dd"></f:formatDate>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">入院时间</td>
            <td>
                <f:formatDate value="${doc.pass_time}" pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">电子邮箱</td>
            <td>${doc.email}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">所属科室</td>
            <td>${doc.officeModel.office_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">学历</td>
            <td>
                <c:choose>
                    <c:when test="${doc.education==0}">
                        专科
                    </c:when>
                    <c:when test="${doc.education==1}">
                        本科
                    </c:when>
                    <c:when test="${doc.education==2}">
                        硕士
                    </c:when>
                    <c:otherwise>
                        博士
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td>${doc.remark}</td>
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
