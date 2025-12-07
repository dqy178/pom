<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 当前页面判断 --%>
<c:set var="currentPage" value="${requestScope['javax.servlet.forward.request_uri'] != null ? fn:substringAfter(requestScope['javax.servlet.forward.request_uri'], '/user/') : fn:substringAfter(pageContext.request.requestURI, '/user/')}"/>
<c:set var="currentPage" value="${fn:replace(currentPage, '.jsp', '')}"/>
<c:set var="currentPage" value="${fn:replace(currentPage, '.action', '')}"/>

<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        :root {
            --bs-primary: #006400;
        }
        .sidebar {
            background: linear-gradient(145deg, #006400 0%, #014d01 100%);
            color: #fff;
            min-height: 100vh;
            box-shadow: 2px 0 12px rgba(0,0,0,0.1);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
        }
        .sidebar-logo {
            display: block;
            margin: 0 auto 1.5rem auto;
            width: 120px;
            height: auto;
            filter: drop-shadow(0 2px 8px rgba(0,0,0,0.10));
        }
        .sidebar .nav-link {
            color: #f0fdf4;
            font-weight: 500;
            font-size: 15px;
            border-radius: 0.5rem;
            margin-bottom: 0.5rem;
            transition: background 0.2s, color 0.2s;
            position: relative;
        }
        .sidebar .nav-link.active,
        .sidebar .nav-link:hover {
            background: rgba(255,255,255,0.18) !important;
            color: #111 !important;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            box-shadow: 0 2px 8px 0 rgba(0,100,0,0.10);
        }
        .sidebar .nav-link.active::before,
        .sidebar .nav-link:hover::before {
            content: '';
            position: absolute;
            left: 0; top: 0; right: 0; bottom: 0;
            border-radius: 0.5rem;
            border: 1.5px solid #b6e2c1;
            pointer-events: none;
        }
        .sidebar .nav-link.active::after {
            content: '';
            position: absolute;
            left: -12px;
            top: 50%;
            transform: translateY(-50%);
            width: 6px;
            height: 60%;
            background: #b6e2c1;
            border-radius: 4px;
        }
        .sidebar .sidebar-header {
            border-bottom: 1px solid #fff2;
        }
        .sidebar .avatar {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #fff;
            margin-bottom: 1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .sidebar .fw-bold {
            font-size: 18px;
        }
        .sidebar .logout-btn {
            background: linear-gradient(135deg, #004d00, #006400);
            color: #fff;
            border: none;
            width: 100%;
            border-radius: 0.5rem;
            padding: 0.75rem;
            font-weight: 500;
            margin-top: 2rem;
            transition: transform 0.2s ease, background 0.3s ease;
        }
        .sidebar .logout-btn:hover {
            transform: translateY(-1px);
            background: linear-gradient(135deg, #003800, #005000);
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<div class="sidebar d-flex flex-column align-items-center p-4">
    <!-- LOGO -->
    <img src="${pageContext.request.contextPath}/images/bk.png" alt="Logo" class="sidebar-logo">
    <!-- 头像和欢迎词 -->
    <div class="sidebar-header w-100 text-center pb-3 mb-3 d-flex flex-column align-items-center">
        <c:choose>
            <c:when test="${not empty sessionScope.user.avatar}">
                <img src="${sessionScope.user.avatar}" alt="头像" class="avatar bg-light mx-auto" onerror="this.src='${pageContext.request.contextPath}/upload/default.jpg'">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/upload/default.jpg" alt="头像" class="avatar bg-light mx-auto">
            </c:otherwise>
        </c:choose>
        <div class="fw-bold mt-2">欢迎，<c:out value="${not empty sessionScope.user.name ? sessionScope.user.name : sessionScope.user.username}"/></div>
        <div class="text-white-50 small">普通用户</div>
    </div>
    <!-- 模块标题 -->
    <div class="w-100 text-center mb-4 fs-6 fw-semibold">医院管理</div>
    <!-- 导航 -->
    <nav class="nav flex-column w-100">
        <a href="userindex.jsp" class="nav-link ${fn:endsWith(currentPage, 'index') ? 'active' : ''}">
            <i class="bi bi-house-door me-2"></i>首页
        </a>
        <a href="appointmentList" class="nav-link ${fn:endsWith(currentPage, 'appointmentList') ? 'active' : ''}">
            <i class="bi bi-calendar-check me-2"></i>挂号信息
        </a>
        <a href="prescriptionList" class="nav-link ${fn:endsWith(currentPage, 'prescriptionList') ? 'active' : ''}">
            <i class="bi bi-file-earmark-medical me-2"></i>处方信息
        </a>
        <a href="hospitalizationList" class="nav-link ${fn:endsWith(currentPage, 'hospitalizationList') ? 'active' : ''}">
            <i class="bi bi-hospital me-2"></i>住院信息
        </a>
        <a href="profile.jsp" class="nav-link ${fn:endsWith(currentPage, 'profile') ? 'active' : ''}">
            <i class="bi bi-person me-2"></i>个人信息
        </a>
    </nav>
    <!-- 退出按钮 -->
    <form action="${pageContext.request.contextPath}/userlogin.jsp" method="get" class="w-100">
        <button type="submit" class="logout-btn mt-auto">
            <i class="bi bi-box-arrow-right me-2"></i>退出登录
        </button>
    </form>
</div>
