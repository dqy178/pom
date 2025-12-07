<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
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
        /* 更透明的玻璃效果 */
        .glass-effect {
            background: rgba(255, 255, 255, 0.65); /* 降低 Alpha 值增加透明度 */
            backdrop-filter: blur(15px); /* 增加模糊度 */
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .logo {
            position: absolute;
            top: 30px;
            left: 30px;
            width: 350px;
            height: auto;
            z-index: 10;
        }
    </style>
</head>
<body class="bg-gray-200" style="background: url('${pageContext.request.contextPath}/images/backP.jpg') no-repeat center center fixed; background-size: cover;">

<img src="${pageContext.request.contextPath}/images/bk.png" alt="Logo" class="logo">

<!-- 主容器，使用 flex 将内容推到右边 -->
<div class="min-h-screen flex items-center justify-end p-4 sm:p-8 lg:pr-24">
    
    <!-- 注册卡片 -->
    <div class="w-full max-w-lg p-8 sm:p-12 space-y-6 glass-effect rounded-2xl shadow-2xl">
        <div class="text-center">
            <h2 class="text-3xl font-bold text-green-800">创建新账户</h2>
            <p class="mt-2 text-sm text-gray-600">加入我们，开启全新体验</p>
        </div>

        <form method="post" class="space-y-4" action="${pageContext.request.contextPath}/user/register">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700 mb-1">用户名 <span class="text-red-500">*</span></label>
                    <input id="username" type="text" name="username" required placeholder="用作登录名" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">密码 <span class="text-red-500">*</span></label>
                    <input id="password" type="password" name="password" required placeholder="请输入密码" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">真实姓名</label>
                    <input id="name" type="text" name="name" placeholder="请输入真实姓名" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                 <div>
                    <label for="gender" class="block text-sm font-medium text-gray-700 mb-1">性别</label>
                    <select id="gender" name="gender" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <option value="">请选择</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="sm:col-span-2">
                    <label for="idCard" class="block text-sm font-medium text-gray-700 mb-1">身份证号</label>
                    <input id="idCard" type="text" name="idCard" placeholder="请输入身份证号" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                <div>
                    <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">手机号</label>
                    <input id="phone" type="text" name="phone" placeholder="请输入手机号" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">邮箱</label>
                    <input id="email" type="email" name="email" placeholder="请输入邮箱" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                <div class="sm:col-span-2">
                    <label for="address" class="block text-sm font-medium text-gray-700 mb-1">地址</label>
                    <input id="address" type="text" name="address" placeholder="请输入地址" class="w-full px-4 py-2 bg-white/50 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
            </div>

            <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4 pt-4">
                <button type="submit" class="w-full sm:w-auto flex-grow bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-transform transform hover:scale-105">
                    立即注册
                </button>
                <a href="userlogin.jsp" class="w-full sm:w-auto text-center bg-gray-200 text-gray-700 px-6 py-3 rounded-lg font-semibold hover:bg-gray-300 transition-transform transform hover:scale-105">
                    已有账户？去登录
                </a>
            </div>
        </form>

        <!-- 消息提示 -->
        <c:if test="${not empty msg}">
            <div class="p-3 bg-red-100/80 border border-red-400 text-red-700 rounded-lg text-center">
                <c:out value="${msg}"/>
            </div>
        </c:if>
    </div>
</div>

</body>
</html>