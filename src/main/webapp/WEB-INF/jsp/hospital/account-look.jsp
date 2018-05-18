<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/5/8
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>最终结算详情</title>
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
    <script type="text/javascript">
        $(function () {
            $('#backid').click(function(){
                window.location.href="bill/accountIndex.do";
            });
        });
    </script>
</head>
<body>

<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>病历号</th>
        <th>姓名</th>
        <th>药品收费</th>
        <th>住院收费</th>
        <th>收费金额</th>
    </tr>
    </thead>
    <c:choose>
        <c:when test="${not empty bill}">
            <tr >
                <td style="vertical-align:middle;">${bill.registinfoModel.regist_num}</td>
                <td style="vertical-align:middle;">${bill.registinfoModel.regist_name}</td>
                <td style="vertical-align:middle;">${bill.inho_drug_pay}元</td>
                <td style="vertical-align:middle;">${bill.inho_medical_pay}元</td>
                <td style="vertical-align:middle;">${bill.inho_cash}元</td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <td style="text-align:center;vertical-align:middle;font-size: 20px;" colspan="7">查询不到对应的数据,可能数据库没有这条记录...</td>
            </tr>
        </c:otherwise>
    </c:choose>

</table>

<table class="table table-bordered table-hover definewidth m10" >
    <tr>
        <th>
            <div>
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </div>
        </th>
    </tr>
</table>


<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">总花费：</td>
        <td><fmt:formatNumber type="number" value=" ${bill.inho_medical_pay+bill.inho_drug_pay}" pattern="#.00"/>元
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">押金：</td>
        <td><fmt:formatNumber type="number" value=" ${bill.inho_cash}" pattern="#.00"/>元</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">余额：</td>
        <td>
            <fmt:formatNumber type="number" value=" ${bill.inho_cash-bill.inho_medical_pay-bill.inho_drug_pay}" pattern="#.00"/>元
        </td>
    </tr>
</table>


</body>
</html>