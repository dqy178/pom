<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>就诊记录查询</title>
    <link rel="stylesheet" href="../css/pintuer.css"/>
    <link rel="stylesheet" href="../css/admin.css"/>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong>就诊记录</strong></div>
    <div class="padding border-bottom">
        <form method="get" action="${pageContext.request.contextPath}/manager/consultation.do" class="form-inline">
            <span>日期：</span>
            <input type="date" name="date" value="${date}" class="input"/>
            <span>时段：</span>
            <select name="consultationTime" class="input">
                <option value="">全部</option>
                <option value="上午" <c:if test="${consultationTime=='上午'}">selected</c:if>>上午</option>
                <option value="下午" <c:if test="${consultationTime=='下午'}">selected</c:if>>下午</option>
            </select>
            <span>患者姓名：</span>
            <input type="text" name="pname" value="${pname}" class="input"/>
            <button type="submit" class="button">搜索</button>
        </form>
    </div>
    <table class="table table-hover">
        <tr>
            <th>患者姓名</th>
            <th>患者手机号</th>
            <th>患者凭证号</th>
            <th>就诊时间</th>
            <th>操作</th>
        </tr>
        <c:forEach var="item" items="${pageInfo.list}">
            <tr>
                <td>${item.pname}</td>
                <td>${item.phone}</td>
                <td>${item.idCardNumber}</td>
                <td>${item.consultationTime}</td>
                <td>
                    <a class="button border-blue" href="病历详情地址?id=${item.id}">查看病历</a>
                    <a class="button border-blue" href="住院信息地址?patientId=${item.patientId}">住院信息</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="panel-foot text-center">
        总记录数：${pageInfo.total}
        <c:if test="${pageInfo.pages > 1}">
            <a href="?pageNum=1&date=${date}&consultationTime=${consultationTime}&name=${pname}">首页</a>
            <a href="?pageNum=${pageInfo.prePage}&date=${date}&period=${consultationTime}&name=${pname}">上一页</a>
            <span>${pageInfo.pageNum}</span>
            <a href="?pageNum=${pageInfo.nextPage}&date=${date}&period=${consultationTime}&name=${pname}">下一页</a>
            <a href="?pageNum=${pageInfo.pages}&date=${date}&period=${consultationTime}&name=${pname}">尾页</a>
        </c:if>
    </div>
</div>
</body>
</html>