<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYC
  Date: 2018/3/30
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>录入住院信息</title>
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
            $('#backid').click(function(){
                window.location.href="inhosp/inhospIndex.do";
            });
        });
    </script>
</head>
<body id="bd">
<form id="inhoForm" method="post" class="definewidth m20" action="pres/addPillsAll.do">
    <table class="table table-bordered table-hover definewidth m10" id="tables">
        <tr>
            <input type="hidden" id="reg" name="regist_num" value="${inhosp.regist_num}">
            <td width="10%" class="tableleft">病历号</td>
            <td><input type="text" name="regNum" value="${inhosp.regist_num}" id="regNum" placeholder="输入病历号" onchange="selectByRegNum()"/></td>
        </tr>
        <c:choose>
            <c:when test="${not empty inhosp}">
                <tr>
                    <td width="10%" class="tableleft">姓名</td>
                    <td>${inhosp.regist_name}</td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">证件类型</td>
                    <td>
                        <c:choose>
                            <c:when test="${inhosp.regist_papers_type==0}">
                                护照
                            </c:when>
                            <c:when test="${inhosp.regist_papers_type==1}">
                                身份证
                            </c:when>
                            <c:otherwise>
                                港澳通行证
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">证件号</td>
                    <td>${inhosp.regist_papers_num}</td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">社保号</td>
                    <td>${inhosp.regist_social_num}</td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">联系电话</td>
                    <td>${inhosp.phone}</td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">是否自费</td>
                    <td>
                        <c:choose>
                            <c:when test="${inhosp.self_paying==1}">是</c:when>
                            <c:otherwise>否</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">性别</td>
                    <td>
                        <c:choose>
                            <c:when test="${inhosp.sex==1}">男</c:when>
                            <c:otherwise>女</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td width="10%" class="tableleft">年龄</td>
                    <td>${inhosp.age}</td>
                </tr>
                <%--  <tr>
                      <td width="10%" class="tableleft">所挂科室</td>
                      <td>${inhosp.officeModel.office_name}</td>
                  </tr>
                  <tr>
                      <td width="10%" class="tableleft">指定医生</td>
                      <td>${inhosp.doctorModel.doctor_name}</td>
                  </tr>--%>
                <tr>
                    <td width="10%" class="tableleft">药品名</td>
                    <td>
                        <c:forEach var="drug" items="${drug}" varStatus="i">
                            <input type="checkbox" name="drugNum" value="${drug.drug_num}">${drug.drug_name}&nbsp;&nbsp;
                            <input type="text" name="gross_purchases" value="" style="width: 70px;" placeholder="(袋/瓶)">&nbsp;&nbsp;
                            <c:if test="${i.count%3==0}">
                                <br/>
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <center>
                            <button id="btSave" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
                        </center>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td style="text-align:center;vertical-align:middle;font-size: 20px;" colspan="7">请输入正确的病历编号...</td>
                </tr>
            </c:otherwise>
        </c:choose>

    </table>
</form>
<script>
    function selectByRegNum() {
        /* 输入病历编号 查询这个人的信息*/
        var regNum = $('#regNum').val()
        $('#bd').load('/pres/ByHospRegNum.do',{regNum:regNum},function () {
            $('#reg').val(regNum);
        });
    }
    $(function () {
        $('#btSave').click(function () {
            var arr_drug = new Array();
            var arr_gros = new Array();
            // 将药品信息封装成数组
            $("input[name='drugNum']").each(function(i) {
                if($(this).is(':checked')){
                    arr_drug[i]=$(this).val();
                }else {
                    arr_drug[i]="";
                }
            });
            // 将药品数量封装成数组
            $("input[name='gross_purchases']").each(function(i) {
                if($(this).val()!=null||$(this).val()!=""){
                    arr_gros[i]=$(this).val();
                }else {
                    arr_gros[i]="";
                }
            });
            var regNum = $('#regNum').val()
            //发出ajax请求
            $.ajax({
                type:'post',
                url:'pres/addPillsAll.do',
                data:{regNum:regNum,arr_drug:arr_drug,arr_gros:arr_gros},
                traditional:true,
                dataType:'json',
                success:function (result) {
                    if(result.message){
                        alert(result.error);
                        window.location.reload();
                    }else {
                        alert(result.error);
                    }
                }
            })
        });
    })
    /*根据病历编号，批量添加药品和数量*/
    /* $(function () {
         $('#btSave').click(function () {
             // 判断 name=fruit 组的复选框是否有被选中的选项：
           <!--获取选中复选框的值-->
           /!*  var arr = new Array();
             $("input[name='drugNum']").each(function(i){
                 if($(this).is(':checked')){
                     arr[i] = $(this).val();
                 }*!/
                // alert(arr)
                 var regNum = $('#regNum').val()
                 $.post('pres/addPillsAll.do',{regNum:regNum},function (result) {
                     if(result.message){
                         alert("成功")
                     }else {
                         alert("失败")
                     }
                 },'json')

             });*/


    /* $("input[name='gross_purchases']").each(function (i) {
         if($(this!=null && this!=''&&this!=0)){
             inx[i] = $(this).val()
         }
     })*/
    //var vals = arr.join(",");
    //console.log(vals);

    // });
</script>
</body>
</html>
