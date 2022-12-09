package com.niuma.web.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/Article/*")
@MultipartConfig(fileSizeThreshold = 10 * 1024 * 1024, maxFileSize = 50 * 1024 * 1024, maxRequestSize = 100 * 1024 * 1024)
public class ArticleServlet extends BaseServlet {

    private static final long serialVersionUID = 1L;

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "img/cover";

    /**
     * 发布帖子
     */
    public void Publish(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String ntitle = request.getParameter("ntitle");
        String[] category = request.getParameterValues("category");
        String community = request.getParameter("community");
        String content = request.getParameter("content");
        String nfile = request.getParameter("nfile");
    }

}
