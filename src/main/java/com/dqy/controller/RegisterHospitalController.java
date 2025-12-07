package com.dqy.controller;

import com.dqy.pojo.Hospitalization;
import com.dqy.service.DocAppointmentService;
import com.dqy.service.Impl.DocAppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/saveHospitalization")
public class RegisterHospitalController extends HttpServlet {
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
            String roomNumber = request.getParameter("roomNumber");
            String costStr = request.getParameter("cost");
            String paymentStatusStr = request.getParameter("paymentStatus");
            String isInsuredStr = request.getParameter("isInsured");
            String hospitalizationStatusStr = request.getParameter("hospitalizationStatus");

            // 验证参数非空
            if (patientIdStr == null || patientIdStr.isEmpty() ||
                    roomNumber == null || roomNumber.isEmpty() ||
                    costStr == null || costStr.isEmpty() ||
                    paymentStatusStr == null || paymentStatusStr.isEmpty() ||
                    isInsuredStr == null || isInsuredStr.isEmpty() ||
                    hospitalizationStatusStr == null || hospitalizationStatusStr.isEmpty()) {
                throw new IllegalArgumentException("所有字段均为必填");
            }

            // 调试日志
            System.out.println("Received parameters: patientId=" + patientIdStr +
                    ", roomNumber=" + roomNumber +
                    ", cost=" + costStr +
                    ", paymentStatus=" + paymentStatusStr +
                    ", isInsured=" + isInsuredStr +
                    ", hospitalizationStatus=" + hospitalizationStatusStr);

            // 转换参数
            int patientId = Integer.parseInt(patientIdStr);
            BigDecimal cost = new BigDecimal(costStr);
            Hospitalization.Status paymentStatus;
            Hospitalization.Status hospitalizationStatus;
            try {
                paymentStatus = Hospitalization.Status.valueOf(paymentStatusStr);
                hospitalizationStatus = Hospitalization.Status.valueOf(hospitalizationStatusStr);
            } catch (IllegalArgumentException e) {
                throw new IllegalArgumentException("无效的状态值: paymentStatus=" + paymentStatusStr +
                        ", hospitalizationStatus=" + hospitalizationStatusStr);
            }
            boolean isInsured = Boolean.parseBoolean(isInsuredStr);
            System.out.println("Parsed isInsured: " + isInsured);

            // 创建 Hospitalization 对象
            Hospitalization hospitalization = new Hospitalization();
            hospitalization.setPatientId(patientId);
            hospitalization.setRoomNumber(roomNumber);
            hospitalization.setCost(cost);
            hospitalization.setPaymentStatus(paymentStatus);
            hospitalization.setIsInsured(isInsured);
            hospitalization.setHospitalizationStatus(hospitalizationStatus);

            // 调用服务层插入记录
            int rows = docAppointmentService.insertHospitalization(hospitalization);
            if (rows <= 0) {
                throw new RuntimeException("插入住院记录失败");
            }

            // 重定向到 docAppointment.jsp
            response.sendRedirect("/docAppointment");

    }
}