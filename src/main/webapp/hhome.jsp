<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <%
        String contextPath = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('images/hhomeimage/hospital-bkg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .logo {
            position: absolute;
            top: 30px;
            left: 30px;
            width: 350px;
            height: auto;
        }
        .top-right-icons {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 10px;
        }
        .icon {
            width: 36px;
            height: 36px;
            cursor: pointer;
            position: relative;
            transition: transform 0.3s ease;
        }
        .icon:hover {
            transform: scale(1.1);
        }
        .icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            filter: brightness(0) invert(1); /* Makes the SVG icons white */
        }
        .tiktok-icon .tooltip {
            left: auto;
            right: -20px;  /* 控制左移的程度 */
            transform: none;
        }


        .book-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100px;
            height: 36px;
            background: rgba(0, 128, 255, 0.85);
            color: white;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            border-radius: 18px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .book-icon:hover {
            background: rgba(0, 100, 200, 1);
            transform: scale(1.1);
        }
        .tooltip {
            display: none;
            position: absolute;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: auto;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 5px;
            z-index: 10;
        }
        .icon:hover .tooltip {
            display: block;
        }
        .tooltip img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .tooltip img {
            filter: none !important;
        }

        /* 定位 */
        .block1 { position: absolute; top: 360px; left: 300px; }
        .block2 { position: absolute; top: 405px; left: 490px; }
        .block3 { position: absolute; top: 335px; left: 680px; }
        .block4 { position: absolute; top: 375px; left: 870px; }
        .block5 { position: absolute; top: 425px; left: 1060px; }
        .block6 { position: absolute; top: 405px; left: 1250px; }

        /* block 基础样式 */
        .block {
            position: absolute;
            width: 230px;
            height: 240px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            cursor: pointer;
            border-radius: 10px;
            font-weight: bold;
            font-size: 26px;
            color: inherit;
            font-family: "等线", "Microsoft YaHei", Arial, sans-serif;
            z-index: 1;
            transition: z-index 0.1s ease;
        }
        .block:hover {
            z-index: 10;
        }

        /* 背景色 */
        .block1 { background-color: rgba(120, 199, 210, 0.85); }
        .block2 { background-color: rgba(222, 184, 135, 0.85); }
        .block3 { background-color: rgba(100, 120, 240, 0.85); }
        .block4 { background-color: rgba(0, 128, 0, 0.85); }
        .block5 { background-color: rgba(255, 255, 255, 0.85); }
        .block6 { background-color: rgba(216, 191, 216, 0.85); }

        /* 文字颜色白色 */
        .block1, .block2, .block3, .block4, .block6 {
            color: white !important;
        }

        /* 图标和文字放大动画 */
        .block img,
        .block .compass-icon,
        .block span.main-text {
            transition: transform 0.3s ease;
        }
        .block:hover img,
        .block:hover .compass-icon,
        .block:hover span.main-text {
            transform: scale(1.2);
        }

        /* block 内图标尺寸和间距 */
        .block img {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }

        /* 指南针图标 */
        .compass-icon {
            width: 80px;
            height: 80px;
            position: relative;
            border: 3px solid white;
            border-radius: 50%;
            box-sizing: border-box;
            margin-bottom: 10px;
            background: transparent;
        }
        .compass-icon::before,
        .compass-icon::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            background: white;
            transform-origin: center;
            border-radius: 2px;
        }
        .compass-icon::before {
            width: 8px;
            height: 30px;
            transform: translate(-50%, -100%) rotate(-30deg);
            clip-path: polygon(50% 0%, 100% 100%, 0% 100%);
        }
        .compass-icon::after {
            width: 8px;
            height: 30px;
            transform: translate(-50%, 0) rotate(150deg);
            clip-path: polygon(50% 0%, 100% 100%, 0% 100%);
            opacity: 0.6;
        }

        /* 点击进入文本样式 */
        .enter-text {
            display: inline-block;
            margin-top: 16px;
            padding: 6px 24px;
            border-radius: 9999px;
            border: none;
            font-size: 14px;
            font-weight: normal;
            cursor: pointer;
            user-select: none;
            color: white;
            background-color: rgba(0,0,0,0.5);
            transition: background-color 0.3s ease;
        }

        /* 不透明背景色覆盖 */
        .block1 .enter-text {
            background-color: rgba(120, 210, 210, 1);
        }
        .block2 .enter-text {
            background-color: rgba(230, 184, 135, 1);
        }
        .block3 .enter-text {
            background-color: rgba(100, 120, 250, 1);
        }
        .block4 .enter-text {
            background-color: rgba(0, 110, 0, 1);
        }
        .block5 .enter-text {
            background-color: rgba(255, 255, 255, 1);
            color: black;
        }
        .block6 .enter-text {
            background-color: rgba(225, 191, 216, 1);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .top-right-icons {
                top: 10px;
                right: 10px;
                flex-direction: column;
                align-items: flex-end;
                gap: 10px;
            }
            .book-icon {
                width: 80px;
                font-size: 12px;
            }
            .icon {
                width: 30px;
                height: 30px;
            }
            .tooltip {
                width: 80px;
                top: 40px;
            }
        }
    </style>
</head>
<body>
<img src="images/hhomeimage/hospital-logo.png" alt="Logo" class="logo">
<div class="top-right-icons">
    <a href="first.jsp" class="book-icon">预约挂号</a>
    <div class="icon">
        <img src="icon/hhome/wechat.svg" alt="微信">
        <div class="tooltip"><img src="<%=basePath%>images/hhomeimage/wechat-tooltip.jpg" alt="WeChat Tooltip">
        </div>
    </div>
    <div class="icon">
        <img src="icon/hhome/sinaweibo.svg" alt="微博">
        <div class="tooltip"><img src="<%=basePath%>images/hhomeimage/weibo-tooltip.jpg" alt="Weibo Tooltip"></div>
    </div>
    <div class="icon tiktok-icon">
        <img src="icon/hhome/tiktok.svg" alt="抖音">
        <div class="tooltip"><img src="<%=basePath%>images/hhomeimage/douyin-tooltip.jpg" alt="Douyin Tooltip"></div>
    </div>

</div>

<div class="blocks">
    <div class="block block1" onclick="window.location.href='first.jsp'">
        <img src="images/hhomeimage/suf.png" alt="Patient Icon">
        <span class="main-text">患者版</span>
        <span class="enter-text">点击进入</span>
    </div>
    <div class="block block2" onclick="window.location.href='https://www.ustb.edu.cn/'">
        <img src="images/hhomeimage/sem.png" alt="Academic Icon">
        <span class="main-text">学术版</span>
        <span class="enter-text">点击进入</span>
    </div>
    <div class="block block3" onclick="window.location.href='block3.jsp'">
        <div class="compass-icon"></div>
        <span class="main-text">就医指南</span>
        <span class="enter-text">点击进入</span>
    </div>
    <div class="block block4" onclick="window.location.href='englishFirst.jsp'">
        <img src="images/hhomeimage/en.png" alt="English Icon">
        <span class="main-text">English</span>
        <span class="enter-text">ENTER</span>
    </div>
    <div class="block block5" onclick="window.location.href='login.jsp'">
        <img src="images/hhomeimage/stuf.png" alt="Staff Icon">
        <span class="main-text">员工版</span>
        <span class="enter-text">点击进入</span>
    </div>
    <div class="block block6" onclick="window.location.href='.introductionjsp'">
        <img src="images/hhomeimage/intn.png" alt="About Icon">
        <span class="main-text">关于我们</span>
        <span class="enter-text">点击进入</span>
    </div>
</div>
</body>
</html>