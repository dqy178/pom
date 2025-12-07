package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/15 下午2:14
 */

import com.dqy.pojo.Doctors;
import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.DoctorsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/manager/checkName.do")
public class CheckNameController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobNumber = request.getParameter("jobNumber");
        DoctorsService doctorsService = new DoctorsServiceImpl();
        Doctors doctors = doctorsService.selectDoctor(jobNumber);
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(doctors!= null);
        out.flush();
    }
}
