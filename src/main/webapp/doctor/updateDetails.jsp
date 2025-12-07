<%--
  Created by IntelliJ IDEA.
  User: lmh15
  Date: 2024/7/16
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="/css/pintuer.css">
    <link rel="stylesheet" href="/css/admin.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <%--  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>--%>
    <div class="body-content">
        <form method="post" class="form-x" action="/editDocDetails?id=${doctors.doctorId}">

            <div class="form-group">
                <div class="label">
                    <label>医生姓名</label>
                </div>
                <div class="field">
                    <input readonly type="text" value="${doctors.name}" name="name"
                           style=" height:40px; width: 300px"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>电话号码</label>
                </div>
                <div class="field">
                    <input type="text" value="${doctors.phone}" name="phone"
                           style=" height:40px; width: 300px"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>邮箱</label>
                </div>
                <div class="field">
                    <input type="text" value="${doctors.email}" name="email"
                           style=" height:40px; width: 300px"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>入职时间</label>
                </div>
                <div class="field">
                    <input readonly type="text" value="${doctors.entryDate}" name="entry_date"
                           style=" height:40px; width: 300px"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>个人介绍</label>
                </div>
                <div class="field">
                    <textarea name="introduction" style="height:200px; width: 300px">${doctors.introduction}</textarea>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>所在科室</label>
                </div>
                <div class="field">
                    <input readonly type="text" value="${doctors.departments.departmentName}" name="departments"
                           style=" height:40px; width: 300px"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>职称</label>
                </div>
                <div class="field">
                    <input readonly type="text" value="${doctors.titles.titleName}" name="professionalTitles"
                           style=" height:40px; width: 300px"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
