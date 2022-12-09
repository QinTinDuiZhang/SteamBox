package com.niuma.web.server;

import com.niuma.impl.CommunityDaoImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Community/*")
public class CommunityServlet extends BaseServlet{
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
}
