package com.dqy.controller;

import com.dqy.pojo.Consultation;
import com.dqy.pojo.Doctors;
import com.dqy.service.ConsultationService;
import com.dqy.service.Impl.ConsulationServiceImpl;
import com.dqy.vo.ConsultationSearchVO;
import com.github.pagehelper.PageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/docTreatRecord")
public class DocConsultationController extends HttpServlet {
    private final ConsultationService consultationService = new ConsulationServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 从 session 中获取当前登录医生
        HttpSession session = request.getSession();
        Doctors doctor = (Doctors) session.getAttribute("doctor");
        if (doctor == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        Integer doctorId = doctor.getDoctorId();

        // 分页参数处理
        int pageNum = 1;
        int pageSize = 5;
        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr != null && !pageNumStr.isEmpty()) {
            try {
                pageNum = Integer.parseInt(pageNumStr);
            } catch (NumberFormatException e) {
                pageNum = 1;
            }
        }

        // 获取日期参数
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");


        // 解析日期参数
        Date startDate = null;
        Date endDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (startDateStr != null && !startDateStr.isEmpty()) {
            try {
                startDate = sdf.parse(startDateStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        if (endDateStr != null && !endDateStr.isEmpty()) {
            try {
                endDate = sdf.parse(endDateStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }

        // 创建 AppointmentSearchVO 对象
        ConsultationSearchVO searchVO = new ConsultationSearchVO(startDate, endDate, doctorId);

        // 调用服务层获取分页数据
        PageInfo<Consultation> pageInfo = consultationService.getConsultationsWithPatientInfo(searchVO, pageNum, pageSize);

        // 将结果存入请求
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("startDate", startDateStr);
        request.setAttribute("endDate", endDateStr);
        request.setAttribute("doctorId", doctorId);

        // 转发到 JSP 页面
        request.getRequestDispatcher("/doctor/Consultation.jsp").forward(request, response);

    }
}
