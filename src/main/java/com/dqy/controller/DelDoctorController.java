package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/18 上午12:14
 */

import com.dqy.service.DepartmentsService;
import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.DepartmentsServiceImpl;
import com.dqy.service.Impl.DoctorsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/delDoctor.do")
public class DelDoctorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求中的参数
        Integer doctorId = Integer.parseInt(request.getParameter("doctorId"));
        //调用service中的删除方法
        DoctorsService doctorsService = new DoctorsServiceImpl();
        doctorsService.delDoctor(doctorId);
        //跳转到查询控制器
        response.sendRedirect(request.getContextPath() + "/manager/doctorsSearch.do");
    }
}
