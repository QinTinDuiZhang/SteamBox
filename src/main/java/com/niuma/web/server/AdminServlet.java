package com.niuma.web.server;


import com.niuma.impl.AdminDaoImpl;
import com.niuma.impl.UserDaoImpl;
import com.niuma.model.Admin;
import com.niuma.model.User;
import com.niuma.tool.Md5Util;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Admin/*")
public class AdminServlet extends BaseServlet{
    public void Login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        AdminDaoImpl adminDao = new AdminDaoImpl();
        Admin admin = adminDao.login(name, password);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/AIndex.jsp");
        } else {
            request.setAttribute("err", "账号或密码输入错误");
            response.sendRedirect(request.getContextPath() + "/ALogin.jsp");
        }
    }
//    public void ChangePassword(HttpServletRequest request, HttpServletResponse response) {
//
//    }

}
