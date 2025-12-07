package com.dqy.controller;

import com.dqy.service.Impl.DoctorsServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editDocPasswd")
public class DocChangePasswdFinalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = req.getParameter("userid");
        String firstpasswd = req.getParameter("passfirst");
        String passsecond = req.getParameter("passsecond");
        if(!firstpasswd.equals(passsecond))
        {}
        else
        {
            //同意修改
            DoctorsServiceImpl service = new DoctorsServiceImpl();
            service.updatePasswdById(Integer.parseInt(userid), firstpasswd);
            resp.sendRedirect("/docChangePasswd?userid="+userid);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
