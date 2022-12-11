package com.niuma.web.servlet;


import com.alibaba.fastjson.JSON;
import com.niuma.impl.AdminDaoImpl;
import com.niuma.model.Admin;
import com.niuma.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/Admin/*")
public class AdminServlet extends BaseServlet {
    public void Login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        AdminDaoImpl adminDao = new AdminDaoImpl();
        Admin admin = adminDao.login(name, password);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/AIndex.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("err", "账号或密码输入错误");
            response.sendRedirect(request.getContextPath() + "/ALogin.jsp");
        }
    }

    public void ChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        String newPassword = request.getParameter("renewpass");
        String account = admin.getAccount();
        AdminDaoImpl adminDao = new AdminDaoImpl();
        Boolean aBoolean = adminDao.changePassword(account, newPassword);
        if (aBoolean) {
            session.setAttribute("updateInfo", "修改成功");
            response.sendRedirect(request.getContextPath() + "/AChangePassword.jsp");
        } else {
            session.setAttribute("updateInfo", "修改失败");
            response.sendRedirect(request.getContextPath() + "/AChangePassword.jsp");
        }
    }

    public void BanUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Boolean aBoolean;
        BufferedReader br = request.getReader();
        String params = br.readLine();
        User user = JSON.parseObject(params, User.class);
        AdminDaoImpl adminDao = new AdminDaoImpl();
        if (!user.isForbidden()) {
            aBoolean = adminDao.setUserBan(0, user.getId());
            System.out.println(aBoolean + "禁用成功");
        } else {
            aBoolean = adminDao.setUserBan(1, user.getId());
            System.out.println(aBoolean + "启用成功");
        }
    }

    public void BanManyUsers(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BufferedReader br = request.getReader();
        String params = br.readLine();
        Object[] userid = JSON.parseObject(params, Object[].class);
        AdminDaoImpl adminDao = new AdminDaoImpl();
        for (int i = 0; i < userid.length; i++) {
            adminDao.setUserBan(0, Integer.parseInt((String) userid[i]));
            System.out.println("禁用成功");
        }
    }

}
