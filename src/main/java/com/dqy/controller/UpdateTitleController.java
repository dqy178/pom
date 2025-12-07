package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/10 下午3:47
 */

import com.dqy.pojo.Titles;
import com.dqy.service.Impl.TitlesServiceImpl;
import com.dqy.service.TitlesService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/updateTitle.do")
public class UpdateTitleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String titleName = request.getParameter("titleName");
        String description = request.getParameter("description");
        Titles titles = new Titles();
        titles.setId(id);
        titles.setTitleName(titleName);
        titles.setDescription(description);
//        设置service中修改方法
        TitlesService titlesService = new TitlesServiceImpl();
        titlesService.updateTitle(titles);
//        跳转到控制器
        response.sendRedirect(request.getContextPath() + "/manager/titles.do");
    }
}
