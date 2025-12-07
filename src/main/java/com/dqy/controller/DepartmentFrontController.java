package com.dqy.controller;

import com.dqy.pojo.Departments;
import com.dqy.service.DepartmentsService;
import com.dqy.service.Impl.DepartmentsServiceImpl;
import com.github.pagehelper.PageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Controller for displaying department information on the front-end layout-department.jsp page.
 * @author 吴春波
 * Date 2025/7/17
 */
@WebServlet("/departmentFront.do")
public class DepartmentFrontController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set page size and retrieve page number from request
        int pageSize = 5;
        int pageNum = 1;
        String page = request.getParameter("page");
        if (page != null && page.length() > 0) {
            pageNum = Integer.parseInt(page);
        }

        // Instantiate DepartmentsService and retrieve paginated department data
        DepartmentsService departmentsService = new DepartmentsServiceImpl();
        PageInfo<Departments> pageInfo = departmentsService.getDepartments(pageNum, pageSize);

        // Store pageInfo in request scope for JSP rendering
        request.setAttribute("pageInfo", pageInfo);

        // Forward to layout-department.jsp
        request.getRequestDispatcher("/layout-department.jsp").forward(request, response);
    }
}