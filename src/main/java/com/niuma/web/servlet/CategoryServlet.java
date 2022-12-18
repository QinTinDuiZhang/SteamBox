package com.niuma.web.servlet;

import com.niuma.impl.CategoryDaoImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Category/*")
public class CategoryServlet extends BaseServlet {
    public void SetClassLook(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Id = request.getParameter("classId");
        String hid = request.getParameter("hidden");
        System.out.println(Id + "隔开" + hid);
        int classId = Integer.parseInt(Id);
        int hiddenId = Integer.parseInt(hid);
        CategoryDaoImpl categoryDao = new CategoryDaoImpl();
        Boolean aBoolean = categoryDao.setClassLook(classId, hiddenId);
        if (aBoolean) {
            System.out.println("修改成功");
        }
        response.sendRedirect(request.getContextPath() + "/AManageClassification.jsp");
    }

    public void AddClassification(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String className = request.getParameter("title");
        CategoryDaoImpl categoryDao = new CategoryDaoImpl();
        Boolean aBoolean = categoryDao.addClass(className);
        if (aBoolean) {
            System.out.println("添加分类成功");
        }
        response.sendRedirect(request.getContextPath() + "/AManageClassification.jsp");
    }


}
