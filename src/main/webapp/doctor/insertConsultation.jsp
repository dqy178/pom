<%--
  Created by IntelliJ IDEA.
  User: 付鑫喆
  Date: 2025/7/18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>会诊登记</title>
    <style>
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            width: 520px;
            margin: 80px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[readonly] {
            background-color: #f0f0f0;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        button:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>会诊登记表</h2>
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>
    <c:if test="${not empty appointment}">
        <form action="${pageContext.request.contextPath}/saveConsultation" method="post">
            <!-- appointmentId：隐藏字段用于记录 -->
            <input type="hidden" name="appointmentId" value="${appointment.appointmentId}">
            <!-- patientId：隐藏字段用于提交 -->
            <input type="hidden" name="patientId" value="${appointment.patientId}">
            <!-- doctorId：隐藏字段用于提交 -->
            <input type="hidden" name="doctorId" value="${appointment.doctorId}">

            <label for="consultationId">会诊ID：</label>
            <input type="text" id="consultationId" value="自动生成" readonly>

            <label for="patientId">患者ID：</label>
            <input type="text" id="patientId" value="${appointment.patientId}" readonly>

            <label for="doctorId">医生ID：</label>
            <input type="text" id="doctorId" value="${appointment.doctorId}" readonly>

            <label for="consultationTime">会诊时间：</label>
            <input type="text" id="consultationTime" value="<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>" readonly>

            <label for="consultationDetails">会诊详情：</label>
            <input type="text" id="consultationDetails" name="consultationDetails" required>

            <label for="isHospitalRegistered">是否挂号住院：</label>
            <select id="isHospitalRegistered" name="isHospitalRegistered" required>
                <option value="">请选择</option>
                <option value="true">是</option>
                <option value="false">否</option>
            </select>

            <label for="isHospitalized">是否住院：</label>
            <select id="isHospitalized" name="isHospitalized" required>
                <option value="">请选择</option>
                <option value="true">是</option>
                <option value="false">否</option>
            </select>

            <button type="submit">提交会诊</button>
        </form>
    </c:if>
    <a href="${pageContext.request.contextPath}/docAppointment">返回</a>
</div>
</body>
</html>