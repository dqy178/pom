package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/10 下午2:52
 */

import com.dqy.service.Impl.TitlesServiceImpl;
import com.dqy.service.TitlesService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/manager/delTitle.do")
public class DelTitlesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求中的参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        //调用service中的删除方法
        TitlesService titlesService = new TitlesServiceImpl();
        titlesService.delTitleByNo(id);
        //跳转到查询控制器
        response.sendRedirect(request.getContextPath() + "/manager/titles.do");
    }
}
