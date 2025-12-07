package com.dqy.controller;

import com.dqy.pojo.Appointments;
import com.dqy.service.DocAppointmentService;
import com.dqy.service.Impl.DocAppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 付鑫喆
 * Date 2025/7/18 6:56
 */
@WebServlet("/selectAppointmentId")
public class SelectAppointmentIdController extends HttpServlet {
    private final DocAppointmentService docAppointmentService = new DocAppointmentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            // 获取 appointmentId 参数
            String appointmentIdStr = request.getParameter("appointmentId");
            if (appointmentIdStr == null || appointmentIdStr.isEmpty()) {
                throw new IllegalArgumentException("预约ID不能为空");
            }
            int appointmentId;
            try {
                appointmentId = Integer.parseInt(appointmentIdStr);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("预约ID格式无效");
            }

            // 调用服务层查询 doctor_id 和 patient_id
            Appointments appointment = docAppointmentService.findDoctorAndPatientByAppointmentId(appointmentId);
            if (appointment == null) {
                throw new RuntimeException("预约记录不存在");
            }

            // 将结果存入请求
            request.setAttribute("appointment", appointment);

            // 转发到 insertConsultation.jsp
            request.getRequestDispatcher("/doctor/insertConsultation.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Error selecting appointment: " + e.getMessage());
            request.setAttribute("errorMessage", "查询失败: " + e.getMessage());
            request.getRequestDispatcher("/doctor/docAppointment.jsp").forward(request, response);
        }
    }
}