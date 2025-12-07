<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付宝支付</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h1 class="text-2xl font-bold text-center mb-6">支付宝支付</h1>
                
                <c:if test="${not empty error}">
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                        ${error}
                    </div>
                </c:if>
                
                <!-- 支付表单 -->
                <form action="${pageContext.request.contextPath}/alipay" method="post" class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">订单类型：</label>
                        <select name="orderType" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                            <option value="PRESCRIPTION">处方</option>
                            <option value="HOSPITALIZATION">住院</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">订单ID：</label>
                        <input type="text" name="orderId" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                    </div>
                    <div class="flex space-x-4">
                        <button type="submit" class="flex-1 bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            立即支付
                        </button>
                        <a href="${pageContext.request.contextPath}/user/userindex.jsp"
                           class="flex-1 bg-gray-300 text-gray-700 py-2 px-4 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 text-center">
                            返回首页
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html> 