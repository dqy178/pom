package com.dqy.controller;

import com.dqy.pojo.Doctors;
import com.dqy.service.Impl.DoctorsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toEditDocDetails")
public class DoctorInfoChangeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String userid = req.getParameter("userid");
        DoctorsServiceImpl service = new DoctorsServiceImpl();
        Doctors doctors = service.findByid(Integer.parseInt(userid));
//        System.out.println(doctors);
        req.setAttribute("doctors",doctors);
        req.getRequestDispatcher("/doctor/updateDetails.jsp").forward(req,resp);
    }
}