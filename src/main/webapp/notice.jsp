<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%
        String contextPath = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>通知公告 - 医院挂号系统</title>
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
            margin-top: 120px;
            width: 100%;
            max-width: 1200px;
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .news-section {
            background-color: #f0f0f0;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
        }
        .news-section h3 {
            margin-top: 0;
            border-bottom: 1px solid #ccc;
            padding-bottom: 8px;
            font-size: 22px;
            color: #5b9e6d;
            flex-shrink: 0;
        }
        .news-content {
            margin-top: 10px;
            overflow-y: auto;
            flex-grow: 1;
            padding-right: 8px;
        }
        .news-item {
            margin: 15px 0;
            line-height: 1.6;
            background-color: white;
            padding: 10px 12px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .news-date {
            display: flex;
            align-items: center;
            font-weight: bold;
            color: #4e8f57;
            margin-bottom: 6px;
            font-size: 16px;
        }
        .clock-icon {
            width: 18px;
            height: 18px;
            margin-right: 6px;
            fill: #5b9e6d;
            flex-shrink: 0;
        }
        .news-content-text {
            font-size: 16px;
            color: #333;
            white-space: normal;
        }
        .news-content-text a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
        .news-content-text a:hover {
            color: #5b9e6d;
            text-decoration: underline;
        }
        .pagelist {
            text-align: center;
            margin-top: 20px;
        }
        .pagelist a, .pagelist span {
            margin: 0 5px;
            text-decoration: none;
            color: #5b9e6d;
            font-size: 16px;
        }
        .pagelist .current {
            color: #333;
            font-weight: bold;
        }
        .pagelist a:hover {
            text-decoration: underline;
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
            z-index: 2000;
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

<div class="container">
    <div class="main-content">
        <div class="news-section">
            <h3>通知公告</h3>
            <div class="news-content">
                <c:forEach items="${pageInfo.list}" var="announcement">
                    <div class="news-item">
                        <div class="news-date">
                            <svg class="clock-icon" viewBox="0 0 24 24">
                                <circle cx="12" cy="12" r="10" stroke="#5b9e6d" stroke-width="2" fill="none"/>
                                <line x1="12" y1="6" x2="12" y2="12" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                                <line x1="12" y1="12" x2="16" y2="14" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                            <fmt:formatDate value="${announcement.creationTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </div>
                        <div class="news-content-text">
                            <a href="noticeDetail.jsp?id=${announcement.announcementId}">${announcement.title}</a>
                            <div>编号: ${announcement.announcementId}</div>
                            <div>创建人: ${announcement.creator}</div>
                            <div>${announcement.content}</div>
                        </div>
                    </div>
                </c:forEach>
                <div class="pagelist">
                    <span class="current">总记录数${pageInfo.total}</span>
                    <a href="${pageContext.request.contextPath}/announcementSearch.do?page=1">首页</a>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                        <c:choose>
                            <c:when test="${i == pageInfo.pageNum}">
                                <span class="current">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/announcementSearch.do?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <a href="${pageContext.request.contextPath}/announcementSearch.do?page=${pageInfo.pages}">尾页</a>
                </div>
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
</div>

<script>
    document.querySelectorAll('.side-button.text-button').forEach(button => {
        const rawText = button.getAttribute('data-text');
        button.setAttribute('data-text', rawText.replace(/\\n/g, '\n'));
    });
    window.addEventListener('DOMContentLoaded', function () {
        const greenBar = document.querySelector('.top-green-bar');
        const navContainer = document.querySelector('.nav-container');
        const mainContent = document.querySelector('.main-content');

        if (greenBar && navContainer && mainContent) {
            const greenBarHeight = greenBar.offsetHeight;
            const navHeight = navContainer.offsetHeight;
            const totalTopHeight = greenBarHeight + navHeight + 20; // 额外留点缓冲

            mainContent.style.marginTop = totalTopHeight + 'px';
        }
    });
</script>
</body>
</html>