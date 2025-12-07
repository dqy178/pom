package com.dqy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqy.service.PrescriptionService;
import com.dqy.service.HospitalizationService;
import com.dqy.service.Impl.PrescriptionServiceImpl;
import com.dqy.service.Impl.HospitalizationServiceImpl;

/**
 * 支付状态更新控制器
 */
@WebServlet("/paymentUpdate")
public class PaymentUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private PrescriptionService prescriptionService = new PrescriptionServiceImpl();
    private HospitalizationService hospitalizationService = new HospitalizationServiceImpl();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String orderNo = request.getParameter("out_trade_no");
        String tradeNo = request.getParameter("trade_no");
        String totalAmount = request.getParameter("total_amount");
        
        try {
            if (orderNo != null && orderNo.startsWith("PRESCRIPTION_")) {
                // 更新处方状态
                String prescriptionId = orderNo.replace("PRESCRIPTION_", "");
                prescriptionService.updatePrescriptionStatus(Integer.parseInt(prescriptionId), "已支付");
                System.out.println("处方ID: " + prescriptionId + " 支付成功，支付宝交易号: " + tradeNo);
                
            } else if (orderNo != null && orderNo.startsWith("HOSPITALIZATION_")) {
                // 更新住院状态
                String hospitalizationId = orderNo.replace("HOSPITALIZATION_", "");
                hospitalizationService.updateHospitalizationStatus(Integer.parseInt(hospitalizationId), "已支付");
                System.out.println("住院ID: " + hospitalizationId + " 支付成功，支付宝交易号: " + tradeNo);
            }
            
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("支付状态更新成功");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("支付状态更新失败: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
} 