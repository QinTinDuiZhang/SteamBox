package com.niuma.web.servlet;

import com.niuma.impl.CommunityDaoImpl;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/Community/*")
public class CommunityServlet extends BaseServlet {
    public void SetCommunityLook(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        String comId = request.getParameter("comId");
        String hidden=request.getParameter("hidden");
        int communityId=Integer.parseInt(comId);
        int hiddenId=Integer.parseInt(hidden);
        CommunityDaoImpl communityDao=new CommunityDaoImpl();
        Boolean aBoolean = communityDao.setCommunityLook(communityId, hiddenId);
        if(aBoolean){
            if(hiddenId==0){
                System.out.println("禁用成功");
            }
            if(hiddenId==1){
                System.out.println("启用成功");
            }
        }
        response.sendRedirect(request.getContextPath() + "/AManageCommunity.jsp");
    }
    public void UpdateCommunityInfo(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String link = request.getParameter("entitle");
        String comId = request.getParameter("comId");
        int communityId = Integer.parseInt(comId);
        CommunityDaoImpl communityDao=new CommunityDaoImpl();
        Boolean aBoolean = communityDao.updateCommunity(title, link, communityId);
        if(aBoolean==true){
            System.out.println("修改成功！");
        }
        response.sendRedirect(request.getContextPath() + "/AManageCommunity.jsp");
    }
}
