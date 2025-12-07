package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/10 上午9:37
 */

import com.dqy.pojo.Titles;
import com.dqy.service.Impl.TitlesServiceImpl;
import com.dqy.service.TitlesService;
import com.github.pagehelper.PageInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/titles.do")
public class TitlesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer pageNum = 1;
        Integer pageSize = 5;
        String page = request.getParameter("page");
        if(page!= null && page.length()>0){
            pageNum = Integer.parseInt(page);
        }
        //调用DepartmentsService中分页查询的方法
        TitlesService titlesService = new TitlesServiceImpl();
        PageInfo<Titles>pageInfo = titlesService.selectAll(pageNum,pageSize);
        //使用request对象，存储pageInfo的值
        request.setAttribute("pageInfo",pageInfo);
        //页面跳转到科室列表页面
        request.getRequestDispatcher("/manager/titles.jsp").forward(request,response);
    }
}
