package com.niuma.web.servlet;

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
        map.put("hidden", false);
        map.put("articleId", Integer.parseInt(request.getParameter("articleId")));
        map.put("creator", user.getId());
        map.put("ipaddress", request.getRemoteAddr());
        map.put("likeNum", 0);
        map.put("dislikeNum", 0);
        map.put("pubDate", new Date());
        map.put("replyForId", request.getParameter("replyForId"));
        CommentDao commentDao = new CommentDaoImpl();
        commentDao.insert(map);
        response.sendRedirect(request.getContextPath() + "/particulars.jsp?article=" + request.getParameter("articleId"));
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
        String username = request.getParameter("name");
        CommentDaoImpl commentDao=new CommentDaoImpl();
        List<Comment> userComments = commentDao.getUserComments(Integer.parseInt(userid));
        HttpSession session = request.getSession();
        session.setAttribute("UserComments",userComments);
        session.setAttribute("name",username);
        response.sendRedirect(request.getContextPath() + "/AComment.jsp");
    }

    public void DeleteComment(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        String commentId=request.getParameter("cid");
        int id=Integer.parseInt(commentId);
        CommentDaoImpl commentDao=new CommentDaoImpl();
        Boolean aBoolean = commentDao.deleteComment(id);
        if(aBoolean==true){
            System.out.println("删除成功！");
            response.sendRedirect(request.getContextPath() + "/AComment.jsp");
            HttpSession session = request.getSession();
            session.setAttribute("deleteIndo","删除成功");
        }else{
            System.out.println("删除失败！");
            response.sendRedirect(request.getContextPath() + "/AComment.jsp");
            HttpSession session = request.getSession();
            session.setAttribute("deleteIndo","删除失败");
        }
    }

}
