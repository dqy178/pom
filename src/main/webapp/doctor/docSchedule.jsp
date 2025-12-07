<%--
  Created by IntelliJ IDEA.
  User: lmh15
  Date: 2024/7/17
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>菜单列表</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="/js/jquery-3.7.1.min.js"></script>
    <script src="/js/jquery-3.7.1.min.js"></script>
    <script src="/js/pintuer.js"></script>

    <script>
        function edit(docId, scheId,isAvailable) {
            window.location.href = '/toEditDoctorSchedule?scheduleId=' + scheId+'&isAvailable='+isAvailable+'&docId='+docId;
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var searchButton = document.getElementById('searchButton');
            var docNameInput = document.querySelector('input[name="name"]');
            var clsInput = document.querySelector('input[name="cls"]');

            searchButton.addEventListener('click', function (event) {
                event.preventDefault(); // 阻止链接默认行为
                var name = encodeURIComponent(docNameInput.value);
                var cls = encodeURIComponent(clsInput.value);
                var queryString = 'name=' + name.trim() + '&cls=' + cls.trim();
                window.location.href = '/mealList?' + queryString;
            });
        });
    </script>


</head>
<body>
<div class="panel admin-panel">
    <table class="table table-hover text-center">
        <tr>
            <td>日期</td>
            <td>时间</td>
            <td>部门id</td>
            <td>是否有空</td>
            <td>预约人数</td>
            <td>总人数</td>
        </tr>
            <c:forEach items="${pageInfo.list}" var="sche" varStatus="vs">
                <c:choose>
                    <c:when test="${vs.index % 2 == 0}">
                        <tr style="background-color: antiquewhite;">
                            <td>${sche.date}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sche.shiftTime == 'morning'}">
                                        早晨
                                    </c:when>
                                    <c:when test="${sche.shiftTime == 'afternoon'}">
                                        下午
                                    </c:when>
                                    <c:otherwise>
                                        ${sche.shiftTime}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${sche.departmentId}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sche.isAvailable == 1}">
                                        有
                                    </c:when>
                                    <c:otherwise>
                                        无
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${sche.visitCount}</td>
                            <td>${sche.sumCount}</td>

                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td>${sche.date}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sche.shiftTime == 'morning'}">
                                        早晨
                                    </c:when>
                                    <c:when test="${sche.shiftTime == 'afternoon'}">
                                        下午
                                    </c:when>
                                    <c:otherwise>
                                        ${sche.shiftTime}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${sche.departmentId}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sche.isAvailable == 1}">
                                        有
                                    </c:when>
                                    <c:otherwise>
                                        无
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${sche.visitCount}</td>
                            <td>${sche.sumCount}</td>

                        </tr>
                    </c:otherwise>
                </c:choose>
            </c:forEach>


            <tr>
            <td colspan="8">
                <div class="pagelist">

                    <c:if test="${pageInfo.isFirstPage}">
                        <a href="javascript:alert('已经是第一页了')">上一页</a>
                    </c:if>

                    <c:if test="${not pageInfo.isFirstPage}">
                        <a href="/schedule?userid=${param.userid}&pageNum=${pageInfo.prePage}">上一页</a>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                        <a href="/schedule?userid=${param.userid}&pageNum=${i}">${i}</a>
                    </c:forEach>


                    <c:if test="${pageInfo.isLastPage}">
                        <a href="javascript:alert('是最后一页了')">下一页</a>
                    </c:if>
                    <c:if test="${not pageInfo.isLastPage}">
                        <a href="/schedule?userid=${param.userid}&pageNum=${pageInfo.nextPage}">下一页</a>
                    </c:if>

                    <a href="/schedule?userid=${param.userid}&pageNum=${pageInfo.pages}">尾页</a>

                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

