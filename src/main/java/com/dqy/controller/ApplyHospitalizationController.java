package com.dqy.controller;

import com.dqy.pojo.Patients;
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
 * Date 2025/7/18 4:11
 */
@WebServlet("/applyHospitalization")
public class ApplyHospitalizationController extends HttpServlet {
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
            // 获取请求参数 patientId
            String patientIdStr = request.getParameter("patientId");
            if (patientIdStr == null || patientIdStr.isEmpty()) {
                throw new IllegalArgumentException("患者ID不能为空");
            }
            int patientId;
            try {
                patientId = Integer.parseInt(patientIdStr);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("患者ID格式无效");
            }

            // 调用服务层查询患者信息
            Patients patient = docAppointmentService.findPatientById(patientId);
            if (patient == null) {
                throw new RuntimeException("患者不存在");
            }

            // 将患者信息存入请求
            request.setAttribute("patient", patient);

            // 转发到 registerHosp.jsp
            request.getRequestDispatcher("/doctor/registerHosp.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Error applying hospitalization: " + e.getMessage());
            request.setAttribute("errorMessage", "操作失败: " + e.getMessage());
            request.getRequestDispatcher("/doctor/docAppointment.jsp").forward(request, response);
        }
    }
}