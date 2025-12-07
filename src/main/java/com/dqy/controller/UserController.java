package com.dqy.controller;

import com.dqy.pojo.User;
import com.dqy.service.UserService;
import com.dqy.service.Impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/user/register", "/user/userlogin", "/user/profileUpdate", "/user/updateAvatar"})
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/user/register".equals(path)) {
            register(request, response);
        } else if ("/user/userlogin".equals(path)) {
            login(request, response);
        } else if ("/user/profileUpdate".equals(path)) {
            profileUpdate(request, response);
        } else if ("/user/updateAvatar".equals(path)) {
            updateAvatar(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setName(name);
        user.setGender(gender);
        user.setIdCard(idCard);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddress(address);
        user.setAvatar(null); // 注册时不设置默认图片路径
        UserService userService = new UserServiceImpl();
        boolean success = userService.register(user);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/userlogin.jsp?register=success");
        } else {
            request.setAttribute("msg", "用户名已存在");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserService userService = new UserServiceImpl();
        User user = userService.login(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/user/userindex.jsp");
        } else {
            request.setAttribute("msg", "用户名或密码错误");
            request.getRequestDispatcher("/userlogin.jsp").forward(request, response);
        }
    }

    private void profileUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/userlogin.jsp");
            return;
        }
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String avatar = request.getParameter("avatar");
        if (avatar != null && !avatar.isEmpty()) {
            user.setAvatar(avatar);
        }
        user.setName(name);
        user.setGender(gender);
        user.setIdCard(idCard);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddress(address);
        UserService userService = new UserServiceImpl();
        boolean success = userService.updateUser(user);
        if (success) {
            session.setAttribute("user", userService.getUserById(user.getId()));
            request.setAttribute("msg", "信息修改成功！");
        } else {
            request.setAttribute("msg", "信息修改失败，请重试！");
        }
        request.getRequestDispatcher("/user/profile.jsp").forward(request, response);
    }

    private void updateAvatar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String avatar = request.getParameter("avatar");
            if (user != null && avatar != null && !avatar.isEmpty()) {
                UserService userService = new UserServiceImpl();
                boolean success = userService.updateUserAvatar(user.getId(), avatar);
                if (success) {
                    user.setAvatar(avatar);
                    session.setAttribute("user", user);
                    response.getWriter().write("success");
                    return;
                }
            }
            response.getWriter().write("fail");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error: " + e.getMessage());
        }
    }
} 