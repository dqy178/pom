<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%
        String contextPath = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>科室设置 - 医院挂号系统</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            font-size: 18px;
        }
        .top-green-bar {
            background-color: #006400;
            width: 100vw;
            padding: 10px 500px;
            box-sizing: border-box;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .top-green-bar a {
            color: white;
            margin-left: 15px;
            text-decoration: none;
            font-size: 14px;
            user-select: none;
        }
        .top-green-bar a:hover {
            font-weight: bold;
        }
        .nav-container {
            background-color: white;
            width: 100vw;
            padding: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: fixed;
            top: 40px;
            left: 0;
            z-index: 999;
        }
        .container {
            width: 100%;
            max-width: 100%;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 20px;
            box-sizing: border-box;
        }
        .top-bar {
            width: 100%;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
        }
        .top-bar .logo {
            flex-shrink: 0;
            height: 80px;
            width: auto;
            margin-left: 120px;
            margin-right: 40px;
        }
        .nav-left {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            flex: 1;
            min-width: 0;
        }
        .nav-left a,
        .dropbtn {
            color: #333;
            text-decoration: none;
            font-size: 24px;
            line-height: 36px;
        }
        .nav-search {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .nav-search form {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            overflow: hidden;
            background-color: white;
        }
        .nav-search input[type="text"] {
            border: none;
            padding: 6px 10px;
            font-size: 16px;
            outline: none;
            width: 180px;
        }
        .nav-search button {
            background-color: #5b9e6d;
            border: none;
            color: white;
            padding: 6px 12px;
            cursor: pointer;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .nav-search button:hover {
            background-color: #4e8f57;
        }
        .nav-search button i {
            pointer-events: none;
        }
        .nav-left a:hover,
        .dropbtn:hover {
            font-weight: bold;
            color: #00704a;
        }
        .dropdown {
            position: relative;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 110px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            border-radius: 0 0 5px 5px;
            z-index: 1000;
            top: 100%;
            left: 0;
        }
        .dropdown-content a {
            color: #333;
            padding: 10px 16px;
            text-decoration: none;
            display: block;
            font-size: 20px;
            user-select: none;
        }
        .dropdown-content a:hover {
            background-color: #f0f0f0;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .main-content {
            margin-top: 160px;
            width: 100%;
            max-width: 1200px;
        }
        .white-wrapper {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            width: 100%;
            box-sizing: border-box;
            margin-top: 30px;
            overflow: hidden;
        }
        .breadcrumb {
            padding: 10px 20px;
            font-size: 16px;
            background: #f9f9f9;
            width: 100%;
            box-sizing: border-box;
            border-bottom: 1px solid #ddd;
            margin-top: 0;
        }
        .breadcrumb a {
            color: #4e8f57;
            text-decoration: none;
        }
        .layout {
            display: flex;
            width: 100%;
            gap: 30px;
            box-sizing: border-box;
            padding: 25px 20px;
        }
        aside.sidebar-rect {
            width: 150px;
            height: 200px;
            background-color: white;
            box-sizing: border-box;
            padding: 0;
            border: 1px solid #ccc;
            border-radius: 0;
            font-size: 18px;
        }
        aside.sidebar-rect h3 {
            margin: 0;
            padding: 12px 16px;
            background-color: #5b9e6d;
            color: white;
            font-size: 18px;
            border-bottom: 2px solid #4e8f57;
        }
        ul.sidebar-list-rect {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        ul.sidebar-list-rect li {
            border-bottom: 1px solid #ddd;
        }
        ul.sidebar-list-rect li:last-child {
            border-bottom: none;
        }
        ul.sidebar-list-rect a {
            display: block;
            padding: 12px 16px;
            text-decoration: none;
            color: #333;
            font-size: 16px;
            user-select: none;
        }
        ul.sidebar-list-rect a:hover,
        ul.sidebar-list-rect a.active {
            color: #4e8f57;
            font-weight: bold;
            background-color: #f9f9f9;
        }
        .content {
            flex-grow: 1;
            background-color: white;
            padding: 0;
            font-size: 18px;
            color: #333;
            line-height: 1.6;
            margin-top: 0;
            box-sizing: border-box;
        }
        .content h2 {
            margin-top: 0;
            color: #4e8f57;
            padding-bottom: 10px;
        }
        .content table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .content th, .content td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .content th {
            background-color: #f9f9f9;
            color: #4e8f57;
            font-weight: bold;
        }
        .content td {
            font-size: 16px;
        }
        .pagelist {
            text-align: center;
            margin-top: 20px;
        }
        .pagelist a, .pagelist span {
            display: inline-block;
            padding: 5px 10px;
            margin: 0 2px;
            text-decoration: none;
            color: #4e8f57;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .pagelist span.current {
            background-color: #4e8f57;
            color: white;
            border: 1px solid #4e8f57;
        }
        .pagelist a:hover {
            background-color: #f0f0f0;
        }
        .footer {
            background-color: #006400;
            color: white;
            width: 100vw;
            text-align: center;
            padding: 18px 0;
            font-size: 18px;
            margin-top: 20px;
            border-radius: 0;
        }
        .footer a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-size: 18px;
        }
        .footer a:hover {
            font-weight: bold;
        }
        .side-button-column {
            position: fixed;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            display: flex;
            flex-direction: column;
            gap: 10px;
            z-index: 1000;
            overflow: visible;
        }
        .side-button {
            position: relative;
            z-index: 10;
            width: 50px;
            height: 50px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        .side-button img, .side-button svg {
            width: 30px;
            height: 30px;
        }
        .side-button svg path {
            fill: #333;
        }
        .side-button.text-button:hover {
            background-color: #5b9e6d;
            transform: scale(1.1);
        }
        .side-button.text-button:hover img {
            display: none;
        }
        .side-button.text-button:hover::after {
            content: attr(data-text);
            color: white;
            font-size: 14px;
            font-weight: bold;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            text-align: center;
            transform: translate(-50%, -50%);
            line-height: 1.2;
            white-space: pre-line;
        }
        .side-button.icon-button:hover {
            background-color: #5b9e6d;
            transform: scale(1.1);
        }
        .side-button.icon-button:hover > img {
            filter: brightness(0) invert(1);
        }
        .side-button-tooltip {
            display: none;
            position: absolute;
            right: 60px;
            top: 50%;
            transform: translateY(-50%);
            width: 100px;
            height: 100px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.25);
            z-index: 2000 !important;
            pointer-events: none;
        }
        .side-button-tooltip img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            border-radius: 5px;
        }
        .side-button.icon-button:hover .side-button-tooltip {
            display: block;
        }
    </style>
</head>
<body>
<div class="top-green-bar">
    <a href="first.jsp">患者版</a>
    <a href="https://www.ustb.edu.cn/">学术版</a>
    <a href="login.jsp">员工版</a>
    <a href="enHome.jsp">EN</a>
</div>

<div class="nav-container">
    <div class="container">
        <div class="top-bar">
            <img src="images/school-logo.png" alt="医院标志" class="logo">
            <div class="nav-left">
                <a href="first.jsp">首页</a>
                <div class="dropdown">
                    <a href="introduction.jsp" class="dropbtn">医院概况 ▼</a>
                    <div class="dropdown-content">
                        <a href="introduction.jsp">医院简介</a>
                        <a href="departmentFront.do">科室设置</a>
                        <a href="doctorInfo.do">医生信息</a>
                    </div>
                </div>
                <a href="register.jsp">网上挂号</a>
                <a href="manager/schedule.do">出诊查询</a>
                <a href="info.jsp">就诊须知</a>
                <a href="announcementSearch.do?page=1">通知公告</a>

                <div class="nav-search">
                    <form action="search.do" method="get" onsubmit="return validateSearch()">
                        <input type="text" name="keyword" placeholder="在本网站搜索" aria-label="搜索" autocomplete="off">
                        <button type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main-content">
    <div class="white-wrapper">
        <div class="breadcrumb">
            您目前的位置：
            <a href="first.jsp">首页</a> >
            <span>科室设置</span>
        </div>
        <div class="layout">
            <aside class="sidebar-rect">
                <h3>医院概况</h3>
                <ul class="sidebar-list-rect">
                    <li><a href="introduction.jsp">医院简介</a></li>
                    <li><a href="departmentFront.do" class="active">科室设置</a></li>
                    <li><a href="doctorInfo.do">医生信息</a></li>
                </ul>
            </aside>
            <section class="content">
                <h2>科室设置</h2>
                <table>
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>科室名称</th>
                        <th>科室简介</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="department">
                        <tr>
                            <td>${department.departmentId}</td>
                            <td>${department.departmentName}</td>
                            <td>${department.departmentDescription}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagelist">
                    <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                        <c:choose>
                            <c:when test="${i == pageInfo.pageNum}">
                                <span class="current">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/departmentFront.do?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </section>
        </div>
    </div>
</div>

<div class="side-button-column">
    <a href="registration.jsp" class="side-button text-button" data-text="预约\n挂号" data-index="0">
        <img src="images/hhomeimage/clock.png" alt="预约挂号图标">
    </a>
    <a href="schedule.jsp" class="side-button text-button" data-text="门诊\n出诊" data-index="1">
        <img src="images/hhomeimage/bigc.png" alt="门诊出诊图标">
    </a>
    <a href="departmentFront.do" class="side-button text-button" data-text="科室\n导航" data-index="2">
        <img src="images/hhomeimage/depart.png" alt="科室导航图标">
    </a>
    <div class="side-button icon-button" data-index="3">
        <img src="icon/hhome/wechat.svg" alt="微信">
        <div class="side-button-tooltip">
            <img src="<%=basePath%>images/hhomeimage/wechat-tooltip.jpg" alt="微信二维码">
        </div>
    </div>
    <div class="side-button icon-button" data-index="4">
        <img src="icon/hhome/sinaweibo.svg" alt="微博">
        <div class="side-button-tooltip">
            <img src="<%=basePath%>images/hhomeimage/weibo-tooltip.jpg" alt="微博二维码">
        </div>
    </div>
    <div class="side-button icon-button" data-index="5">
        <img src="icon/hhome/tiktok.svg" alt="抖音">
        <div class="side-button-tooltip">
            <img src="<%=basePath%>images/hhomeimage/douyin-tooltip.jpg" alt="抖音二维码">
        </div>
    </div>
    <div class="side-button top-button" data-index="6" onclick="window.scrollTo({top: 0, behavior: 'smooth'})">
        <img src="images/hhomeimage/fold.png" alt="回到顶部图标">
    </div>
</div>

<footer class="footer">
    版权所有©九斋医院 建设与技术支持:wcb
</footer>

<script>
    document.querySelectorAll('.side-button.text-button').forEach(button => {
        const rawText = button.getAttribute('data-text');
        button.setAttribute('data-text', rawText.replace(/\\n/g, '\n'));
    });
</script>
</body>
</html>