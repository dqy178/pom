package com.dqy.controller;

import com.dqy.pojo.Appointment;
import com.dqy.pojo.User;
import com.dqy.service.AppointmentService;
import com.dqy.service.Impl.AppointmentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/user/appointment", "/user/appointmentList"})
public class AppointmentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/user/appointment".equals(path)) {
            addAppointment(request, response);
        } else if ("/user/appointmentList".equals(path)) {
            listAppointments(request, response);
        }
    }

    private void addAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/userlogin.jsp");
            return;
        }
        Integer departmentId = Integer.valueOf(request.getParameter("departmentId"));
        Integer doctorId = Integer.valueOf(request.getParameter("doctorId"));
        String appointmentTimeStr = request.getParameter("appointmentTime");
        if (appointmentTimeStr != null && appointmentTimeStr.contains("T")) {
            appointmentTimeStr = appointmentTimeStr.replace("T", " ");
        }
        if (appointmentTimeStr != null && appointmentTimeStr.length() == 16) {
            appointmentTimeStr += ":00";
        }
        String status = "已预约";
        Date appointmentTime = null;
        try {
            appointmentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(appointmentTimeStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Appointment appointment = new Appointment();
        appointment.setUserId(user.getId());
        appointment.setDepartmentId(departmentId);
        appointment.setDoctorId(doctorId);
        appointment.setAppointmentTime(appointmentTime);
        appointment.setStatus(status);
        AppointmentService service = new AppointmentServiceImpl();
        boolean success = service.addAppointment(appointment);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/user/appointmentList");
        } else {
            request.setAttribute("msg", "挂号失败，请重试");
            request.getRequestDispatcher("/user/appointment.jsp").forward(request, response);
        }
    }

    private void listAppointments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/userlogin.jsp");
            return;
        }
        AppointmentService service = new AppointmentServiceImpl();
        List<Appointment> list = service.getAppointmentsByUserId(user.getId());
        request.setAttribute("appointmentList", list);
        request.getRequestDispatcher("/user/appointmentList.jsp").forward(request, response);
    }
} 