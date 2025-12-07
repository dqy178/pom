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
    <title>网站信息</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>添加医生</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/manager/addDoctor.do" enctype="multipart/form-data">
            <div class="form-group">
                <div class="label">
                    <label>职工号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" value="" id="jobNumber" name="jobNumber" />
                    <div class="tips" id="dv_jobNumber"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>医生姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input"value="" name="name" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>医生照片：</label>
                </div>
                <div class="field">
                    <input class="input" type="file" name="imgFile" value="" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>医生电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="phone" value="" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>医生邮箱：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="email" value="" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>简介：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="introduction" style="height:80px"></textarea>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>挂号费：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="registrationFee" value="" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>科室：</label>
                </div>
                <div class="field">
                    <%--    设置科室--%>
                    <select name="departmentId" class="input" >
                        <option value="">请选择科室</option>
                        <c:forEach items="${departmentsSecondList}" var="d">
                            <option value="${d.departmentId}" ${param.departmentId==d.departmentId?"selected":""}>${d.departmentName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>科室：</label>
                </div>
                <div class="field">
                    <%--    设置职称--%>
                        <select name="professionalTitleId" class="input" style="width:100px; line-height:17px;">
                            职称：<option value="">请选择职称</option>
                            <c:forEach items="${titlesList}" var="pt">
                                <option value="${pt.id}" ${param.titleId==pt.id?"selected":""}>${pt.titleName}</option>
                            </c:forEach>
                        </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<%--    编写JS，实现学号的验证--%>
<script>
    $(document).ready(function () {
        $("#jobNumber").blur(function () {
            var JobNumber = $(this).val();
            // 调用jQuery.ajax()实现异步
            $.ajax({
                url: "${pageContext.request.contextPath}/manager/checkName.do",  // 发送请求的url
                type: "get",  // 请求方式
                data: {"jobNumber": JobNumber,time:Math.random()},  // 发送到服务器的数据{名：值，名：值
                dataType: "text",
                success: function (result) {
                    console.log("result==>"+result)
                    if (result == "true") {
                        $("#dv_jobNumber").text("职工号已存在");
                        $("#dv_jobNumber").css("color", "red");
                    } else {
                        $("#dv_jobNumber").text("职工号可用");
                        $("#dv_jobNumber").css("color", "green");
                    }
                }
            });
        })
    })
</script>
</body></html>