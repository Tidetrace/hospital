<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/26
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加医生</title>
    <base href="${basePath}">
    <link rel="shortcut icon" href="Images/logo.png.png">
    <jsp:include page="docstyle.jsp"/>
    <jsp:include page="docscript.jsp"/>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
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
                window.location.href="doctor/index.do";
            });
        });
    </script>
</head>
<body>

<form id="formPage" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">姓名</td>
            <td><input type="text" name="doctor_name" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件类型</td>
            <td>
                <select name="doctor_papers_type">
                    <option value="0">身份证</option>
                    <option value="1">护照</option>
                    <option value="2">军人证</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件号</td>
            <td><input type="text" name="doctor_papers_num" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">手机</td>
            <td><input type="text" name="mobile" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">座机</td>
            <td><input type="text" name="special_plane" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">性别</td>
            <td><input type="radio" name="sex" value="1" checked/>男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="0"/>女</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">出生年月</td>
            <%--<td><input type="text" name="birthday" value=""/></td>--%>
            <td>
                <input size="16px" type="text" class="calendar" name="Dom" value="" />
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">电子邮箱</td>
            <td><input type="text" name="email" value=""/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">所属科室</td>
            <td>
                <select name="officeModel.id">
                    <option value="">请选择--</option>
                    <c:forEach items="${office}" var="office">
                        <option value="${office.id}">${office.office_name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">学历</td>
            <td>
                <select name="education">
                    <option value="0">专科</option>
                    <option value="1">本科</option>
                    <option value="2">硕士</option>
                    <option value="3">博士</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td><textarea name="remark"></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button type="button" class="btn btn-primary" id="btSave" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                </center>
            </td>
        </tr>
    </table>
</form>

<script>
    $(function () {
        $('#btSave').click(function () {
            $.post('/doctor/insertDoc.do',$('#formPage').serialize(),function (result) {
                if(result.message){
                    window.location.href="/doctor/index.do";
                }else {
                    alert(result.message);
                }
            },'json')
        });
    });
</script>
<script src="assets/js/jquery-1.8.1.min.js"></script>
<script src="assets/js/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
        var datepicker = new Calendar.DatePicker({
            trigger:'.calendar',
            autoRender : true
        });
    });
</script>
</body>
</html>
