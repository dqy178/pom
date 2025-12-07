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
  <title>医院简介 - 医院挂号系统</title>
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
      width: 900px;
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
    .content p {
      padding-bottom: 10px;
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
        <a href="AAAA.do">出诊查询</a>
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
      <span>医院简介</span>
    </div>
    <div class="layout">
      <aside class="sidebar-rect">
        <h3>医院概况</h3>
        <ul class="sidebar-list-rect">
          <li><a href="introduction.jsp" class="active">医院简介</a></li>
          <li><a href="departmentFront.do">科室设置</a></li>
          <li><a href="doctorInfo.do">医生信息</a></li>
        </ul>
      </aside>
      <section class="content">
        <h2>医院简介</h2>
        <p>北京科技大学社区卫生服务中心（医院）（简称校医院）地处海淀区学院路30号北京科技大学校园内，隶属于北京科技大学，始建于1954年，由医务室逐步发展为校医院。校医院现址于1989年建成，建筑面积3586㎡，业务用房2000㎡。2018年9月，昌平创新园区医务室建成并投入使用。2019年11月，管庄校区医务室纳入校医院统一管理。</p>
        <p>校医院设有院办、全科（内科、外科）、专科（妇科、眼耳鼻喉科、口腔科）、健康管理科、精神科、心理咨询、中医科（中医、针灸按摩、理疗）、预防保健科、护理部、医技科（放射、检验、B超）、药剂科（中药房、西药房）和财务科，承担着学校3.5万余名师生员工及周边地区居民的预防、医疗、保健、健康教育、康复、计划生育技术指导等“六位一体”的医疗卫生服务任务。</p>
        <p>校医院拥有一支高素质的技术队伍，全院目前职工63人。其中卫生技术人员54人，具备正副高级职称5人，中级职称38人，占79.6%。卫生技术人员的学历均为大专及以上。</p>
        <p>医院拥有多台大型仪器设备。进口数字化X光机、进口彩超、进口全自动生化分析仪、进口全血细胞分析仪、进口全自动尿液分析系统、24小时心电血压动态监测仪、进口电动牙科椅、进口牙科CT、口腔拍片机、耳鼻喉综合治疗台、非接触式眼压仪、数字眼底照相机、腰椎牵引床、短波治疗仪、红光治疗仪，红外线治疗器等。</p>
        <p>校医院是北京市医保定点医疗机构，定点机构名称：北京科技大学社区卫生服务中心，医疗机构代码：08111008。1996年我院被海淀区卫生局批准为一级甲等医院，2002年被定为社区卫生服务中心。2010年通过北京市海淀区中医示范医院评审，成为海淀区4家中医示范中心之一。同年，医院被评为“北京市免疫预防接种门诊A级单位”。2014年9月，由北京大学第三医院（三级甲等）牵头的海淀区中东部医疗卫生联合体正式启动运行，我院作为该医联体的成员之一，得到了北医三院的专科对口帮扶、双向转诊、远程会诊、医学检验、人才培养、信息共享和预约挂号等方面的支持，对于提高医院的业务技术水平具有一定的促进作用。2021年通过了北京市“老年友善医院”和“老年健康服务规范化建设”的创建验收。</p>
        <p>校医院以“规范服务、和谐发展”为理念，以“以人为本、关爱师生、服务社区” 为服务宗旨，以提高医疗卫生服务保障能力为目标，全面提升服务态度、服务质量和服务水平，明确自身定位，做好基本医疗及公共卫生服务，开展在医联体构架下的协同医疗，推进家医服务和健康管理，为学校师生员工和辖区居民的健康做好医疗服务。</p>
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