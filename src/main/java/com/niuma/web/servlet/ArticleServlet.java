package com.niuma.web.servlet;

import com.niuma.dao.ArticleDao;
import com.niuma.impl.ArticleDaoImpl;
import com.niuma.model.Article;
import com.niuma.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.Date;

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String ntitle = request.getParameter("ntitle");
        String[] category = request.getParameterValues("category");
        String community = request.getParameter("community");
        String content = request.getParameter("content");
        String nfile = request.getParameter("nfile");
        Article article = new Article();
        article.setTitle(ntitle);
        article.setCommunityId(Integer.parseInt(community));
        article.setContent(content);
        article.setImg(nfile);
        Date putDate = new Date();
        article.setPubDate(putDate);
        article.setClickCount(0);
        article.setCreator(user.getId());
        ArticleDao articleDao = new ArticleDaoImpl();
        articleDao.publish(article);
        Article getA = articleDao.selectAll(0, 0, putDate).get(0);
        getA.getId();
        for (String t :category){

        }
    }

}
