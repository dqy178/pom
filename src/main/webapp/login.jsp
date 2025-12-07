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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts: Poppins -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.65);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .logo {
            position: absolute;
            top: 30px;
            left: 30px;
            width: 120px;
            max-width: 30vw;
            height: auto;
            z-index: 10;
        }
    </style>
</head>
<body class="bg-gray-200" style="background: url('${pageContext.request.contextPath}/images/backP.jpg') no-repeat center center fixed; background-size: cover;">
<img src="${pageContext.request.contextPath}/images/bk.png" alt="Logo" class="logo">

<div class="min-h-screen flex items-center justify-end p-4 sm:p-8 lg:pr-24">
    <div class="w-full max-w-md p-8 sm:p-12 space-y-8 glass-effect rounded-2xl shadow-2xl" style="z-index:2;">
        <div class="text-center">
            <h2 class="text-3xl font-bold text-green-800">后台管理中心</h2>
            <p class="mt-2 text-sm text-gray-600">欢迎回来，请登录您的账户</p>
        </div>
        <form method="post" class="space-y-6" action="${pageContext.request.contextPath}/login.do">
            <c:if test="${not empty loginErr}">
                <div class="p-3 bg-red-100/80 border border-red-400 text-red-700 rounded-lg text-center">
                    <c:out value="${loginErr}"/>
                </div>
            </c:if>
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700 mb-1">登录账号</label>
                <input id="name" type="text" name="name" required placeholder="请输入登录账号"
                       value="<c:out value='${param.name}'/>"
                       class="w-full px-4 py-3 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 transition duration-200">
            </div>
            <div class="relative">
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">登录密码</label>
                <input id="password" type="password" name="password" required placeholder="请输入登录密码"
                       class="w-full px-4 py-3 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 transition duration-200">
                <div class="absolute inset-y-0 right-0 top-7 pr-3 flex items-center cursor-pointer" id="togglePassword">
                    <svg id="eyeIcon" class="h-6 w-6 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                    <svg id="eyeSlashIcon" class="h-6 w-6 text-gray-600 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.542-7 1.274-4.057 5.064-7 9.542-7 .847 0 1.673.124 2.468.352M4.75 4.75l14.5 14.5" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                </div>
            </div>
            <div>
                <label for="rid" class="block text-sm font-medium text-gray-700 mb-1">角色</label>
                <select id="rid" name="rid" class="w-full px-4 py-3 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 transition duration-200">
                    <option value="1">管理员</option>
                    <option value="2">医生</option>
                </select>
            </div>
            <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 pt-2">
                <button type="submit"
                        class="w-full sm:w-auto flex-grow bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-transform transform hover:scale-105">
                    立即登录
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');
    const eyeIcon = document.getElementById('eyeIcon');
    const eyeSlashIcon = document.getElementById('eyeSlashIcon');

    togglePassword.addEventListener('click', function () {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        eyeIcon.classList.toggle('hidden');
        eyeSlashIcon.classList.toggle('hidden');
    });
</script>

</body>
</html>