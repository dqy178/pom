package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/9 下午4:12
 */

import com.dqy.pojo.Doctors;
import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.DoctorsServiceImpl;
import com.dqy.vo.DoctorSearchVo;
import com.github.pagehelper.PageInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/doctorsSearch.do")
public class DoctorsSearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收页码
        Integer pageSize = 5;
        Integer pageNum = 1;
        String page = request.getParameter("page");
        if (page!= null&&page.length()>0) {
            pageNum = Integer.parseInt(page);
        }
        //接收查询条件
        //科室
        Integer departmentId = null;
        String strDepartmentId = request.getParameter("departmentId");
        if (strDepartmentId!= null&&strDepartmentId.length()>0) {
            departmentId = Integer.parseInt(strDepartmentId);
        }
        //职称
        Integer titleId = null;
        String strTitleId = request.getParameter("titleId");
        if (strTitleId!= null&&strTitleId.length()>0) {
            titleId = Integer.parseInt(strTitleId);
        }
        //职工号
        String jobNumber = request.getParameter("jobNumber");
        //姓名
        String doctorName = request.getParameter("doctorName");
        DoctorSearchVo searchVo = new DoctorSearchVo(departmentId, titleId, doctorName, jobNumber);
        //创建service对象，并调用查询方法
        DoctorsService doctorsService = new DoctorsServiceImpl();
        PageInfo<Doctors> pageInfo = doctorsService.getDoctorsByPageAndSearch(searchVo, pageNum, pageSize);
        //使用request存储查询结果
        request.setAttribute("pageInfo", pageInfo);
        //转到显示所有医生页面
        request.getRequestDispatcher("/manager/doctorList.jsp").forward(request, response);
    }
}
