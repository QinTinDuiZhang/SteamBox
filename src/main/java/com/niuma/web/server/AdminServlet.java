package com.niuma.web.server;


import com.niuma.impl.AdminDaoImpl;
import com.niuma.impl.UserDaoImpl;
import com.niuma.model.Admin;
import com.niuma.model.User;
import com.niuma.tool.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Admin/*")
public class AdminServlet extends BaseServlet{
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
            response.sendRedirect(request.getContextPath()+"/ALogin.jsp");
        }
    }
    public void ChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin admin =(Admin) session.getAttribute("admin");
        String newPassword=request.getParameter("renewpass");
        String account = admin.getAccount();
        AdminDaoImpl adminDao=new AdminDaoImpl();
        Boolean aBoolean = adminDao.changePassword(account, newPassword);
        if(aBoolean==true){
            session.setAttribute("updateInfo","修改成功");
            response.sendRedirect(request.getContextPath()+"/AChangePassword.jsp");
        }else{
            session.setAttribute("updateInfo","修改失败");
            response.sendRedirect(request.getContextPath()+"/AChangePassword.jsp");
        }
    }
    public void BanUser(HttpServletRequest request,HttpServletResponse response){
        System.out.println(request.getAttribute("userid"));
        System.out.println(request.getAttribute("operate"));
//        AdminDaoImpl adminDao=new AdminDaoImpl();
//        Boolean aBoolean = adminDao.setUserBan(operate, userid);
//        if(aBoolean==true){
//            System.out.println("成功");
//        }
    }

}
