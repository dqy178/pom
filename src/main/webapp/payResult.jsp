<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付结果</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-lg shadow-lg p-6">
                <div class="text-center">
                    <c:choose>
                        <c:when test="${success}">
                            <div class="text-green-500 mb-4">
                                <svg class="w-16 h-16 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                </svg>
                            </div>
                            <h1 class="text-2xl font-bold text-green-600 mb-4">支付成功！</h1>
                        </c:when>
                        <c:otherwise>
                            <div class="text-red-500 mb-4">
                                <svg class="w-16 h-16 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                </svg>
                            </div>
                            <h1 class="text-2xl font-bold text-red-600 mb-4">支付失败！</h1>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="bg-gray-50 p-4 rounded-md mb-6">
                    <h3 class="text-lg font-semibold mb-2">支付详情：</h3>
                    <div class="bg-white p-4 rounded border">
                        ${result}
                    </div>
                </div>
                
                <div class="flex space-x-4">
                    <a href="${pageContext.request.contextPath}/pay.jsp" 
                       class="flex-1 bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 text-center">
                        重新支付
                    </a>
                    <a href="${pageContext.request.contextPath}/user/userindex.jsp"
                       class="flex-1 bg-gray-300 text-gray-700 py-2 px-4 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 text-center">
                        返回首页
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 