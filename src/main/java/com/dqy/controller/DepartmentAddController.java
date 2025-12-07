package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/9 上午10:44
 */

import com.dqy.pojo.Departments;
import com.dqy.service.DepartmentsService;
import com.dqy.service.Impl.DepartmentsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/addDepartment.do")
public class DepartmentAddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收请求中科室的信息
        String departmentName = request.getParameter("departmentName");
        Integer departmentPid = Integer.parseInt(request.getParameter("departmentPid"));
        Integer departmentLevel = Integer.parseInt(request.getParameter("departmentLevel"));
        String departmentDescription = request.getParameter("departmentDescription");
        //把数据封装到Departments对象中
        Departments departments = new Departments();
        departments.setDepartmentName(departmentName);
        departments.setDepartmentPid(departmentPid);
        departments.setDepartmentLevel(departmentLevel);
        departments.setDepartmentDescription(departmentDescription);
        //调用service中的添加方法
        DepartmentsService departmentsService = new DepartmentsServiceImpl();
        departmentsService.addDepartment(departments);
        //跳转到查寻科室的控制器
        response.sendRedirect(request.getContextPath() + "/manager/departmentsByFirst.do");
    }
}
