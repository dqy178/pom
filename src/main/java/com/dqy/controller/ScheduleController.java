package com.dqy.controller;

import com.dqy.pojo.Departments;
import com.dqy.pojo.Doctors;
import com.dqy.pojo.Schedule;
import com.dqy.service.Impl.DepartmentsServiceImpl;
import com.dqy.service.Impl.DoctorsServiceImpl;
import com.dqy.service.Impl.ScheduleServiceImpl;
import com.dqy.service.DepartmentsService;
import com.dqy.service.DoctorsService;
import com.dqy.service.ScheduleService;
import com.github.pagehelper.PageInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/manager/schedule.do")
public class ScheduleController extends HttpServlet {
    // 获取一周日期工具
    private List<String> getWeekDateList() {
        List<String> dateList = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = 0; i < 7; i++) {
            dateList.add(sdf.format(cal.getTime()));
            cal.add(Calendar.DAY_OF_MONTH, 1);
        }
        return dateList;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ScheduleService scheduleService = new ScheduleServiceImpl();
        DepartmentsService departmentsService = new DepartmentsServiceImpl();
        DoctorsService doctorsService = new DoctorsServiceImpl();

        if ("list".equals(action) || action == null) {
            // 分页查询
            Integer pageNum = 1;
            Integer pageSize = 5;
            String page = request.getParameter("page");
            if (page != null && page.length() > 0) {
                pageNum = Integer.parseInt(page);
            }
            Integer departmentId = null;
            String strDepartmentId = request.getParameter("departmentId");
            if (strDepartmentId != null && strDepartmentId.length() > 0) {
                departmentId = Integer.parseInt(strDepartmentId);
            }
            Date date = null;
            String strDate = request.getParameter("date");
            if (strDate != null && strDate.length() > 0) {
                try {
                    date = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
                } catch (Exception e) {}
            }
            // 查询排班
            PageInfo<Schedule> pageInfo = scheduleService.getScheduleList(departmentId, date, pageNum, pageSize);
            // 查询科室树
            List<Departments> departmentsList = departmentsService.getDepartmentAll();
            // 查询一周日期
            List<String> dateList = getWeekDateList();

            request.setAttribute("pageInfo", pageInfo);
            request.setAttribute("departmentsList", departmentsList);
            request.setAttribute("dateList", dateList);
            request.setAttribute("selectedDepartmentId", departmentId);
            request.setAttribute("selectedDate", strDate);

            request.getRequestDispatcher("/manager/scheduleList.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            // 新增页面需要科室、医生下拉
            List<Departments> departmentsList = departmentsService.getDepartmentAll();
            List<Doctors> doctorsList = doctorsService.getDoctorsByPageAndSearch(null, 1, 1000).getList(); // 查全部医生
            request.setAttribute("departmentsList", departmentsList);
            request.setAttribute("doctorsList", doctorsList);
            request.getRequestDispatcher("/manager/addSchedule.jsp").forward(request, response);
        } else if ("save".equals(action)) {
            // 保存新增
            Schedule schedule = new Schedule();
            schedule.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
            try {
                schedule.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date")));
            } catch (Exception e) {}
            schedule.setShiftTime(request.getParameter("shiftTime"));
            schedule.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
            schedule.setIsAvailable(Integer.parseInt(request.getParameter("isAvailable")));
            schedule.setVisitCount(Integer.parseInt(request.getParameter("visitCount")));
            schedule.setSumCount(Integer.parseInt(request.getParameter("sumCount")));
            schedule.setRemarks(request.getParameter("remarks"));
            scheduleService.addSchedule(schedule);
            response.sendRedirect(request.getContextPath() + "/manager/schedule.do?action=list");
        } else if ("edit".equals(action)) {
            // 跳转到编辑页面
            Integer scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
            Schedule schedule = scheduleService.getScheduleById(scheduleId);
            List<Departments> departmentsList = departmentsService.getDepartmentAll();
            List<Doctors> doctorsList = doctorsService.getDoctorsByPageAndSearch(null, 1, 1000).getList();
            request.setAttribute("departmentsList", departmentsList);
            request.setAttribute("doctorsList", doctorsList);
            request.setAttribute("schedule", schedule);
            request.getRequestDispatcher("/manager/editSchedule.jsp").forward(request, response);
        } else if ("update".equals(action)) {
            // 保存编辑
            Schedule schedule = new Schedule();
            schedule.setScheduleId(Integer.parseInt(request.getParameter("scheduleId")));
            schedule.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
            try {
                schedule.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date")));
            } catch (Exception e) {}
            schedule.setShiftTime(request.getParameter("shiftTime"));
            schedule.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
            schedule.setIsAvailable(Integer.parseInt(request.getParameter("isAvailable")));
            schedule.setVisitCount(Integer.parseInt(request.getParameter("visitCount")));
            schedule.setSumCount(Integer.parseInt(request.getParameter("sumCount")));
            schedule.setRemarks(request.getParameter("remarks"));
            scheduleService.updateSchedule(schedule);
            response.sendRedirect(request.getContextPath() + "/manager/schedule.do?action=list");
        } else if ("delete".equals(action)) {
            // 删除
            Integer scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
            scheduleService.deleteSchedule(scheduleId);
            response.sendRedirect(request.getContextPath() + "/manager/schedule.do?action=list");
        }
    }
}