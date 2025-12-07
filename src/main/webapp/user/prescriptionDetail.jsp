<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.dqy.pojo.Prescription" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>处方详情</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- 引入Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- 自定义绿色主题 -->
    <style>
        .sidebar { width: 250px; height: 100vh; position: fixed; top: 0; left: 0; overflow-y: auto; transition: all 0.3s; }
        .main-content { margin-left: 250px; min-height: 100vh; padding: 2rem; }
        @media (max-width: 768px) { .sidebar { width: 200px; } .main-content { margin-left: 200px; } }
        @media (max-width: 640px) { .sidebar { width: 100%; height: auto; position: relative; } .main-content { margin-left: 0; padding: 1rem; } }
        :root {
            --bs-primary: #006400;
        }
        .bg-primary, .btn-primary, .table-primary, .active {
            background-color: #006400 !important;
            border-color: #006400 !important;
        }
        .text-primary {
            color: #006400 !important;
        }
        .btn-primary {
            color: #fff !important;
        }
        .sidebar .nav-link.active {
            background-color: #006400 !important;
            color: #fff !important;
        }
    </style>
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 2rem;
        }
        .glass-card {
            background: rgba(255,255,255,0.65);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 1.2rem;
            box-shadow: 0 4px 24px rgba(0,100,0,0.10);
            border: 1.5px solid #e0f2e9;
        }
        .glass-table th, .glass-table td {
            background: rgba(255,255,255,0.85);
            backdrop-filter: blur(6px);
        }
        .glass-table tr:hover {
            background: rgba(0,100,0,0.08) !important;
        }
        .btn-primary, .btn-green {
            background: linear-gradient(135deg, #006400, #43a047);
            color: #fff !important;
            border: none;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(0,100,0,0.08);
            transition: background 0.2s, transform 0.2s;
        }
        .btn-primary:hover, .btn-green:hover {
            background: linear-gradient(135deg, #014d01, #388e3c);
            color: #111 !important;
            transform: scale(1.04);
        }
        .btn-gray {
            background: #f3f4f6;
            color: #333;
            border: none;
        }
        .btn-gray:hover {
            background: #e0e0e0;
            color: #111;
        }
    </style>
    <!-- 引入Bootstrap JS（可选） -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<c:if test="${empty sessionScope.user}">
    <c:redirect url="/userlogin.jsp"/>
</c:if>
<jsp:include page="sidebar.jsp"/>
<div class="main-content">
    <div class="max-w-2xl mx-auto glass-card p-6">
        <h2 class="text-2xl fw-bold mb-6">处方详情</h2>
        <% Prescription p = (Prescription) request.getAttribute("prescription"); %>
        <table class="table glass-table mb-4">
            <tr><th>处方ID</th><td><%=p.getId()%></td></tr>
            <tr><th>医生ID</th><td><%=p.getDoctorId()%></td></tr>
            <tr><th>挂号ID</th><td><%=p.getAppointmentId()%></td></tr>
            <tr><th>处方内容</th><td><%=p.getContent()%></td></tr>
            <tr><th>总金额</th><td><%=p.getTotalAmount()%></td></tr>
            <tr><th>状态</th><td><%=p.getStatus()%></td></tr>
            <tr><th>创建时间</th><td><%=p.getCreateTime()%></td></tr>
        </table>
        <% if (!"已支付".equals(p.getStatus())) { %>
            <button class="btn-primary px-4 py-2 rounded me-2" type="button" onclick="goToPay('PRESCRIPTION', '<%=p.getId()%>')">缴费</button>
        <% } %>
        <a href="prescriptionList.jsp" class="btn-gray px-4 py-2 rounded">返回列表</a>
        <c:if test="${not empty msg}">
            <div class="text-red-600 mt-3">${msg}</div>
        </c:if>
    </div>
</div>
<!-- 支付表单（统一入口） -->
<form id="payForm" action="${pageContext.request.contextPath}/alipay" method="post" style="display:none;">
    <input type="hidden" name="orderType" id="orderType">
    <input type="hidden" name="orderId" id="orderId">
</form>
<script>
    function goToPay(orderType, orderId) {
        document.getElementById('orderType').value = orderType;
        document.getElementById('orderId').value = orderId;
        document.getElementById('payForm').submit();
    }
</script>
</body>
</html> 