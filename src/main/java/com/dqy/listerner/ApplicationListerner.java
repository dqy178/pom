package com.dqy.listerner;/**
 * @author 杜青云
 * Date  2025/7/9 下午2:38
 */

import com.dqy.pojo.Departments;
import com.dqy.pojo.Titles;
import com.dqy.service.DepartmentsService;
import com.dqy.service.Impl.DepartmentsServiceImpl;
import com.dqy.service.Impl.TitlesServiceImpl;
import com.dqy.service.TitlesService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.List;

@WebListener
public class ApplicationListerner implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    public ApplicationListerner() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {//创建
        //获取application对象
        ServletContext application = sce.getServletContext();
        //创建科室Service和职称service对象
        DepartmentsService departmentsService = new DepartmentsServiceImpl();
        TitlesService titlesService = new TitlesServiceImpl();

        List<Departments> departmentsList = departmentsService.getDepartmentsBySecond();
        List<Titles> titlesList = titlesService.selectAll();
        //使用application存储科室与职称的信息
        application.setAttribute("departmentsSecondList", departmentsList);
        application.setAttribute("titlesList", titlesList);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {//销毁
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}