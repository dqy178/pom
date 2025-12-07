package com.dqy.controller;

import com.dqy.pojo.Hospitalization;
import com.dqy.pojo.User;
import com.dqy.service.HospitalizationService;
import com.dqy.service.Impl.HospitalizationServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/user/hospitalizationList", "/user/hospitalizationDetail", "/user/hospitalizationPay"})
public class HospitalizationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/user/hospitalizationList".equals(path)) {
            listHospitalizations(request, response);
        } else if ("/user/hospitalizationDetail".equals(path)) {
            hospitalizationDetail(request, response);
        } else if ("/user/hospitalizationPay".equals(path)) {
            hospitalizationPay(request, response);
        }
    }

    private void listHospitalizations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/userlogin.jsp");
            return;
        }
        HospitalizationService service = new HospitalizationServiceImpl();
        List<Hospitalization> list = service.getHospitalizationsByUserId(user.getId());
        request.setAttribute("hospitalizationList", list);
        request.getRequestDispatcher("/user/hospitalizationList.jsp").forward(request, response);
    }

    private void hospitalizationDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        HospitalizationService service = new HospitalizationServiceImpl();
        Hospitalization hospitalization = service.getHospitalizationById(id);
        System.out.println("住院ID: " + id + " 当前状态: " + hospitalization.getStatus());
        request.setAttribute("hospitalization", hospitalization);
        request.getRequestDispatcher("/user/hospitalizationDetail.jsp").forward(request, response);
    }

    private void hospitalizationPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        HospitalizationService service = new HospitalizationServiceImpl();
        Hospitalization hospitalization = service.getHospitalizationById(id);
        request.setAttribute("hospitalization", hospitalization);
        request.setAttribute("msg", "缴费接口暂未实现");
        request.getRequestDispatcher("/user/hospitalizationDetail.jsp?id=" + id).forward(request, response);
    }
} 