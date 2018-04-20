<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/3
  Time: 11:47
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
            $('#newNav').click(function(){
                window.location.href="dispensing-gives.html";
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

<form action="/pills/pillsIndex.do" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">病例号：</td>
            <td><input type="text" name="regNum" value=""/></td>
        </tr>
        <tr>
            <td colspan="2"><center>
                <button type="submit" class="btn btn-primary" type="button">查询</button>
                <button type="submit" class="btn btn-primary" type="button">清空</button>
            </center>
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
        <th>负责人</th>
        <th>操作</th>
    </tr>
    </thead>

    <c:choose>
        <c:when test="${ not empty pills}">
            <c:forEach var="pills" items="${pills}">
                <tr >
                    <td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
                    <td style="vertical-align:middle;">${pills.registinfoModel.regist_num}</td>
                    <td style="vertical-align:middle;">${pills.registinfoModel.regist_name}</td>
                    <td style="vertical-align:middle;">${pills.creater}</td>
                    <td style="vertical-align:middle;"><a href="/pills/blisterSkip.do?regNum=${pills.registinfoModel.regist_num}">发药</a>&nbsp;&nbsp;&nbsp;<a href="/pills/pillsDetails.do?regNum=${pills.registinfoModel.regist_num}">详情...</a></td>
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
                <a href='/pills/pillsIndex.do?pageNum=${page.firstPage}' >第一页</a>
                <c:if test="${page.hasPreviousPage}">
                    <a href='/pills/pillsIndex.do?pageNum=${page.prePage}'>上一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}">
                    <a href='/pills/pillsIndex.do?pageNum=${page.nextPage}'>下一页</a>
                    <a href='/pills/pillsIndex.do?pageNum=${page.lastPage}' >最后一页</a>
                </c:if>
                &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
            </div>
            <div><button type="button" class="btn btn-success" id="newNav">发药</button>

            </div>

        </th></tr>
</table>
</body>
</html>
