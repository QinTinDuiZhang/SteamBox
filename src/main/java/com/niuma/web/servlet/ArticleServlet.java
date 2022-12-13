package com.niuma.web.servlet;

import com.niuma.dao.ArticleDao;
import com.niuma.impl.ArticleDaoImpl;
import com.niuma.model.Article;
import com.niuma.model.User;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        boolean f;
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
        f = articleDao.publish(article);
        Map<String,Object> map=new HashMap<>();
        map.put("pubDate",putDate);
        map.put("hidden",1);
        Article getA = articleDao.selectAll(map).get(0);
        int aId = getA.getId();
        for (String t : category)
            if (articleDao.newLink(aId, Integer.parseInt(t)) != 1)
                f = false;
        response.getWriter().write(String.valueOf(f));
        response.sendRedirect(request.getContextPath() + "/first.jsp");
    }
    public void setArticleLook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String artId = request.getParameter("articleId");
        String hid = request.getParameter("hidden");
        int articleId = Integer.parseInt(artId);
        int hidden = Integer.parseInt(hid);
        ArticleDaoImpl articleDao=new ArticleDaoImpl();
        boolean b = articleDao.setArticleLook(articleId, hidden);
        if(b){
            System.out.println("执行成功");
        }
        response.sendRedirect(request.getContextPath() + "/AManageArticle.jsp");
    }
    public void TurnPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String pg = request.getParameter("page");
        String status = request.getParameter("status");
        int page=Integer.parseInt(pg);
        ArticleDaoImpl articleDao = new ArticleDaoImpl();
        Map<String,Object> map=new HashMap<>();
        if(status.equals("up")){
            page=page-5;
            map.put("limit",page);
            List<Article> articles = articleDao.selectAll(map);
            HttpSession session = request.getSession();
            session.setAttribute("articles",articles);
            session.setAttribute("limit",page);
        }else if(status.equals("down")){
            page=page+5;
            map.put("limit",page);
            List<Article> articles = articleDao.selectAll(map);
            HttpSession session = request.getSession();
            session.setAttribute("articles",articles);
            session.setAttribute("limit",page);
        }
        response.sendRedirect(request.getContextPath() + "/AManageArticle.jsp");

    }
}
