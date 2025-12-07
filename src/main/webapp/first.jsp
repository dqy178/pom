<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%
        String contextPath = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>医院挂号系统</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            background-image: none;
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
            max-width: 100%; /* 原为1200px，现在允许占满整个屏幕宽度 */
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
            justify-content: flex-start;  /* 左对齐所有元素 */
            align-items: center;
            flex-wrap: wrap; /* 宽度不足时允许换行 */
        }

        .top-bar .logo {
            flex-shrink: 0; /* logo 不被压缩 */
            height: 80px;
            width: auto;
            margin-left: 120px;
            margin-right: 40px; /* 留一点右间距就好 */
        }

        .nav-left {
            display: flex;
            flex-wrap: wrap;
            gap: 30px; /* 导航项之间间距 */
            flex: 1; /* 占据剩余空间 */
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
        .image-section.full-width {
            width: 100vw;
            margin: 0;
            padding: 0;
            position: relative;
            overflow: hidden;
        }
        .main-content {
            margin-top: 160px;
        }
        .image-section.full-width {
            margin-top: 120px;
        }
        .quick-links {
            margin-top: 40px;
        }

        .carousel {
            position: relative;
            width: 100%;
        }
        .carousel-item {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            display: none;
        }
        .carousel-item.active {
            display: block;
            position: relative;
        }
        .carousel-image {
            width: 100%;
            height: auto;
            display: block;
        }
        .caption {
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: auto;        /* 取消100%宽度，改为自适应内容 */
            padding: 0;         /* 去掉padding */
            background-color: transparent;  /* 背景透明 */
            display: flex;
            justify-content: center;  /* 居中dots */
            align-items: center;
            box-sizing: border-box;
        }

        .dots {
            gap: 20px;
            display: flex;
            justify-content: center;
            padding: 10px 0;  /* 适当给上下留空隙 */
        }

        .dot {
            width: 90px;
            height: 6px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 2px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .dot.active {
            background-color: white;
        }
        .carousel-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: #5b9e6d;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            color: white;
            font-size: 28px;
            font-weight: bold;
            line-height: 40px;
            text-align: center;
            cursor: pointer;
            user-select: none;
            opacity: 0.7;
            transition: opacity 0.3s;
            z-index: 10;
            padding: 0;
        }
        .carousel-button:hover {
            opacity: 1;
        }
        .carousel-button.prev {
            left: 10px;
        }
        .carousel-button.next {
            right: 10px;
        }
        .main-content {
            display: flex;
            justify-content: space-between;
            align-items: stretch;
            width: 100%;
            max-width: 1200px;
            margin: 30px auto;
            gap: 20px;
            flex-wrap: wrap;
        }
        .news-section {
            flex: 1 1 48%;
            max-width: 48%;
            background-color: #f0f0f0;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
        }
        .news-section,
        .notice-section {
            flex: 1 1 48%;
            max-width: 48%;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }


        .news-section h3 {
            margin-top: 0;
            border-bottom: 1px solid #ccc;
            padding-bottom: 8px;
            font-size: 22px;
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
        .quick-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }
        .quick-button {
            background-color: white;
            color: #5b9e6d;
            border: 2px solid #ccc;
            padding: 14px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 0;
            cursor: pointer;
            width: 172px;
            height: 40px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
        }
        .quick-button:hover {
            background-color: #f0f0f0;
            transform: scale(1.03);
        }
        .quick-button .icon {
            font-size: 24px;
            width: 26px;
            text-align: center;
        }
        .footer {
            background-color: rgb(0, 100, 0);
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
                <a href="schedule.jsp">出诊查询</a>
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

<div class="image-section full-width">
    <div class="carousel">
        <div class="carousel-item active">
            <img src="images/one.jpg" alt="医院活动图片1" class="carousel-image">
        </div>
        <div class="carousel-item">
            <img src="images/two.png" alt="医院活动图片2" class="carousel-image">
        </div>
        <div class="carousel-item">
            <img src="images/three.png" alt="医院活动图片3" class="carousel-image">
        </div>
        <div class="caption">
            <div class="dots">
                <div class="dot active" data-index="0"></div>
                <div class="dot" data-index="1"></div>
                <div class="dot" data-index="2"></div>
            </div>
        </div>
        <button class="carousel-button prev" aria-label="上一张"><</button>
        <button class="carousel-button next" aria-label="下一张">></button>
    </div>
</div>

<div class="main-content">
    <div class="news-section">
        <h3>新闻动态</h3>
        <div class="news-content">
            <div class="news-item">
                <div class="news-date">
                    <svg class="clock-icon" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10" stroke="#5b9e6d" stroke-width="2" fill="none"/>
                        <line x1="12" y1="6" x2="12" y2="12" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                        <line x1="12" y1="12" x2="16" y2="14" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                    2025-05-12
                </div>
                <div class="news-content-text">医院开展健康讲座</div>
            </div>
            <div class="news-item">
                <div class="news-date">
                    <svg class="clock-icon" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10" stroke="#5b9e6d" stroke-width="2" fill="none"/>
                        <line x1="12" y1="6" x2="12" y2="12" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                        <line x1="12" y1="12" x2="16" y2="14" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                    2024-10-12
                </div>
                <div class="news-content-text">医院开展义诊活动</div>
            </div>
            <div class="news-item">
                <div class="news-date">
                    <svg class="clock-icon" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10" stroke="#5b9e6d" stroke-width="2" fill="none"/>
                        <line x1="12" y1="6" x2="12" y2="12" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                        <line x1="12" y1="12" x2="16" y2="14" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                    2024-04-20
                </div>
                <div class="news-content-text">医院新增设备</div>
            </div>
        </div>
    </div>

    <div class="notice-section">
        <h3>公告栏</h3>
        <div class="news-content">
            <div class="news-item">
                <div class="news-date">
                    <svg class="clock-icon" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10" stroke="#5b9e6d" stroke-width="2" fill="none"/>
                        <line x1="12" y1="6" x2="12" y2="12" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                        <line x1="12" y1="12" x2="16" y2="14" stroke="#5b9e6d" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                    2025-07-01
                </div>
                <div class="news-content-text">新系统即将上线，敬请期待！</div>
            </div>
        </div>
    </div>
</div>

<div class="quick-links">
    <a href="schedule.jsp" class="quick-button">
        <i class="fas fa-calendar-alt icon"></i> 门诊预排班
    </a>
    <a href="schedule.jsp" class="quick-button">
        <i class="fas fa-file-alt icon"></i> 出诊查询
    </a>
    <a href="departmentFront.do" class="quick-button">
        <i class="fas fa-folder-open icon"></i> 科室设置
    </a>
    <a href="info.jsp" class="quick-button">
        <i class="fas fa-compass icon"></i> 就医指南
    </a>
    <a href="doctorInfo.do" class="quick-button">
        <i class="fas fa-user-md icon"></i> 医生信息
    </a>
</div>

<div class="side-button-column">
    <a href="register.jsp" class="side-button text-button" data-text="预约\n挂号" data-index="0">
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
    const items = document.querySelectorAll('.carousel-item');
    const prevBtn = document.querySelector('.carousel-button.prev');
    const nextBtn = document.querySelector('.carousel-button.next');
    const dots = document.querySelectorAll('.dot');
    let currentIndex = 0;
    const totalItems = items.length;
    function showItem(index) {
        items.forEach((item, i) => item.classList.toggle('active', i === index));
        dots.forEach((dot, i) => dot.classList.toggle('active', i === index));
        currentIndex = index;
    }
    function nextItem() {
        showItem((currentIndex + 1) % totalItems);
    }
    function prevItem() {
        showItem((currentIndex - 1 + totalItems) % totalItems);
    }
    showItem(currentIndex);
    let interval = setInterval(nextItem, 3000);
    prevBtn.addEventListener('click', () => {
        clearInterval(interval);
        prevItem();
        interval = setInterval(nextItem, 3000);
    });
    nextBtn.addEventListener('click', () => {
        clearInterval(interval);
        nextItem();
        interval = setInterval(nextItem, 3000);
    });
    dots.forEach(dot => {
        dot.addEventListener('click', () => {
            clearInterval(interval);
            const index = parseInt(dot.getAttribute('data-index'));
            showItem(index);
            interval = setInterval(nextItem, 3000);
        });
    });
    document.querySelectorAll('.side-button.text-button').forEach(button => {
        const rawText = button.getAttribute('data-text');
        button.setAttribute('data-text', rawText.replace(/\\n/g, '\n'));
    });
</script>
</body>
</html>