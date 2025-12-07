<%--
  Created by IntelliJ IDEA.
  User: lmh15
  Date: 2024/7/15
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%
    // 获取username属性值
    String userid = (String) request.getAttribute("userid");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>密码修改</title>
    <link rel="stylesheet" href="/css/pintuer.css">
    <link rel="stylesheet" href="/css/admin.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/pintuer.js"></script>

    <script>
        function validatePasswords() {
            var pass1 = document.getElementById("passfirst").value;
            var pass2 = document.getElementById("passsecond").value;

            if (pass1 !== pass2) {
                alert("两次输入的密码不一致，请重新输入。");
                return false; // 阻止表单提交
            }
            return true; // 允许表单提交
        }
    </script>

</head>
<body>
<div class="panel admin-panel">
    <%--  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>--%>
    <div class="body-content">
        <form method="post" class="form-x" action="/editDocPasswd?userid=<%= userid %>" onsubmit="return validatePasswords()">
            <div class="form-group">
                <div class="label">
                    <label>请输入新密码</label>
                </div>
                <div class="field">
                    <input type="password" id="passfirst" name="passfirst" style="height: 40px; width: 300px" required />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>请再次输入新密码</label>
                </div>
                <div class="field">
                    <input type="password" id="passsecond" name="passsecond" style="height: 40px; width: 300px" required />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>