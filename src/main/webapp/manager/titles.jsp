<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2025/7/9
  Time: 下午4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%
        String contextPath = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    %>
    <base href="<%=basePath%>">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 留言管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/manager/addTitles.jsp"> 添加内容</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="10%">编号</th>
                <th width="15%">职称名称</th>
                <th width="45%">职称描述</th>
                <th >操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="title">
                <tr>
                    <td>${title.id}</td>
                    <td>${title.titleName}</td>
                    <td>${title.description}</td>
                    <td>
                        <div class="button-group">
                            <a type="button" class="button border-main" href="${pageContext.request.contextPath}/manager/titleByNo.do?id=${title.id}"><span class="icon-edit"></span>修改</a>
                            <a class="button border-red" href="javascript:void(0)" onclick="return del(${title.id})"><span class="icon-trash-o"></span>删除</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="8">
                    <div class="pagelist">
                        <span class="current">总记录数${pageInfo.total}</span>
                        <a href="${pageContext.request.contextPath}/manager/titles.do?page=1">首页</a>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                            <c:choose>
                                <c:when test="${i==pageInfo.pageNum}">
                                    <span class="current">${i}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/manager/titles.do?page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <a href="${pageContext.request.contextPath}/manager/titles.do?page=${pageInfo.pages}">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
<script>
    function del(id) {
        if (confirm("确认删除吗？")) {
            window.location.href = "${pageContext.request.contextPath}/manager/delTitle.do?id=" + id;
        }
        return false;
    }
</script>

</body>
</html>