package com.niuma.web.server;

import com.niuma.dao.CommentDao;
import com.niuma.impl.CommentDaoImpl;
import com.niuma.model.Comment;
import com.niuma.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/Comment/*")
public class CommentServlet extends BaseServlet {
    public void putComment(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User user = (User) request.getSession().getAttribute("user");
        Map map = new HashMap();
        map.put("content", request.getParameter("content"));
        map.put("hidden", true);
        map.put("articleId", Integer.parseInt(request.getParameter("articleId")));
        map.put("creator", user.getId());
        map.put("ipaddress", request.getRemoteAddr());
        map.put("likeNum", 0);
        map.put("dislikeNum", 0);
        map.put("pubDate", new Date());
        map.put("replyForId", request.getParameter("replyForId"));
        CommentDao commentDao = new CommentDaoImpl();
        commentDao.insert(map);
        response.sendRedirect(request.getContextPath() + "/article.jsp?id=" + request.getParameter("articleId"));
    }

    public void Like(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentDao commentDao = new CommentDaoImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        String operate = request.getParameter("operate");
        int num = -1;
        if ("undislike".equals(operate) || "dislike".equals(operate))
            num = commentDao.updateDislikeNum(id, "dislike".equals(operate));
        else if ("unlike".equals(operate) || "like".equals(operate))
            num = commentDao.updateLikeNum(id, "like".equals(operate));
        PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        writer.write(String.valueOf(num));
        writer.flush();
        writer.close();
    }
    public void GetUserComment(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userid = request.getParameter("userid");
        CommentDaoImpl commentDao=new CommentDaoImpl();
        List<Comment> userComments = commentDao.getUserComments(Integer.parseInt(userid));
        HttpSession session = request.getSession();
        session.setAttribute("UserComments",userComments);
        response.sendRedirect(request.getContextPath() + "/AComment.jsp");
    }

}
