<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/28
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>药品详情</title>
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
                window.location.href="drug/drugIndex.do";
            });
        });
    </script>
</head>
<body>
<form action="" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">药品编号</td>
            <td>${drug.drug_num}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">图片</td>
            <td><img src="1.png"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">进价</td>
            <td>${drug.purchase_price}元</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">售价</td>
            <td>${drug.sell_price}元</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">药品名称</td>
            <td>${drug.drug_name}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">药品类型</td>
            <td>
                <c:choose>
                    <c:when test="${drug.drug_type==0}">中药</c:when>
                    <c:when test="${drug.drug_type==1}">西药</c:when>
                    <c:when test="${drug.drug_type==2}">处方</c:when>
                    <c:otherwise>非处方</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">简单描述</td>
            <td>${drug.drug_desc}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">生产日期</td>
            <td>
                <f:formatDate value="${drug.produced_time}" pattern="yyyy年MM月dd日"/>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">保质期</td>
            <td>${drug.shelf_time}月</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">详细描述</td>
            <td>${drug.detail_desc}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">生产厂商</td>
            <td>${drug.vendor}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">服用说明</td>
            <td>${drug.taking_instructions}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">库存</td>
            <td>${drug.gross_purchases}袋</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">剩余量</td>
            <td>${drug.surplus}袋</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td>${drug.remark}</td>
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
