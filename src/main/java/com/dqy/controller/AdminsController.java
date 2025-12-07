package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/8 上午11:06
 */

import com.dqy.pojo.Admins;
import com.dqy.pojo.Doctors;
import com.dqy.service.AdminsService;
import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.AdminsServiceImpl;
import com.dqy.service.Impl.DoctorsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/login.do")
public class AdminsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求编码格式
        request.setCharacterEncoding("UTF-8");
        //接收请求中的相关数据
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        Integer rid = Integer.parseInt(request.getParameter("rid"));
        //创建session对象
        HttpSession session = request.getSession();
        //判断用户角色
        if (rid == 1) {
            //如果为管理员，则创建AdminsSevice对象，并调用登陆验证方法
            AdminsService adminsService = new AdminsServiceImpl();
            Admins admin = adminsService.login(username, password);
            if (admin != null) {
                //使用session对象存储管理员信息
                session.setAttribute("admin",admin);
                response.sendRedirect(request.getContextPath() + "/manager/index.jsp");
            } else {
                //失败则跳转到登录页面
                session.setAttribute("loginErr", "用户名或密码错误");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        }else {
            // 如果为医生，则创建 DoctorsService 对象，并调用登录验证方法
            DoctorsService doctorsService = new DoctorsServiceImpl();
            Doctors doctors = doctorsService.login(username, password);
            if(doctors != null){
                session.setAttribute("doctor", doctors); // 保存完整医生对象
                session.setAttribute("doctorId", doctors.getDoctorId()); //  添加这一行：保存 doctorId 到 session
                session.setAttribute("userid", doctors.getDoctorId().toString()); // 如果其他地方需要字符串类型
                response.sendRedirect(request.getContextPath() + "/doctor/index.jsp");
            } else {
                session.setAttribute("loginErr", "用户名或密码错误");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        }

    }
}
