<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/28
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改挂号信息</title>
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
            $('#backid').click(function(){
                window.location.href="reg/regIndex.do";
            });
        });
    </script>
</head>
<body>
<form id="regEdit" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <input type="hidden" name="regist_num" value="${reg.regist_num}">
        <tr>
            <td width="10%" class="tableleft">姓名</td>
            <td><input type="text" name="regist_name" placeholder="请输入姓名" readonly value="${reg.regist_name}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件类型</td>
            <td>
                <select name="regist_papers_type">
                    <option value="1">身份证</option>
                    <option value="0">护照</option>
                    <option value="2">港澳通行证</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">证件号</td>
            <td><input type="text" name="regist_papers_num" placeholder="请输入证件号" value="${reg.regist_papers_num}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">挂号费</td>
            <td><input type="text" name="fee_money" placeholder="请输入挂号费" value="${reg.fee_money}"/>元</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">社保号</td>
            <td><input type="text" name="regist_social_num" placeholder="请输入社保号" value="${reg.regist_social_num}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">联系电话</td>
            <td><input type="text" name="phone" placeholder="请输入联系电话" value="${reg.phone}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">是否自费</td>
            <td><input type="radio" name="self_paying" value="0" checked/>否&nbsp;&nbsp;&nbsp;<input type="radio" name="self_paying" value="1"/>是</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">性别</td>
            <td><input type="radio" name="sex" value="1" checked/>男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="0"/>女</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">职业</td>
            <td><input type="text" name="job" placeholder="请输入职业" value="${reg.job}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">初复诊</td>
            <td><input type="radio" name="early_appointment" value="0" checked/>初诊&nbsp;&nbsp;&nbsp;<input type="radio" name="early_appointment" value="1"/>复诊</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">所挂科室</td>
            <td>
                <select name="officeModel.id">
                    <option value="">请选择--</option>
                    <c:forEach items="${off}" var="off">
                        <option value="${off.id}">${off.office_name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">指定医生</td>
            <td>
                <select name="doctorModel.id">
                    <option value="">请选择--</option>
                    <c:forEach items="${doc}" var="doc">
                        <option value="${doc.id}">${doc.doctor_name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td><textarea name="remark" placeholder="需要备注下吗...">${reg.remark}</textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button class="btn btn-primary" id="btSave" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                </center>
            </td>
        </tr>
    </table>
</form>

<script>
    $(function () {
        $('#btSave').click(function () {
            $.post('reg/updateReg.do',$('#regEdit').serialize(),function (result) {
                if(result.message){
                    window.location.href="reg/regIndex.do";
                }else {
                    alert(result.message);
                }
            },'json')
        });
    });
</script>
</body>
</html>
