<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/27
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>门诊查询</title>
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
                window.location.href="reg/addSkip.do";
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

<form action="/reg/regIndex.do" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">病历号：</td>
            <td><input type="text" name="regist_num" value=""/></td>

            <td width="10%" class="tableleft">主治医生：</td>
            <td><input type="text" name="doctorModel.doctor_name" value=""/></td>

            <td width="10%" class="tableleft">科室：</td>
            <td><input type="text" name="officeModel.office_name" value=""/></td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center;vertical-align: middle">
                <button type="submit" class="btn btn-primary" type="button">查询</button>
                &nbsp; &nbsp; &nbsp; &nbsp;
                <button type="button" class="btn btn-primary" type="button">清空</button>
            </td>
        </tr>
    </table>
</form>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>门诊编号</th>
        <th>病号姓名</th>
        <th>挂号时间</th>
        <th>挂号科室</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:choose>
        <c:when test="${not empty reg}">
            <c:forEach items="${reg}" var="reg">
                <tr >
                <td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
                <td style="vertical-align:middle;">${reg.regist_num}</td>
                <td style="vertical-align:middle;">${reg.regist_name}</td>
                <td style="vertical-align:middle;"><f:formatDate value="${reg.create_time}" pattern="yyyy-MM-dd HH:ss:dd"/> </td>
                <td style="vertical-align:middle;">${reg.officeModel.office_name}</td>
                <td style="vertical-align:middle;">
                    <c:choose>
                        <c:when test="${reg.status==1}">已挂号</c:when>
                        <c:when test="${reg.status==0}">已退号</c:when>
                        <c:otherwise>已取号</c:otherwise>
                    </c:choose>
                </td>
                   <%-- <td style="vertical-align:middle;">

                </td>--%>
                    <td style="vertical-align: middle">
                            <a href="/reg/regDetails.do?regNum=${reg.regist_num}">详情>>></a>&nbsp;&nbsp;&nbsp;
                            <a href="/reg/regEdit.do?regNum=${reg.regist_num}">更改</a>&nbsp;&nbsp;&nbsp;
                            <a href="/reg/regDel.do?regNum=${reg.regist_num}">退号</a>&nbsp;&nbsp;&nbsp;
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
                <a href='/reg/regIndex.do?pageNum=${page.firstPage}' >第一页</a>
                <c:if test="${page.hasPreviousPage}">
                    <a href='/reg/regIndex.do?pageNum=${page.prePage}'>上一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}">
                    <a href='/reg/regIndex.do?pageNum=${page.nextPage}'>下一页</a>
                    <a href='/reg/regIndex.do?pageNum=${page.lastPage}' >最后一页</a>
                </c:if>
                &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
            </div>
            <div><button type="button" class="btn btn-success" id="newNav">门诊挂号</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-success" id="delPro" onClick="delAll();">退号</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-success" id="export">导出Excel</button>
                <button type="button" class="btn btn-success" id="print">打印</button>
            </div>
        </th>
    </tr>
</table>


</body>
</html>
