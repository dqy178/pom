package com.dqy.controller;

import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.DoctorsServiceImpl;
import com.github.pagehelper.PageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule")
public class DoctorScheduleController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = req.getParameter("userid");
        DoctorsService service = new DoctorsServiceImpl();
        String pageNum = req.getParameter("pageNum");
        int i = 1;
        int j = 4;
        if(pageNum != null && pageNum!= "")
        {
            i = Integer.parseInt(pageNum);
        }
        PageInfo pageInfo = service.findSchduleByid(Integer.parseInt(userid), i, j);
        req.setAttribute("pageInfo",pageInfo);
        /*System.out.println(pageInfo);*/
        req.getRequestDispatcher("/doctor/docSchedule.jsp?userid="+userid).forward(req,resp);
    }
}
