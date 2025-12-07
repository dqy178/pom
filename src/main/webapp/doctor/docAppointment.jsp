<%--
  Created by IntelliJ IDEA.
  User: 付鑫喆
  Date: 2025/7/17 22:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        <form action="/docAppointment" method="post">
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
            <th>患者姓名</th>
            <th>身份证号</th>
            <th>预约日期</th>
            <th>预约时间</th>
            <th>创建时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="appointment" varStatus="vs">
            <c:choose>
                <c:when test="${vs.index % 2 == 0}">
                    <tr style="background-color: antiquewhite;">
                        <td>${appointment.patient.pname}</td>
                        <td>${appointment.patient.idCardNumber}</td>
                        <td>${appointment.appointmentDate}</td>
                        <td>${appointment.appointmentTime}</td>
                        <td><fmt:formatDate value="${appointment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${appointment.status}</td>
                        <td>
                            <button class="button border-blue" onclick="prescribeByAppointmentId(${appointment.appointmentId})">开处方</button>
                            <button class="button border-blue" onclick="applyHospitalization(${appointment.patientId})">申请住院</button>
                            <button class="button ${appointment.status == 'completed' ? 'border-green' : 'border-blue'}" onclick="complete(${appointment.appointmentId})">已完成</button>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td>${appointment.patient.pname}</td>
                        <td>${appointment.patient.idCardNumber}</td>
                        <td>${appointment.appointmentDate}</td>
                        <td>${appointment.appointmentTime}</td>
                        <td><fmt:formatDate value="${appointment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${appointment.status}</td>
                        <td>
                            <button class="button border-blue" onclick="prescribeByAppointmentId(${appointment.appointmentId})">开处方</button>
                            <button class="button border-blue" onclick="applyHospitalization(${appointment.patientId})">申请住院</button>
                            <button class="button ${appointment.status == 'completed' ? 'border-green' : 'border-blue'}" onclick="complete(${appointment.appointmentId})">已完成</button>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <tr>
            <td colspan="7">
                <div class="pagelist">
                    <c:if test="${pageInfo.isFirstPage}">
                        <a href="javascript:alert('已经是第一页了')">上一页</a>
                    </c:if>
                    <c:if test="${not pageInfo.isFirstPage}">
                        <a href="${pageContext.request.contextPath}/docAppointment?pageNum=${pageInfo.prePage}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}">上一页</a>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                        <a href="${pageContext.request.contextPath}/docAppointment?pageNum=${i}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}" <c:if test="${i == pageInfo.pageNum}">class="current"</c:if>>${i}</a>
                    </c:forEach>
                    <c:if test="${pageInfo.isLastPage}">
                        <a href="javascript:alert('是最后一页了')">下一页</a>
                    </c:if>
                    <c:if test="${not pageInfo.isLastPage}">
                        <a href="${pageContext.request.contextPath}/docAppointment?pageNum=${pageInfo.nextPage}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}">下一页</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/docAppointment?pageNum=${pageInfo.pages}&startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}">尾页</a>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>