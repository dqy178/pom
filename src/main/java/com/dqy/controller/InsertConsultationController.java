package com.dqy.controller;

import com.dqy.pojo.Consultation;
import com.dqy.service.DocAppointmentService;
import com.dqy.service.Impl.DocAppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

/**
 * @author 付鑫喆
 * Date 2025/7/18 7:52
 */
@WebServlet("/saveConsultation")
public class InsertConsultationController extends HttpServlet {
    private final DocAppointmentService docAppointmentService = new DocAppointmentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


            // 获取表单参数
            String patientIdStr = request.getParameter("patientId");
            String doctorIdStr = request.getParameter("doctorId");
            String consultationDetails = request.getParameter("consultationDetails");
            String isHospitalRegisteredStr = request.getParameter("isHospitalRegistered");
            String isHospitalizedStr = request.getParameter("isHospitalized");

            // 验证必填字段
            if (patientIdStr == null || doctorIdStr == null || consultationDetails == null) {
                throw new IllegalArgumentException("患者ID、医生ID和会诊详情不能为空");
            }

            // 转换参数
            int patientId;
            int doctorId;
            try {
                patientId = Integer.parseInt(patientIdStr);
                doctorId = Integer.parseInt(doctorIdStr);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("患者ID或医生ID格式无效");
            }

            Boolean isHospitalRegistered = isHospitalRegisteredStr != null ? Boolean.parseBoolean(isHospitalRegisteredStr) : false;
            Boolean isHospitalized = isHospitalizedStr != null ? Boolean.parseBoolean(isHospitalizedStr) : false;
            Timestamp consultationTime = new Timestamp(System.currentTimeMillis()); // 当前时间

            // 创建 Consultation 对象
            Consultation consultation = new Consultation();
            consultation.setPatientId(patientId);
            consultation.setDoctorId(doctorId);
            consultation.setConsultationTime(consultationTime);
            consultation.setIsHospitalRegistered(isHospitalRegistered);
            consultation.setIsHospitalized(isHospitalized);
            consultation.setMedicalAdviceCase(consultationDetails);

            // 调用服务层插入
            int rows = docAppointmentService.insertConsultation(consultation);
            if (rows <= 0) {
                throw new RuntimeException("插入会诊记录失败");
            }

            // 重定向到 docAppointment.jsp
            response.sendRedirect("/doctor/docAppointment.jsp");

    }
}