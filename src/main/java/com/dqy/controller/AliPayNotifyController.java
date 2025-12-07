package com.dqy.controller;

import com.dqy.service.PrescriptionService;
import com.dqy.service.HospitalizationService;
import com.dqy.service.Impl.PrescriptionServiceImpl;
import com.dqy.service.Impl.HospitalizationServiceImpl;
import com.alipay.api.internal.util.AlipaySignature;
import com.dqy.util.AlipayConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebServlet("/alipaynotify")
public class AliPayNotifyController extends HttpServlet {
    private PrescriptionService prescriptionService = new PrescriptionServiceImpl();
    private HospitalizationService hospitalizationService = new HospitalizationServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        try {
            boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
            if (signVerified) {
                String out_trade_no = request.getParameter("out_trade_no");
                String trade_no = request.getParameter("trade_no");
                // 订单状态自动更新
                if (out_trade_no != null && out_trade_no.startsWith("PRESCRIPTION_")) {
                    String prescriptionId = out_trade_no.replace("PRESCRIPTION_", "");
                    prescriptionService.updatePrescriptionStatus(Integer.parseInt(prescriptionId), "已支付");
                } else if (out_trade_no != null && out_trade_no.startsWith("HOSPITALIZATION_")) {
                    String hospitalizationId = out_trade_no.replace("HOSPITALIZATION_", "");
                    hospitalizationService.updateHospitalizationStatus(Integer.parseInt(hospitalizationId), "已支付");
                }
                response.getWriter().write("success");
            } else {
                response.getWriter().write("fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("fail");
        }
    }
} 