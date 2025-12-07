package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/10 下午4:03
 */

import com.dqy.pojo.Titles;
import com.dqy.service.Impl.TitlesServiceImpl;
import com.dqy.service.TitlesService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/titleByNo.do")
public class TitlesByNo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //调用service中对应的查询学生
        TitlesService titlesService = new TitlesServiceImpl();
        Titles titles = titlesService.selectTitlesByNo(id);
        //转发到updateStudent.jsp页面
        //使用request存储学生对象
        request.setAttribute("titles", titles);
        request.getRequestDispatcher("/manager/updateTitles.jsp").forward(request, response);
    }
}
