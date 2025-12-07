<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息管理</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- 引入Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- 自定义绿色主题 -->
    <style>
        .sidebar { width: 250px; height: 100vh; position: fixed; top: 0; left: 0; overflow-y: auto; transition: all 0.3s; }
        .main-content { margin-left: 250px; min-height: 100vh; padding: 2rem; }
        @media (max-width: 768px) { .sidebar { width: 200px; } .main-content { margin-left: 200px; } }
        @media (max-width: 640px) { .sidebar { width: 100%; height: auto; position: relative; } .main-content { margin-left: 0; padding: 1rem; } }
        :root {
            --bs-primary: #006400;
        }
        .bg-primary, .btn-primary, .table-primary, .active {
            background-color: #006400 !important;
            border-color: #006400 !important;
        }
        .text-primary {
            color: #006400 !important;
        }
        .btn-primary {
            color: #fff !important;
        }
        .sidebar .nav-link.active {
            background-color: #006400 !important;
            color: #fff !important;
        }
    </style>
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 2rem;
        }
        .glass-card {
            background: rgba(255,255,255,0.65);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 1.2rem;
            box-shadow: 0 4px 24px rgba(0,100,0,0.10);
            border: 1.5px solid #e0f2e9;
        }
        .form-label {
            color: #006400;
            font-weight: 600;
        }
        .form-control, .form-select {
            background: rgba(255,255,255,0.85);
            border: 1.5px solid #b6e2c1;
            border-radius: 0.5rem;
            box-shadow: none;
            transition: border-color 0.2s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #006400;
            box-shadow: 0 0 0 2px rgba(0,100,0,0.10);
        }
        .btn-primary, .btn-green {
            background: linear-gradient(135deg, #006400, #43a047);
            color: #fff !important;
            border: none;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(0,100,0,0.08);
            transition: background 0.2s, transform 0.2s;
        }
        .btn-primary:hover, .btn-green:hover {
            background: linear-gradient(135deg, #014d01, #388e3c);
            color: #111 !important;
            transform: scale(1.04);
        }
        .btn-gray {
            background: #f3f4f6;
            color: #333;
            border: none;
        }
        .btn-gray:hover {
            background: #e0e0e0;
            color: #111;
        }
    </style>
    <!-- 引入Bootstrap JS（可选） -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<c:if test="${empty sessionScope.user}">
    <c:redirect url="/userlogin.jsp"/>
</c:if>
<jsp:include page="sidebar.jsp"/>
<div class="main-content">
    <div class="max-w-2xl mx-auto glass-card p-6">
        <h2 class="text-2xl fw-bold mb-6" style="color:#006400">个人信息管理</h2>
        <form method="post" action="${pageContext.request.contextPath}/user/profileUpdate">
            <input type="hidden" name="id" value="${sessionScope.user.id}" />
            <input type="hidden" name="avatar" value="${sessionScope.user.avatar}" />
            <div class="text-center mb-4">
                <c:choose>
                    <c:when test="${not empty sessionScope.user.avatar}">
                        <img id="avatar" src="${sessionScope.user.avatar}" style="width:120px;height:120px;border-radius:50%;border:2px solid #eee;object-fit:cover;box-shadow:0 4px 12px rgba(0,0,0,0.15);" title="用户头像" />
                    </c:when>
                    <c:otherwise>
                        <img id="avatar" src="${pageContext.request.contextPath}/upload/default.jpg" style="width:120px;height:120px;border-radius:50%;border:2px solid #eee;object-fit:cover;box-shadow:0 4px 12px rgba(0,0,0,0.15);" title="用户头像" />
                    </c:otherwise>
                </c:choose>
                <div class="mt-3">
                    <label class="btn-green px-4 py-2 rounded cursor-pointer">
                        更换头像
                        <input type="file" id="avatarInput" name="imageFile" accept="image/*" style="display:none;" />
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">用户名：</label>
                <input type="text" class="form-control" name="username" value="${sessionScope.user.username}" readonly />
            </div>
            <div class="mb-3">
                <label class="form-label">真实姓名：</label>
                <input type="text" class="form-control" name="name" value="${sessionScope.user.name}" />
            </div>
            <div class="mb-3">
                <label class="form-label">性别：</label>
                <input type="text" class="form-control" name="gender" value="${sessionScope.user.gender}" />
            </div>
            <div class="mb-3">
                <label class="form-label">身份证号：</label>
                <input type="text" class="form-control" name="idCard" value="${sessionScope.user.idCard}" />
            </div>
            <div class="mb-3">
                <label class="form-label">手机号：</label>
                <input type="text" class="form-control" name="phone" value="${sessionScope.user.phone}" />
            </div>
            <div class="mb-3">
                <label class="form-label">邮箱：</label>
                <input type="email" class="form-control" name="email" value="${sessionScope.user.email}" />
            </div>
            <div class="mb-3">
                <label class="form-label">地址：</label>
                <input type="text" class="form-control" name="address" value="${sessionScope.user.address}" />
            </div>
            <div class="d-flex gap-3 align-items-center mt-4">
                <button class="btn-green px-4 py-2 rounded" type="submit">保存修改</button>
                <a href="userindex.jsp" class="btn-gray px-4 py-2 rounded">返回首页</a>
            </div>
            <c:if test="${not empty msg}">
                <div class="text-success mt-3">${msg}</div>
            </c:if>
        </form>
    </div>
</div>
<!-- 头像上传JS（异步上传+预览） -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}";
    $('#avatarInput').change(function() {
        if (!this.files || this.files.length === 0) return;
        var formData = new FormData();
        formData.append("imageFile", this.files[0]);
        $.ajax({
            url: ctx + "/uploadImage",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(res) {
                if(res.includes("/upload/")) {
                    // 头像预览
                    $('#avatar').attr('src', res + "?t=" + new Date().getTime());
                    // 更新隐藏域
                    $('input[name=avatar]').val(res);
                    // 可选：通知后端更新session头像
                    $.post(ctx + "/user/updateAvatar", {avatar: res});
                } else {
                    alert(res);
                }
            },
            error: function() {
                alert("上传失败，请重试！");
            }
        });
    });
</script>
</body>
</html>