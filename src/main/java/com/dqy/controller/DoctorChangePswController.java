package com.dqy.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/docChangePasswd")
public class DoctorChangePswController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            this.doPost(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("utf-8");
            resp.setContentType("text/html;charset=UTF-8");
            String userid = req.getParameter("userid");
            req.setAttribute("userid",userid);
            req.getRequestDispatcher("/doctor/docpasswd.jsp").forward(req,resp);
        }

}