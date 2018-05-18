<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/28
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>药品查询</title>
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
            $('#newNav').click(function(){
                window.location.href="drug/addSkip.do";
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

<form action="drug/drugIndex.do" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">药品名称：</td>
            <td><input type="text" name="drug_name" value=""/></td>

            <td width="10%" class="tableleft">药品类型：</td>
            <td>
                <select name="drug_type">
                    <option value="">选择药品类型</option>
                    <option value="0">中药</option>
                    <option value="1">西药</option>
                    <option value="2">处方</option>
                    <option value="3">非处方</option>
                </select>
            </td>
        </tr>
        <tr>


            <td colspan="4">
                <center>
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
        <th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>药品编号</th>
        <th>药品名称</th>
        <th>药品类型</th>
        <th width: 15%;>简单描述</th>
        <th>状态</th>
        <th>剩余量</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:choose>
        <c:when test="${not empty drug}">
            <c:forEach var="drug" items="${drug}">
                <tr>
                    <td style="width: 2%;overflow: hidden;word-break:keep-all;"><input type="checkbox" name="check" value="1"></td>
                    <td style="width: 10%;overflow: hidden;word-break:keep-all;">${drug.drug_num}</td>
                    <td style="width: 10%;overflow: hidden;word-break:keep-all;">${drug.drug_name}</td>
                    <td style="width: 8%;overflow: hidden;word-break:keep-all;">
                        <c:choose>
                            <c:when test="${drug.drug_type==0}">中药</c:when>
                            <c:when test="${drug.drug_type==1}">西药</c:when>
                            <c:when test="${drug.drug_type==2}">处方</c:when>
                            <c:otherwise>非处方</c:otherwise>
                        </c:choose>
                    </td>
                    <td style="width: 20%;overflow: hidden;word-break:keep-all;">${drug.drug_desc}</td>
                    <td  style="width: 8%;overflow: hidden;word-break:keep-all;">
                        <c:choose>
                            <c:when test="${drug.status==0}">已下架</c:when>
                            <c:when test="${drug.status==1}">销售中</c:when>
                            <c:otherwise>已卖完</c:otherwise>
                        </c:choose>
                    </td>
                    <td  style="width: 3%;overflow: hidden;word-break:keep-all;">${drug.surplus}袋</td>
                    <td  style="width: 15%;overflow: hidden;word-break:keep-all;">
                        <c:if test="${user.is_admin==1}">
                            <a href="/drug/editSkip.do?drugNum=${drug.drug_num}">更改</a>&nbsp;&nbsp;&nbsp;
                        </c:if>
                        <a href="/drug/drugDetails.do?drugNum=${drug.drug_num}">详情>>></a>
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
                <a href='/drug/drugIndex.do?pageNum=${page.firstPage}' >第一页</a>
                <c:if test="${page.hasPreviousPage}">
                    <a href='/drug/drugIndex.do?pageNum=${page.prePage}'>上一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}">
                    <a href='/drug/drugIndex.do?pageNum=${page.nextPage}'>下一页</a>
                    <a href='/drug/drugIndex.do?pageNum=${page.lastPage}' >最后一页</a>
                </c:if>
                &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
            </div>
            <c:if test="${user.is_admin==1}">
                <div>
                    <button type="button" class="btn btn-success" id="newNav">添加新药</button>
                </div>
            </c:if>

        </th>
    </tr>
</table>
</body>
</html>
