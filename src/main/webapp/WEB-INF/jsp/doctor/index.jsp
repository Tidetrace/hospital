<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/22
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${basePath}">
    <title>门诊医生---2015</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
    <script type="text/javascript" src="Js/jquery.js"></script>
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
                window.location.href="doctor/add.do";
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

</body><body>

<form action="doctor/index.do" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">医生编号：</td>
            <td><input type="text" name="docNum" value=""/></td>

            <td width="10%" class="tableleft">医生姓名：</td>
            <td><input type="text" name="docName" value=""/></td>

            <td width="10%" class="tableleft">科室：</td>
            <td><input type="text" name="offName" value=""/></td>
        </tr>
        <tr>
            <td colspan="6"><center>
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
        <th>医生编号</th>
        <th>医生姓名</th>
        <th>入院时间</th>
        <th>所属科室</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach var="doc" items="${doc}">
        <tr >
            <td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
            <td style="vertical-align:middle;">${doc.doctor_num}</td>
            <td style="vertical-align:middle;">${doc.doctor_name}</td>
            <td style="vertical-align:middle;"><f:formatDate value="${doc.pass_time}" pattern="yyy-MM-dd HH:mm:ss"/> </td>
            <td style="vertical-align:middle;">${doc.officeModel.office_name}</td>
            <td style="vertical-align:middle;"><a href="/doctor/details.do?docId=${doc.doctor_num}">详情>>></a>&nbsp;&nbsp;&nbsp;<a href="/doctor/detailEdit.do?docId=${doc.doctor_num}">更改</a></td>
        </tr>
    </c:forEach>

</table>

<table class="table table-bordered table-hover definewidth m10" >
    <tr><th colspan="5">  <div class="inline pull-right page">
        <a href='doctor/index.do?pageNum=${page.firstPage}' >第一页</a>
        <c:if test="${page.hasPreviousPage}">
            <a href='doctor/index.do?pageNum=${page.prePage}'>上一页</a>
        </c:if>
        <c:if test="${page.hasNextPage}">
            <a href='doctor/index.do?pageNum=${page.nextPage}'>下一页</a>
        </c:if>
        <c:if test="${page.isLastPage}">
            <a href='doctor/index.do?pageNum=${page.lastPage}' >最后一页</a>
        </c:if>
        &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
    </div>
        <div><button type="button" class="btn btn-success" id="newNav">添加新医生</button>
            <button type="button" class="btn btn-success" id="delPro">导出Excel</button>
        </div>

    </th></tr>
</table>
<script>
    $(function () {
       $('#delPro').click(function () {
           if(confirm("确定导出医生信息?")){
               //点击确定后操作
               window.location="doctor/exportactor.do";
           }
       });
    });
</script>

</body>
</html>
