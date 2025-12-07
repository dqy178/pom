<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>排班管理</title>
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <style>
        .main-content {margin-left:180px;}
        .sub-dep {margin-left:15px;display:none;} /* 默认折叠二级科室 */
        .list-group li {position:relative;}
        .date-bar {margin-bottom:15px;margin-left: 30px}
        .date-bar a {margin-right:8px;}
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .leftnav{margin-top: -70px;}
        .bg-main{margin-left: 30px;}
    </style>
</head>
<body>
<div class="leftnav" >
    <div class="leftnav-title"><strong><span class="icon-list"></span>排班管理</strong></div>
            <c:forEach items="${departmentsList}" var="dep1">
                <h2><span class="icon-user"></span>${dep1.departmentName}</h2>
                <c:if test="${not empty dep1.childList}">
                    <ul class="sub-dep"
                            <c:forEach items="${dep1.childList}" var="dep2">
                                <c:if test="${selectedDepartmentId==dep2.departmentId}">
                                    style="display:block"
                                </c:if>
                            </c:forEach>
                    >
                        <c:forEach items="${dep1.childList}" var="dep2">
                            <li>
                                <a href="?departmentId=${dep2.departmentId}&date=${selectedDate}" class="${selectedDepartmentId==dep2.departmentId?'dep-active':''}"><span class="icon-caret-right"></span>${dep2.departmentName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </c:forEach>
</div>

<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<div class="main-content">
    <div class="panel admin-panel">
        <div class="body-content">
            <div class="date-bar">
                <c:forEach items="${dateList}" var="d">
                    <a href="?departmentId=${selectedDepartmentId}&date=${d}" class="${selectedDate==d?'active-date':'button'}">
                            ${d}
                    </a>
                </c:forEach>
            </div>
            <a href="${pageContext.request.contextPath}/manager/schedule.do?action=add" class="button bg-main icon-plus">添加排班</a>
            <table class="table table-hover">
                <tr>
                    <th>医生姓名</th>
                    <th>日期</th>
                    <th>时间</th>
                    <th>预约总数</th>
                    <th>剩余号</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="s">
                    <tr>
                        <td>${s.doctorName}</td>
                        <td><fmt:formatDate value="${s.date}" pattern="yyyy-MM-dd"/></td>
                        <td>${s.shiftTime}</td>
                        <td>${s.sumCount}</td>
                        <td>${s.sumCount - s.visitCount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${s.scheduleId != null}">
                                    <a href="${pageContext.request.contextPath}/manager/schedule.do?action=edit&scheduleId=${s.scheduleId}" class="button border-main">修改</a>
                                    <a href="${pageContext.request.contextPath}/manager/schedule.do?action=delete&scheduleId=${s.scheduleId}" class="button border-red" onclick="return confirm('确定要取消吗？')">取消</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/manager/schedule.do?action=add
                &doctorId=${s.doctorId}
                &departmentId=${s.departmentId}
                &date=<fmt:formatDate value='${s.date}' pattern='yyyy-MM-dd'/>
                &shiftTime=${s.shiftTime}" class="button border-main">排班</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="panel-foot text-center">
                总记录数：<span style="color:#fff;background:#09c;padding:2px 8px;border-radius:4px;">${pageInfo.total}</span>
                <c:if test="${pageInfo.pages > 1}">
                    <a href="?page=1&departmentId=${selectedDepartmentId}&date=${selectedDate}" class="button" style="${pageInfo.pageNum == 1 ? 'pointer-events:none;opacity:0.5;' : ''}">首页</a>
                    <a href="?page=${pageInfo.pageNum - 1}&departmentId=${selectedDepartmentId}&date=${selectedDate}" class="button" style="${pageInfo.pageNum == 1 ? 'pointer-events:none;opacity:0.5;' : ''}">上一页</a>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                        <a href="?page=${i}&departmentId=${selectedDepartmentId}&date=${selectedDate}" class="button ${pageInfo.pageNum == i ? 'bg-main' : ''}">${i}</a>
                    </c:forEach>
                    <a href="?page=${pageInfo.pageNum + 1}&departmentId=${selectedDepartmentId}&date=${selectedDate}" class="button" style="${pageInfo.pageNum == pageInfo.pages ? 'pointer-events:none;opacity:0.5;' : ''}">下一页</a>
                    <a href="?page=${pageInfo.pages}&departmentId=${selectedDepartmentId}&date=${selectedDate}" class="button" style="${pageInfo.pageNum == pageInfo.pages ? 'pointer-events:none;opacity:0.5;' : ''}">尾页</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>