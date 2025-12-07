<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2025/7/9
  Time: 下午4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%
        String contextPath = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    %>
    <base href="<%=basePath%>">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 医生管理</strong></div>
    <form method="post" action="${pageContext.request.contextPath}/manager/hospitalizationSearch.do" id="listForm">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">

                <li>
                    <%--设置用户请求的当前页--%>
                    <input type="hidden" name="page" id="page" value="1">
                    <%--    设置科室--%>
                    <select name="paymentStatus" class="input" style="width:100px; line-height:17px;">
                        <option value="">是否支付</option>
                        <option value="1" ${param.paymentStatus=="1"?"selected":""}>已支付</option>
                        <option value="0" ${param.paymentStatus=="0"?"selected":""}>未支付</option>
                    </select>
                </li>

                <li><input type="text" placeholder="请输入患者编号" value="${param.patientId}" name="patientId" class="input" style="width:150px; line-height:17px;display:inline-block" /></li>
                <li><input type="text" placeholder="请输入患者姓名" value="${param.patientName}" name="patientName" class="input" style="width:150px; line-height:17px;display:inline-block" /></li>

                <li><a href="javascript:submitFormData()" class="button border-main icon-search" > 搜索</a></li>

            </ul>
        </div>
    </form>
    <script>
        function submitFormData() {
            document.getElementById("listForm").submit();
        }
        function changePage(page){
            //把page的值，赋值给表单的隐藏域page
            document.getElementById("page").value=page;
            //提交表单
            document.getElementById("listForm").submit();
        }
    </script>
    <table class="table table-hover text-center">
        <tr>
            <th width="10%">住院编号</th>
            <th width="10%">病人编号</th>
            <th width="10%">病人姓名</th>
            <th width="10%">病房</th>
            <th width="10%">住院费用</th>
            <th width="10%">支付状态</th>
            <th width="10%">是否保险</th>
            <th width="10%">是否住院</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="Hospitalization">
            <tr>
                <td><input type="checkbox" name="patientId" value="Hospitalization" /></td>
                <td>${Hospitalization.patientId}</td>
                <td>${Hospitalization.patients.pname}</td>
                <td>${Hospitalization.roomNumber}</td>
                <td>${Hospitalization.cost}</td>
                <td>${Hospitalization.paymentStatus==1?"已支付":"未支付"}</td>
                <td>${Hospitalization.isInsured==1?"是":"否"}</td>
                <td>${Hospitalization.hospitalizationStatus==1?"是":"否"}</td>
                <td>
                    <div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(${Hospitalization.hospitalizationId})"><span class="icon-trash-o"></span>删除</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <span class="current">总记录数${pageInfo.total}</span>
                    <a href="javascript:changePage(1)">首页</a>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                        <c:choose>
                            <c:when test="${i==pageInfo.pageNum}">
                                <span class="current">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:changePage(${i})">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <a href="javascript:changePage(${pageInfo.pages})">尾页</a>
                </div>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">

    function del(hospitalizationId){
        if(confirm("您确定要删除吗?")){
            window.location.href = "${pageContext.request.contextPath}/manager/delHospitalization.do?hospitalizationId=" + hospitalizationId;
        }
    }

    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }
</script>
</body>
</html>