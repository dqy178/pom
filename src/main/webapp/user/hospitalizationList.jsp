<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>住院信息列表</title>
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
        /* Google Fonts: Inter */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');
        /* Bootstrap Icons */
        @import url('https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css');
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
    <div class="max-w-4xl mx-auto glass-card p-6">
        <h2 class="text-2xl fw-bold mb-6">住院信息列表</h2>
        <table class="table glass-table mb-0">
            <thead>
                <tr>
                    <th>住院ID</th>
                    <th>医生ID</th>
                    <th>入院时间</th>
                    <th>出院时间</th>
                    <th>病房号</th>
                    <th>总金额</th>
                    <th>状态</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${hospitalizationList}" var="h">
                    <tr>
                        <td>${h.id}</td>
                        <td>${h.doctorId}</td>
                        <td>${h.admissionTime}</td>
                        <td>${h.dischargeTime}</td>
                        <td>${h.roomNo}</td>
                        <td>￥${h.totalAmount}</td>
                        <td>
                            <span class="px-2 py-1 rounded text-sm ${h.status == '已支付' ? 'bg-success-subtle text-success-emphasis' : 'bg-warning-subtle text-warning-emphasis'}">
                                ${h.status}
                            </span>
                        </td>
                        <td>${h.createTime}</td>
                        <td class="space-x-2">
                            <a href="${pageContext.request.contextPath}/user/hospitalizationDetail?id=${h.id}" class="btn-primary px-3 py-1 rounded text-sm">详情</a>
                            <c:if test="${h.status != '已支付'}">
                                <button onclick="goToPay('HOSPITALIZATION', '${h.id}')" class="btn-green px-3 py-1 rounded text-sm">支付</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="userindex.jsp" class="mt-4 btn-gray px-4 py-2 rounded d-inline-block">返回首页</a>
    </div>
</div>
    
    <!-- 支付表单 -->
    <form id="payForm" action="${pageContext.request.contextPath}/alipay" method="post" target="_self" style="display: none;">
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