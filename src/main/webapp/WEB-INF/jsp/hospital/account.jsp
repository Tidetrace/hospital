<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/5/8
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>最终结算</title>
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
            $('#delPro').click(function () {
                if(confirm("确定导出医生信息?")){
                    //点击确定后操作
                    window.location="bill/billExportInfo.do";
                }
            });
        });
    </script>
</head>
<body>

<form action="/bill/accountIndex.do" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">病例号：</td>
            <td><input type="text" name="regNum" value=""/></td>
            <td><center>
                <button type="submit" class="btn btn-primary" type="button"><i class="icon-search icon-white"></i>搜索</button>
                <button type="reset" class="btn btn-success" type="button"><img src="Images/qingkong.png" width="13px" height="13px">&nbsp;清空</button>
            </center>
            </td>
        </tr>
    </table>
</form>

<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>序号</th>
        <th>病历号</th>
        <th>姓名</th>
        <th>押金</th>
        <th>当前余额</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
<c:choose>
    <c:when test="${not empty bill}">
        <c:forEach items="${bill}" var="bill" varStatus="i" step="1">
            <tr >
                <td style="vertical-align:middle;">${(i.count)}</td>
                <td style="vertical-align:middle;">${bill.registinfoModel.regist_num}</td>
                <td style="vertical-align:middle;">${bill.registinfoModel.regist_name}</td>
                <td style="vertical-align:middle;">
                    <fmt:formatNumber type="number" value=" ${bill.inho_cash}" pattern="#.00"/>元
                </td>
                <td style="vertical-align:middle;">
                    <fmt:formatNumber type="number" value=" ${bill.inho_cash-bill.inho_medical_pay-bill.inho_drug_pay}" pattern="#.00"/>元
                </td>
                <td style="vertical-align:middle;">
                    <c:choose>
                        <c:when test="${bill.inho_finall_status==0}">结算</c:when>
                        <c:otherwise>未结算</c:otherwise>
                    </c:choose>
                </td>
                <td style="vertical-align:middle;">
                    <a href="/bill/billLookDetalis/${bill.registinfoModel.regist_num}.do">详细信息</a>&nbsp;&nbsp;&nbsp;
                    <a href="/bill/outHosp/${bill.registinfoModel.regist_num}.do" onclick="if(confirm('是否确定结算？')==false) return false;">结算</a>
                </td>
            </tr>
        </c:forEach>
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
        <th colspan="5">
            <div class="inline pull-right page">
                <a href='/bill/accountIndex.do?pageNum=${page.firstPage}' >第一页</a>
                <c:if test="${page.hasPreviousPage}">
                    <a href='/bill/accountIndex.do?pageNum=${page.prePage}'>上一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}">
                    <a href='/bill/accountIndex.do?pageNum=${page.nextPage}'>下一页</a>
                    <a href='/bill/accountIndex.do?pageNum=${page.lastPage}' >最后一页</a>
                </c:if>
                &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
            </div>
            <div>
                <button type="button" class="btn btn-success" id="delPro"><img src="Images/exportExcel.png" width="18px" height="18px">&nbsp;导出Excel</button>
            </div>

        </th></tr>
</table>


</body>
</html>
