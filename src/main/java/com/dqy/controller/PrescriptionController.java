package com.dqy.controller;

import com.dqy.pojo.Prescription;
import com.dqy.pojo.User;
import com.dqy.service.PrescriptionService;
import com.dqy.service.Impl.PrescriptionServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/user/prescriptionList", "/user/prescriptionDetail"})
public class PrescriptionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/user/prescriptionList".equals(path)) {
            listPrescriptions(request, response);
        } else if ("/user/prescriptionDetail".equals(path)) {
            prescriptionDetail(request, response);
        }
    }

    private void listPrescriptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/userlogin.jsp");
            return;
        }
        PrescriptionService service = new PrescriptionServiceImpl();
        List<Prescription> list = service.getPrescriptionsByUserId(user.getId());
        request.setAttribute("prescriptionList", list);
        request.getRequestDispatcher("/user/prescriptionList.jsp").forward(request, response);
    }

    private void prescriptionDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        PrescriptionService service = new PrescriptionServiceImpl();
        Prescription prescription = service.getPrescriptionById(id);
        System.out.println("处方ID: " + id + " 当前状态: " + prescription.getStatus());
        request.setAttribute("prescription", prescription);
        request.getRequestDispatcher("/user/prescriptionDetail.jsp").forward(request, response);
    }
} 