<%--
  Created by IntelliJ IDEA.
  User: 付鑫喆
  Date: 2025/7/18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>住院登记</title>
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
        input[type="number"],
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
    <h2>住院登记表</h2>
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/saveHospitalization" method="post">
        <!-- patientId：隐藏字段用于提交 -->
        <input type="hidden" name="patientId" value="${patient.patientId}">

        <label for="patientId">患者ID：</label>
        <input type="text" id="patientId" value="${patient.patientId}" readonly>

        <label for="pname">患者姓名：</label>
        <input type="text" id="pname" value="${patient.pname}" readonly>

        <label for="idCardNumber">身份证号：</label>
        <input type="text" id="idCardNumber" value="${patient.idCardNumber}" readonly>

        <label for="roomNumber">病房号：</label>
        <input type="text" id="roomNumber" name="roomNumber" required>

        <label for="cost">预计花费（元）：</label>
        <input type="number" id="cost" name="cost" step="0.01" required>

        <label for="paymentStatus">支付状态：</label>
        <select id="paymentStatus" name="paymentStatus" required>
            <option value="">请选择</option>
            <option value="paid">已支付</option>
            <option value="unpaid">未支付</option>
            <option value="partially_paid">部分支付</option>
        </select>

        <label for="isInsured">是否参保：</label>
        <select id="isInsured" name="isInsured" required>
            <option value="">请选择</option>
            <option value="true">是</option>
            <option value="false">否</option>
        </select>

        <label for="hospitalizationStatus">住院状态：</label>
        <select id="hospitalizationStatus" name="hospitalizationStatus" required>
            <option value="">请选择</option>
            <option value="admitted">已入院</option>
            <option value="discharged">已出院</option>
            <option value="in_progress">进行中</option>
        </select>

        <button type="submit">提交登记</button>
    </form>
</div>
</body>
</html>