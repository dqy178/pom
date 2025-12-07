<%--
  Created by IntelliJ IDEA.
  User: 付鑫喆
  Date: 2025/7/17 22:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>医生挂号管理 - 患者信息</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="/js/jquery-3.7.1.min.js"></script>
    <script src="/js/pintuer.js"></script>

    <script>
        function prescribeByAppointmentId(appointmentId) {
            window.location.href = '/selectAppointmentId?appointmentId=' + appointmentId;
        }

        function applyHospitalization(patientId) {
            window.location.href = '/applyHospitalization?patientId=' + patientId;
        }

        function complete(appointmentId) {
            window.location.href = '/updateAppStatus?appointmentId=' + appointmentId;
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-list"></span> 挂号列表</strong></div>
    <c:if test="${not empty errorMessage}">
        <div class="padding border-bottom">
            <p style="color: red;">${errorMessage}</p>
        </div>
    </c:if>
    <div class="padding border-bottom">
        <form action="/docTreatRecord" method="post">
            <div class="field">
                <label class="label">开始日期</label>
                <input type="date" class="input" name="startDate" value="${startDate}" style="width: 150px; display: inline-block;" />
                <label class="label">结束日期</label>
                <input type="date" class="input" name="endDate" value="${endDate}" style="width: 150px; display: inline-block;" />
                <input type="hidden" name="doctorId" value="${doctorId}" />
                <button class="button border-blue" type="submit" style="float: right;">查询</button>
            </div>
        </form>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th>就诊号</th>
            <th>患者名</th>
            <th>医生id</th>
            <th>是否挂号</th>
            <th>就诊时间</th>
            <th>是否住院</th>
            <th>诊断建议</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="consultation" varStatus="vs">
            <tr <c:if test="${vs.index % 2 == 0}">style="background-color: antiquewhite;"</c:if>>
                <td>${consultation.consultationId}</td>
                <td>${consultation.patient.pname}</td>
                <td>${consultation.doctorId}</td>
                <td>
                    <c:if test="${consultation.isHospitalRegistered}">是</c:if>
                    <c:if test="${!consultation.isHospitalRegistered}">否</c:if>
                </td>
                <td>
                    <fmt:formatDate value="${consultation.consultationTime}" pattern="yyyy-MM-dd HH:mm"/>
                </td>
                <td>
                    <c:if test="${consultation.isHospitalized}">是</c:if>
                    <c:if test="${!consultation.isHospitalized}">否</c:if>
                </td>
                <td>${consultation.medicalAdviceCase}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="7">
                <div class="pagelist">
                    <c:if test="${pageInfo.isFirstPage}">
                        <a href="javascript:alert('已经是第一页了')">上一页</a>
                    </c:if>
                    <c:if test="${not pageInfo.isFirstPage}">
                        <a href="${pageContext.request.contextPath}/docTreatRecord?pageNum=${pageInfo.prePage}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}">上一页</a>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                        <a href="${pageContext.request.contextPath}/docTreatRecord?pageNum=${i}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}" <c:if test="${i == pageInfo.pageNum}">class="current"</c:if>>${i}</a>
                    </c:forEach>
                    <c:if test="${pageInfo.isLastPage}">
                        <a href="javascript:alert('是最后一页了')">下一页</a>
                    </c:if>
                    <c:if test="${not pageInfo.isLastPage}">
                        <a href="${pageContext.request.contextPath}/docTreatRecord?pageNum=${pageInfo.nextPage}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}">下一页</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/docTreatRecord?pageNum=${pageInfo.pages}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}">尾页</a>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>