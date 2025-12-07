package com.dqy.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 10 * 1024 * 1024)
public class ImageUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        Part filePart = request.getPart("imageFile");
        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().write("请选择文件");
            return;
        }
        // 获取上传目录的真实路径
        String uploadDir = request.getServletContext().getRealPath("/upload/");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 获取原始文件名和后缀
        String originalFilename = filePart.getSubmittedFileName();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        // 白名单校验
        String[] allowedExt = {".jpg", ".jpeg", ".png", ".gif"};
        boolean allowed = false;
        for (String ext : allowedExt) {
            if (suffix.equalsIgnoreCase(ext)) {
                allowed = true;
                break;
            }
        }
        if (!allowed) {
            response.getWriter().write("不支持的文件类型");
            return;
        }
        String newFileName = UUID.randomUUID().toString() + suffix;
        File dest = new File(dir, newFileName);
        filePart.write(dest.getAbsolutePath());
        response.getWriter().write(request.getContextPath() + "/upload/" + newFileName);
    }
} 