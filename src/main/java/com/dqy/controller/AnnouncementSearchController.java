package com.dqy.controller;

import com.dqy.pojo.Announcement;
import com.dqy.service.AnnouncementService;
import com.dqy.service.Impl.AnnouncementServiceImpl;
import com.github.pagehelper.PageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 杜青云
 * Date 2025/7/18
 */
@WebServlet("/announcementSearch.do")
public class AnnouncementSearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer pageNum = 1;
        Integer pageSize = 5;
        String page = request.getParameter("page");
        if (page != null && !page.isEmpty()) {
            pageNum = Integer.parseInt(page);
        }

        // Call AnnouncementService to fetch paginated data
        AnnouncementService announcementService = new AnnouncementServiceImpl();
        PageInfo<Announcement> pageInfo = announcementService.selectAll(pageNum, pageSize);

        // Store pageInfo in request
        request.setAttribute("pageInfo", pageInfo);

        // Forward to notice.jsp
        request.getRequestDispatcher("/notice.jsp").forward(request, response);
    }
}