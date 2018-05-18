<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/16
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加角色信息</title>
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
                window.location.href="role/addSkip.do";
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
                if(confirm("确认删除?")){
                    alert("删除成功!");
                }
            }else{
                alert("请选中要删除的项");
            }
        }
    </script>

</head>
<body>
<form class="form-inline definewidth m20" action="/role/roleIndex.do" method="get">
    角色名称：
    <input type="text" name="role_name" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary" type="button"><i class="icon-search icon-white"></i>搜索</button>
    <button type="reset" class="btn btn-success" type="button"><img src="Images/qingkong.png" width="13px" height="13px">&nbsp;清空</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th width="5%"><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>角色名称</th>
        <th>状态</th>
        <th width="10%">操作</th>
    </tr>
    </thead>

    <c:choose>
        <c:when test="${not empty role}">
            <c:forEach items="${role}" var="role">
                <tr>
                    <td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
                    <td>${role.role_name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${role.state==1}">启用</c:when>
                            <c:otherwise>禁用</c:otherwise>
                        </c:choose>
                    </td>
                    <td><a href="/role/delRoleByRoleId/${role.id}.do" onclick="if(confirm('确定删除?')==false)return false;">删除</a> </td>
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
                <a href='/role/roleIndex.do?pageNum=${page.firstPage}' >第一页</a>
                <c:if test="${page.hasPreviousPage}">
                    <a href='/role/roleIndex.do?pageNum=${page.prePage}'>上一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}">
                    <a href='/role/roleIndex.do?pageNum=${page.nextPage}'>下一页</a>
                    <a href='/role/roleIndex.do?pageNum=${page.lastPage}' >最后一页</a>
                </c:if>
                &nbsp;&nbsp;&nbsp;共<span class='current'>${page.total}</span>条记录<span class='current'> ${page.pageNum}/${page.pages} </span>页
            </div>

            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/adds.png" width="30px" height="30px" id="newNav">&nbsp;&nbsp;&nbsp;
                <img src="Images/del.png" width="30px" height="30px" id="delPro" onClick="delAll()">&nbsp;&nbsp;&nbsp;

            </div>
        </th>
    </tr>
</table>

</body>
</html>