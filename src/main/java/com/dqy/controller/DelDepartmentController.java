package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/17 下午10:42
 */

import com.dqy.service.DepartmentsService;
import com.dqy.service.Impl.DepartmentsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/delDepartment.do")
public class DelDepartmentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求中的参数
        Integer departmentId = Integer.parseInt(request.getParameter("departmentId"));
        //调用service中的删除方法
        DepartmentsService departmentService = new DepartmentsServiceImpl();
        departmentService.delDepartment(departmentId);
        //跳转到查询控制器
        response.sendRedirect(request.getContextPath() + "/manager/departmentsByFirst.do");
    }
}
