package com.dqy.controller;

import com.dqy.service.DocAppointmentService;
import com.dqy.service.Impl.DocAppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateAppStatus")
public class UpdateAppStatusController extends HttpServlet {
    private final DocAppointmentService appointmentsService = new DocAppointmentServiceImpl();

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

            // 转换为 Integer
            int appointmentId = Integer.parseInt(appointmentIdStr);

            // 调用服务层更新状态
            int rowsAffected = appointmentsService.updateAppointmentStatusToCompleted(appointmentId);
            if (rowsAffected <= 0) {
                throw new RuntimeException("更新预约状态失败");
            }

            // 获取查询参数以保持页面状态
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String doctorId = request.getParameter("doctorId");
            String pageNum = request.getParameter("pageNum");

            // 构建重定向URL，保留查询参数
            StringBuilder redirectUrl = new StringBuilder("/docAppointment");
            boolean hasParams = false;
            if (startDate != null && !startDate.isEmpty()) {
                redirectUrl.append(hasParams ? "&" : "?").append("startDate=").append(startDate);
                hasParams = true;
            }
            if (endDate != null && !endDate.isEmpty()) {
                redirectUrl.append(hasParams ? "&" : "?").append("endDate=").append(endDate);
                hasParams = true;
            }
            if (doctorId != null && !doctorId.isEmpty()) {
                redirectUrl.append(hasParams ? "&" : "?").append("doctorId=").append(doctorId);
                hasParams = true;
            }
            if (pageNum != null && !pageNum.isEmpty()) {
                redirectUrl.append(hasParams ? "&" : "?").append("pageNum=").append(pageNum);
            }

            // 重定向到 docAppointment
            response.sendRedirect(redirectUrl.toString());
        } catch (Exception e) {
            // 设置错误信息并转发到 docAppointment.jsp
            request.setAttribute("errorMessage", "更新失败: " + e.getMessage());
            request.getRequestDispatcher("/docAppointment.jsp").forward(request, response);
        }
    }
}