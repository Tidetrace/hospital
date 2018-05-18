<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/4/3
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发药详情</title>
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
                window.location.href="";
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
        $(function () {
            $('#backid').click(function(){
                window.location.href="pills/pillsIndex.do";
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
        <th>药品名称</th>
        <th>药品数量</th>
        <th>已发数量</th>
        <th>未发数量</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:choose>
        <c:when test="${not empty pills}">
            <c:forEach var="pills" items="${pills}">
                <tr >
                    <input type="hidden" id="regNum" name="regNum" value="${pills.registinfoModel.regist_num}">
                    <input type="hidden" value="${pills.drugModel.drug_num}" name="drugNum" id="drugNum">
                    <td style="vertical-align:middle;">${pills.registinfoModel.regist_num}</td>
                    <td style="vertical-align:middle;">${pills.registinfoModel.regist_name}</td>
                    <td style="vertical-align:middle;">${pills.drugModel.drug_name}</td>
                    <td style="vertical-align:middle;">${pills.pills_num}</td>
                    <td style="vertical-align:middle;">${pills.pills_send}</td>
                    <td style="vertical-align:middle;" id="pillNoSend">${pills.pills_num-pills.pills_send}</td>
                    <td style="vertical-align:middle;"><a href="javascript:void(0);" onclick="sendPillOne({regNum:'${pills.registinfoModel.regist_num}',drugNum:'${pills.drugModel.drug_num}',pillsSend:'${pills.pills_num-pills.pills_send}'})">发全</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="sendPillOne({regNum:'${pills.registinfoModel.regist_num}',drugNum:'${pills.drugModel.drug_num}',pillsSend:'1'})">发1</a></td>
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
            <div>
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </div>
        </th></tr>
</table>
<script>
    function sendPillOne(parm) {
        $.post('pills/savePillsByParam.do',{regNum:parm.regNum,drugNum:parm.drugNum,pillsSend:parm.pillsSend},function (result) {
           // if(result.message){
                /*window.location.href="pills/pillsIndex.do";*/
                //alert(result.error)
          //  }else {
                alert(result.error);
                window.location.reload();
           // }
        },'json')
    }
</script>
</body>
</html>

