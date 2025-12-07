<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>挂号</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- 引入Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- 自定义绿色主题 -->
    <style>
        .sidebar { width: 250px; height: 100vh; position: fixed; top: 0; left: 0; overflow-y: auto; transition: all 0.3s; }
        .main-content { margin-left: 250px; min-height: 100vh; padding: 2rem; }
        @media (max-width: 768px) { .sidebar { width: 200px; } .main-content { margin-left: 200px; } }
        @media (max-width: 640px) { .sidebar { width: 100%; height: auto; position: relative; } .main-content { margin-left: 0; padding: 1rem; } }
        h2 { color: rgb(0,100,0); }
        label { color: rgb(0,100,0) !important; font-weight: 500; }
        input:focus, select:focus {
            border-color: rgb(0,100,0) !important;
            box-shadow: 0 0 0 2px rgba(0,100,0,0.15);
        }
        .btn-green {
            background-color: rgb(0,100,0);
            color: #fff;
            font-weight: 600;
            transition: background 0.2s, transform 0.2s;
        }
        .btn-green:hover {
            background-color: rgb(0,80,0);
            color: #fff;
            transform: scale(1.04);
        }
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
        .form-label {
            color: #006400;
            font-weight: 600;
        }
        .form-control, .form-select {
            background: rgba(255,255,255,0.85);
            border: 1.5px solid #b6e2c1;
            border-radius: 0.5rem;
            box-shadow: none;
            transition: border-color 0.2s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #006400;
            box-shadow: 0 0 0 2px rgba(0,100,0,0.10);
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
        <h2 class="text-2xl fw-bold mb-6">挂号</h2>
        <form method="post" action="${pageContext.request.contextPath}/user/appointment">
            <div class="mb-3">
                <label class="form-label">科室ID：</label>
                <input type="text" class="form-control" name="departmentId" required />
            </div>
            <div class="mb-3">
                <label class="form-label">医生ID：</label>
                <input type="text" class="form-control" name="doctorId" required />
            </div>
            <div class="mb-3">
                <label class="form-label">预约时间：</label>
                <input type="datetime-local" class="form-control" name="appointmentTime" required />
            </div>
            <div class="d-flex gap-3 align-items-center mt-4">
                <button class="btn-green px-4 py-2 rounded" type="submit">提交挂号</button>
                <a href="userindex.jsp" class="btn-gray px-4 py-2 rounded">返回首页</a>
            </div>
            <c:if test="${not empty msg}">
                <div class="text-danger mt-3">${msg}</div>
            </c:if>
        </form>
    </div>
</div>
</body>
</html> 