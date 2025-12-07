package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/17 下午8:19
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/logout.do")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 清除session
        request.getSession().invalidate();
        // 跳转到登录页面
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
