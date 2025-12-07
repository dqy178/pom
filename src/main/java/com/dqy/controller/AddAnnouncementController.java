package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/17 下午6:52
 */

import com.dqy.pojo.Announcement;
import com.dqy.service.Impl.AnnouncementServiceImpl;
import com.dqy.service.AnnouncementService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/manager/addAnnouncement.do")
public class AddAnnouncementController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String creator = request.getParameter("creator");
        //把数据封装到Announcement对象中
        Announcement announcement = new Announcement();
        announcement.setTitle(title);
        announcement.setContent(content);
        announcement.setCreationTime(new Date());
        announcement.setCreator(creator);
        //调用service中的添加方法
        AnnouncementService announcementService = new AnnouncementServiceImpl();
        announcementService.addAnnouncement(announcement);
        //跳转到查寻科室的控制器
        response.sendRedirect(request.getContextPath() + "/manager/announcement.do");
    }
}
