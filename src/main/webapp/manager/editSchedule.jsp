<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>编辑排班</title>
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
<div class="panel admin-panel" style="max-width:600px;margin:30px auto;">
    <div class="panel-head"><strong>编辑排班</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/manager/schedule.do?action=update">
            <input type="hidden" name="scheduleId" value="${schedule.scheduleId}" />
            <div class="form-group">
                <div class="label"><label>科室：</label></div>
                <div class="field">
                    <select name="departmentId" class="input" required>
                        <option value="">请选择科室</option>
                        <c:forEach items="${departmentsList}" var="dep1">
                            <option value="${dep1.departmentId}" ${schedule.departmentId==dep1.departmentId?'selected':''}>${dep1.departmentName}</option>
                            <c:forEach items="${dep1.childList}" var="dep2">
                                <option value="${dep2.departmentId}" ${schedule.departmentId==dep2.departmentId?'selected':''}>&nbsp;&nbsp;${dep2.departmentName}</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>医生：</label></div>
                <div class="field">
                    <select name="doctorId" class="input" required>
                        <option value="">请选择医生</option>
                        <c:forEach items="${doctorsList}" var="doc">
                            <option value="${doc.doctorId}" ${schedule.doctorId==doc.doctorId?'selected':''}>${doc.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>日期：</label></div>
                <div class="field">
                    <input type="date" class="input" name="date" value="<fmt:formatDate value='${schedule.date}' pattern='yyyy-MM-dd'/>" required />
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>时间段：</label></div>
                <div class="field">
                    <select name="shiftTime" class="input" required>
                        <option value="上午" ${schedule.shiftTime=='上午'?'selected':''}>上午</option>
                        <option value="下午" ${schedule.shiftTime=='下午'?'selected':''}>下午</option>
                        <option value="晚上" ${schedule.shiftTime=='晚上'?'selected':''}>晚上</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>总号源：</label></div>
                <div class="field"><input type="number" class="input" name="sumCount" value="${schedule.sumCount}" required /></div>
            </div>
            <div class="form-group">
                <div class="label"><label>已挂号数：</label></div>
                <div class="field"><input type="number" class="input" name="visitCount" value="${schedule.visitCount}" required /></div>
            </div>
            <div class="form-group">
                <div class="label"><label>是否可用：</label></div>
                <div class="field">
                    <select name="isAvailable" class="input">
                        <option value="1" ${schedule.isAvailable==1?'selected':''}>可用</option>
                        <option value="0" ${schedule.isAvailable==0?'selected':''}>不可用</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>备注：</label></div>
                <div class="field"><input type="text" class="input" name="remarks" value="${schedule.remarks}" /></div>
            </div>
            <div class="form-group">
                <div class="label"></div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">保存</button>
                    <a href="${pageContext.request.contextPath}/manager/schedule.do?action=list" class="button">返回</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>