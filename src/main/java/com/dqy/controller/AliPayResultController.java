package com.dqy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.internal.util.AlipaySignature;
import com.dqy.util.AlipayConfig;
import com.dqy.service.PrescriptionService;
import com.dqy.service.HospitalizationService;
import com.dqy.service.Impl.PrescriptionServiceImpl;
import com.dqy.service.Impl.HospitalizationServiceImpl;

/**
 * 支付宝支付结果处理控制器
 */
@WebServlet("/alipayresult")
public class AliPayResultController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private PrescriptionService prescriptionService = new PrescriptionServiceImpl();
    private HospitalizationService hospitalizationService = new HospitalizationServiceImpl();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            /*
             * 功能：支付宝服务器同步通知页面
             * 说明：该页面仅做页面展示，业务逻辑处理请勿在该页面执行
             */
            // 获取支付宝GET过来反馈信息
            Map<String, String> params = new HashMap<String, String>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
                }
                // 乱码解决，这段代码在出现乱码时使用
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
                params.put(name, valueStr);
            }
            
            // 验签
            boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key,
                    AlipayConfig.charset, AlipayConfig.sign_type); // 调用SDK验证签名
            
            if (signVerified) {
                // 商户订单号
                String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
                // 支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
                // 付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
                
                // 更新订单状态
                updateOrderStatus(out_trade_no, trade_no, total_amount);
                
                request.setAttribute("result", "trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
                        + "<br/>total_amount:" + total_amount);
                request.setAttribute("success", true);
            } else {
                request.setAttribute("result", "支付失败");
                request.setAttribute("success", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("result", "处理支付结果时发生错误：" + e.getMessage());
            request.setAttribute("success", false);
        }
        
        // 跳转到支付结果页面
        request.getRequestDispatcher("/payResult.jsp").forward(request, response);
    }
    
    /**
     * 更新订单状态
     */
    private void updateOrderStatus(String orderNo, String tradeNo, String totalAmount) {
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
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("更新订单状态失败: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
} 