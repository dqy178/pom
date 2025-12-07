package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/8 下午3:56
 */

import com.dqy.pojo.Departments;
import com.dqy.service.DepartmentsService;
import com.dqy.service.Impl.DepartmentsServiceImpl;
import com.github.pagehelper.PageInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/departmentsByFirst.do")//此资源，需要登陆后可访问，因此设置路径时多一级/manager
public class DepartmentsByFirstLevelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收请求中的页码
        Integer pageNum = 1;
        Integer pageSize = 5;
        String page = request.getParameter("page");
        if(page!= null && page.length()>0){
            pageNum = Integer.parseInt(page);
        }
        //调用DepartmentsService中分页查询的方法
        DepartmentsService departmentsService = new DepartmentsServiceImpl();
        PageInfo<Departments>pageInfo = departmentsService.getDepartments(pageNum,pageSize);
        //使用request对象，存储pageInfo的值
        request.setAttribute("pageInfo",pageInfo);
        //页面跳转到科室列表页面
        request.getRequestDispatcher("/manager/departmentList.jsp").forward(request,response);
    }
}
