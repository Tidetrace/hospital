<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/29
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>入院办理</title>
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
            $('#newNav').click(function(){
                window.location.href="inhosp/addInhospSkip.do";
            });
        });

        function checkall(){
            var alls=document.getElementsByName("check");
            var ch=document.getElementById("checkall");
            if(ch.checked){
                for(var i=0;i<alls.length;i++){
                    alls[i].checked=true;
                }
            }else{
                for(var i=0;i<alls.length;i++){
                    alls[i].checked=false;
                }
            }
        }
        function delAll(){
            var alls=document.getElementsByName("check");
            var ids=new Array();
            for(var i=0;i<alls.length;i++){
                if(alls[i].checked){
                    ids.push(alls[i].value);
                }
            }
            if(ids.length>0){
                if(confirm("确认操作?")){
                    alert("成功!");
                }
            }else{
                alert("请选中要操作的项");
            }
        }
    </script>
</head>
<body>

<form action="/inhosp/inhospIndex.do" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">病例号：</td>
            <td><input type="text" name="regNum" value=""/></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button"><i class="icon-search icon-white"></i>搜索</button>
                <button type="reset" class="btn btn-success" type="button">清空</button>
            </td>
        </tr>
    </table>
</form>

<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>病历号</th>
        <th>姓名</th>
        <th>床位号</th>
        <th>联系电话</th>
        <th>押金</th>
        <th>主治医生</th>
        <th>入院时间</th>
        <th>科室</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:choose>
        <c:when test="${not empty inhosp}">
            <c:forEach items="${inhosp}" var="inhosp">
                <tr >
                    <td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
                    <td style="vertical-align:middle;">${inhosp.registinfoModel.regist_num}</td>
                    <td style="vertical-align:middle;">${inhosp.registinfoModel.regist_name}</td>
                    <td style="vertical-align:middle;">${inhosp.bed_num}</td>
                    <td style="vertical-align:middle;">${inhosp.registinfoModel.phone}</td>
                    <td style="vertical-align:middle;">${inhosp.cash}元</td>
                    <td style="vertical-align:middle;">${inhosp.registinfoModel.doctorModel.doctor_name}</td>
                    <td style="vertical-align:middle;"><f:formatDate value="${inhosp.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                    <td style="vertical-align:middle;">${inhosp.registinfoModel.officeModel.office_name}</td>
                    <td style="vertical-align:middle;">
                        <c:choose>
                            <c:when test="${inhosp.state==1}">已住院</c:when>
                            <c:when test="${inhosp.state==0}">已结算</c:when>
                            <c:otherwise>已出院</c:otherwise>
                        </c:choose>
                    </td>
                    <td style="vertical-align:middle;"><a href="/inhosp/inHospDetails.do?regNum=${inhosp.registinfoModel.regist_num}">详情>>></a>&nbsp;&nbsp;&nbsp;<a href="/inhosp/settleHosp.do?regNum=${inhosp.registinfoModel.regist_num}" onclick="return confirm('确定结算?')">结算</a>&nbsp;&nbsp;&nbsp;<a href="/inhosp/outHosp.do?regNum=${inhosp.registinfoModel.regist_num}" onclick="return confirm('确定出院?')">出院</a></td>
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
                <a href='/inhosp/inhospIndex.do?pageNum=${page.firstPage}' >第一页</a>
                <c:if test="${page.hasPreviousPage}">
                    <a href='/inhosp/inhospIndex.do?pageNum=${page.prePage}'>上一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}">
                    <a href='/inhosp/inhospIndex.do?pageNum=${page.nextPage}'>下一页</a>
                    <a href='/inhosp/inhospIndex.do?pageNum=${page.lastPage}' >最后一页</a>
                </c:if>
                &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
            </div>
            <div><button type="button" class="btn btn-success" id="newNav">录入住院信息</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-success" id="delPro">导出Excel</button>
            </div>

        </th></tr>
</table>

</body>
</html>
