package com.dqy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.dqy.util.AlipayConfig;
import com.dqy.service.PrescriptionService;
import com.dqy.service.HospitalizationService;
import com.dqy.service.Impl.PrescriptionServiceImpl;
import com.dqy.service.Impl.HospitalizationServiceImpl;
import com.dqy.pojo.Prescription;
import com.dqy.pojo.Hospitalization;

/**
 * 支付宝支付控制器
 */
@WebServlet("/alipay")
public class AliPayController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PrescriptionService prescriptionService = new PrescriptionServiceImpl();
    private HospitalizationService hospitalizationService = new HospitalizationServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);

        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        // 只接收订单类型和ID，后端查库获取真实参数
        String orderType = request.getParameter("orderType"); // PRESCRIPTION 或 HOSPITALIZATION
        String orderIdStr = request.getParameter("orderId");
        String out_trade_no = null;
        String total_amount = null;
        String subject = null;
        String body = null;

        try {
            if ("PRESCRIPTION".equals(orderType)) {
                Prescription prescription = prescriptionService.getPrescriptionById(Integer.valueOf(orderIdStr));
                if (prescription == null) throw new Exception("未找到对应处方订单");
                out_trade_no = "PRESCRIPTION_" + prescription.getId();
                total_amount = prescription.getTotalAmount().toString();
                subject = "处方缴费";
                body = prescription.getContent();
                if ("已支付".equals(prescription.getStatus())) {
                    throw new Exception("该处方已支付，请勿重复支付");
                }
            } else if ("HOSPITALIZATION".equals(orderType)) {
                Hospitalization hospitalization = hospitalizationService.getHospitalizationById(Integer.valueOf(orderIdStr));
                if (hospitalization == null) throw new Exception("未找到对应住院订单");
                out_trade_no = "HOSPITALIZATION_" + hospitalization.getId();
                total_amount = hospitalization.getTotalAmount().toString();
                subject = "住院缴费";
                body = "住院号:" + hospitalization.getId();
                if ("已支付".equals(hospitalization.getStatus())) {
                    throw new Exception("该住院单已支付，请勿重复支付");
                }
            } else {
                throw new Exception("订单类型错误");
            }

            alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\""
                    + total_amount + "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(result);
            return;
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "支付请求失败：" + e.getMessage());
            request.getRequestDispatcher("/pay.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doGet(request, response);
    }
} 