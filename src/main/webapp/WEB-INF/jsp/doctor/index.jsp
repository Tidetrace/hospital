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
    <link rel="shortcut icon" href="Images/logo.png.png">
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
            <td>
                <select name="offName">
                    <option value="">请选择--</option>
                    <c:forEach var="office" items="${office}">
                        <option value="${office.office_name}">${office.office_name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="6"><center>
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
        <th>医生编号</th>
        <th>医生姓名</th>
        <th>入院时间</th>
        <th>所属科室</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:choose>
        <c:when test="${not empty doc}">
            <c:forEach var="doc" items="${doc}">
                <tr >
                    <td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
                    <td style="vertical-align:middle;">${doc.doctor_num}</td>
                    <td style="vertical-align:middle;">${doc.doctor_name}</td>
                    <td style="vertical-align:middle;"><f:formatDate value="${doc.pass_time}" pattern="yyy-MM-dd HH:mm:ss"/> </td>
                    <td style="vertical-align:middle;">${doc.officeModel.office_name}</td>
                    <td style="vertical-align:middle;"><a href="/doctor/details.do?docId=${doc.doctor_num}">详情>>></a>&nbsp;&nbsp;&nbsp;<a href="/doctor/detailEdit.do?docId=${doc.doctor_num}" onclick="if(confirm('确定修改医生信息?')==false)return false;">更改</a>&nbsp;&nbsp;&nbsp;<a href="/doctor/delDoctor/${doc.id}.do" onclick="if(confirm('确定删除?')==false)return false;" >删除</a></td>
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
            <button type="button" class="btn btn-success" id="delPro"><img src="Images/exportExcel.png" width="18px" height="18px">&nbsp;导出Excel</button>
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
