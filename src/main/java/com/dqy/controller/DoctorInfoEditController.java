package com.dqy.controller;

import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.DoctorsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editDocDetails")
public class DoctorInfoEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String introduction = req.getParameter("introduction");
        DoctorsService service = new DoctorsServiceImpl();
        service.editInfoByid(Integer.parseInt(id), phone, email, introduction);
        resp.sendRedirect(req.getContextPath() + "/doctor/updateDetails.jsp");
    }
}
