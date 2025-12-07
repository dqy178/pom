package com.dqy.controller;/**
 * @author 杜青云
 * Date  2025/7/14 下午3:45
 */

import com.dqy.pojo.Doctors;
import com.dqy.service.DoctorsService;
import com.dqy.service.Impl.DoctorsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/manager/addDoctor.do")
@MultipartConfig  //允许上传文件
public class AddDoctorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //2 接受上传文件
        Part part = request.getPart("imgFile");//参数名为type=“file”的name
        //2.1 获取文件名称
        String oldFileName = part.getSubmittedFileName();
        System.out.println("-------------->oldFileName = " + oldFileName);
        //2.2 给文件设置新名称（防止文件命名冲突）
        //a 适用UUID创建新文件名b，获取源文件的文件类型
        String newFileName = "upload/"+UUID.randomUUID().toString()+oldFileName.substring(oldFileName.lastIndexOf("."));
        System.out.println("-------------->newFileName = " + newFileName);
        //2.3 获取文件存储的路径
        String savePath = this.getServletContext().getRealPath("/");
        System.out.println("---->savePath = "+savePath);
        //2.4 保存文件到指定路径
        part.write(savePath+"/"+newFileName);
        //接收请求中医生的信息
        String jobNumber = request.getParameter("jobNumber");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String introduction = request.getParameter("introduction");
        Double registrationFee = Double.parseDouble(request.getParameter("registrationFee"));
        Integer departmentId = Integer.parseInt(request.getParameter("departmentId"));
        Integer professionalTitleId = Integer.parseInt(request.getParameter("professionalTitleId"));
         //把数据封装到Departments对象中
        Doctors doctors = new Doctors();
        doctors.setJobNumber(jobNumber);
        doctors.setName(name);
        doctors.setAvatar(newFileName);
        doctors.setPhone(phone);
        doctors.setEmail(email);
        doctors.setIntroduction(introduction);
        doctors.setRegistrationFee(registrationFee);
        doctors.setDepartmentId(departmentId);
        doctors.setProfessionalTitleId(professionalTitleId);
        //调用service中的添加方法
        DoctorsService doctorsService = new DoctorsServiceImpl();
        doctorsService.addDoctor(doctors);
        //跳转到查寻科室的控制器
        response.sendRedirect(request.getContextPath() + "/manager/doctorsSearch.do");
    }
}
