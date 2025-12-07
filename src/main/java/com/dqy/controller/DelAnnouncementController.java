package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/17 下午6:59
 */

import com.dqy.service.Impl.AnnouncementServiceImpl;
import com.dqy.service.AnnouncementService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/delAnnouncement.do")
public class DelAnnouncementController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求中的参数
        Integer announcementId = Integer.parseInt(request.getParameter("announcementId"));
        //调用service中的删除方法
        AnnouncementService announcementService = new AnnouncementServiceImpl();
        announcementService.delAnnouncementByNo(announcementId);
        //跳转到查询控制器
        response.sendRedirect(request.getContextPath() + "/manager/announcement.do");
    }
}
