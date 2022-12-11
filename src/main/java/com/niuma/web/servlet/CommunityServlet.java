package com.niuma.web.servlet;

import com.niuma.dao.CommunityDao;
import com.niuma.impl.CommunityDaoImpl;
import com.niuma.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Community/*")
public class CommunityServlet extends BaseServlet {
    public void SetCommunityLook(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        String comId = request.getParameter("comId");
        String hidden = request.getParameter("hidden");
        int communityId = Integer.parseInt(comId);
        int hiddenId = Integer.parseInt(hidden);
        CommunityDaoImpl communityDao = new CommunityDaoImpl();
        Boolean aBoolean = communityDao.setCommunityLook(communityId, hiddenId);
        if (aBoolean) {
            if (hiddenId == 0) {
                System.out.println("禁用成功");
            }
            if (hiddenId == 1) {
                System.out.println("启用成功");
            }
        }
        response.sendRedirect(request.getContextPath() + "/AManageCommunity.jsp");
    }

    public void Like(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        int community = Integer.parseInt(request.getParameter("community"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        boolean f = Boolean.parseBoolean(request.getParameter("f"));
        CommunityDao communityDao = new CommunityDaoImpl();
        boolean sign = f ? communityDao.disLikeCommunity(community, user.getId()) : communityDao.likeCommunity(community, user.getId());
    }

    public void UpdateCommunityInfo(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String link = request.getParameter("entitle");
        String comId = request.getParameter("comId");
        int communityId = Integer.parseInt(comId);
        CommunityDaoImpl communityDao = new CommunityDaoImpl();
        Boolean aBoolean = communityDao.updateCommunity(title, link, communityId);
        if (aBoolean) {
            System.out.println("修改成功！");
        }
        response.sendRedirect(request.getContextPath() + "/AManageCommunity.jsp");
    }
}
