<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户中心</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- 引入Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- 自定义绿色主题 -->
    <style>
        /* Custom styles for sidebar and main content */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            transition: all 0.3s;
        }
        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 2rem;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
            .main-content {
                margin-left: 200px;
            }
        }
        @media (max-width: 640px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
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
    <div class="max-w-3xl mx-auto glass-card p-6">
        <h2 class="text-2xl fw-bold mb-6">
            欢迎您，<c:out value="${not empty sessionScope.user.name ? sessionScope.user.name : sessionScope.user.username}"/>
        </h2>
        <table class="table glass-table mb-0">
            <tbody>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">用户名/手机号</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.username}"/></td>
                </tr>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">真实姓名</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.name}" default="未设置"/></td>
                </tr>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">性别</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.gender}" default="未设置"/></td>
                </tr>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">身份证号</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.idCard}" default="未设置"/></td>
                </tr>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">手机号</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.phone}" default="未设置"/></td>
                </tr>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">邮箱</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.email}" default="未设置"/></td>
                </tr>
                <tr class="border-b">
                    <th class="py-3 px-4 text-left text-gray-600">地址</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.address}" default="未设置"/></td>
                </tr>
                <tr>
                    <th class="py-3 px-4 text-left text-gray-600">注册时间</th>
                    <td class="py-3 px-4"><c:out value="${sessionScope.user.createTime}" default="未设置"/></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>