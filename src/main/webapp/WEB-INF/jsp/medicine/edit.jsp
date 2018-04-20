<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/28
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改药品信息</title>
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
                window.location.href="drug/drugIndex.do";
            });
        });
    </script>
</head>
<body>

<form id="drugAdd" method="post" class="definewidth m20" action="">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">药品编号</td>
            <td><input type="text" name="drug_num" readonly value="${drug.drug_num}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">进价</td>
            <td><input type="text" name="purchase_price" value="${drug.purchase_price}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">售价</td>
            <td><input type="text" name="sell_price" value="${drug.sell_price}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">药品名称</td>
            <td><input type="text" name="drug_name" value="${drug.drug_name}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">药品类型</td>
            <td>
                <select name="drug_type">
                    <option value="0">中药</option>
                    <option value="1">西药</option>
                    <option value="2">处方</option>
                    <option value="3">非处方</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">简单描述</td>
            <td><input type="text" name="drug_desc" value="${drug.drug_desc}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">生产日期</td>
            <td><input type="text" name="Dom" value="<f:formatDate value="${drug.produced_time}" pattern="yyyy年MM月dd日"/> "/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">保质期</td>
            <td><input type="text" name="shelf_time" value="${drug.shelf_time}"/>天</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">详细描述</td>
            <td><textarea name="detail_desc">${drug.detail_desc}</textarea></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">生产厂商</td>
            <td><textarea name="vendor">${drug.vendor}</textarea></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">服用说明</td>
            <td><input type="text" name="taking_instructions" value="${drug.taking_instructions}"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">总的进货量</td>
            <td><input type="text" name="gross_purchases" value="${drug.gross_purchases}"/>包/(袋)</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">剩余量</td>
            <td><input type="text" name="surplus" value="${drug.surplus}"/>包/(袋)</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">备注</td>
            <td><textarea name="remark">${drug.remark}</textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button type="button" class="btn btn-primary" id="btSave">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                </center>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        $('#btSave').click(function () {
            $.post('${pageContext.request.contextPath}/drug/editDrug.do',$('#drugAdd').serialize(),function (result) {
                alert(result.message)
                if(result.message){
                    window.location.href="drug/drugIndex.do";
                }else {
                    alert(result.message);
                }
            },'json')
        });
    });
</script>
</body>
</html>
