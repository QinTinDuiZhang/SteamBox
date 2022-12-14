package com.niuma.web.servlet;

import com.niuma.dao.ArticleDao;
import com.niuma.dao.UserDao;
import com.niuma.impl.ArticleDaoImpl;
import com.niuma.impl.UserDaoImpl;
import com.niuma.model.User;
import com.niuma.tool.MailDemoSum;
import com.niuma.tool.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@WebServlet("/User/*")
@MultipartConfig(fileSizeThreshold = 10 * 1024 * 1024, maxFileSize = 50 * 1024 * 1024, maxRequestSize = 100 * 1024 * 1024)
public class UserServlet extends BaseServlet {

    private static final long serialVersionUID = 1L;

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "img/photo";

    /* 检查邮箱重复 */
    public void SelectEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.getUserByID(0, email, null);
        if (user != null) {
            HttpSession session = request.getSession();
            User user1 = (User) session.getAttribute("user");
            if (user1 == null) {
                response.getWriter().write("sign");
                return;
            }
            if (user.getId() != user1.getId())
                response.getWriter().write("update");
        }
    }

    /* 检查用户账号重复 */
    public void SelectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userName = request.getParameter("userName");
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.getUserByID(0, null, userName);
        if (user != null) {
            response.getWriter().write("true");
        }
    }

    /* 获得验证码邮件 */
    public void GetEmail(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        try {
            String authCode = MailDemoSum.textMail(email);
            request.getSession().setAttribute("authCode", authCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 修改信息 */
    public void Userinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User userT = (User) session.getAttribute("user");
        String realPath = request.getServletContext().getRealPath("");
        String uploadFilePath = realPath + File.separator + UPLOAD_DIRECTORY;
        //这边我用的servlet3文件上传
        for (Part part : request.getParts()) {
            String submittedFileName = part.getSubmittedFileName();
            if (submittedFileName != null && !submittedFileName.equals("")) {
                part.write(uploadFilePath + File.separator + submittedFileName);
                userT.setPhoto(submittedFileName);
            }
        }
        String authCode = (String) session.getAttribute("authCode");
        if (authCode != null) {
            String emailE = (String) session.getAttribute("emailE");
            if (!authCode.equals(emailE)) {
                session.setAttribute("authCodeErr", "验证码错误，请重试");
                response.sendRedirect(request.getContextPath() + "/userinfo.jsp");
            }
        } else
            response.sendRedirect(request.getContextPath() + "/userinfo.jsp");
        userT.setEmail(request.getParameter("email"));
        userT.setMobile(request.getParameter("mobile"));
        userT.setAccount(request.getParameter("account"));
        UserDaoImpl userDao = new UserDaoImpl();
        if (userDao.updateUser(userT)) {
            session.setAttribute("user", userT);
            session.removeAttribute("authCode");
            request.getRequestDispatcher(request.getContextPath() + "/first.jsp").forward(request, response);
        } else {
            session.removeAttribute("authCode");
            response.sendRedirect(request.getContextPath() + "/userinfo.jsp");
        }
    }

    /* 注册 */
    public void Signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String authCode = request.getParameter("authCode");
        if (session.getAttribute("authCode") != null && session.getAttribute("authCode").equals(authCode)) {
            String account = request.getParameter("acc");
            String email = request.getParameter("email");
            String password = Md5Util.md5(request.getParameter("password"));
            User user = new User();
            user.setAccount(account);
            user.setPassword(password);
            user.setEmail(email);
            user.setNickName("用户" + account);
            user.setPhoto("NO.0001.png");
            user.setRegDate(new Date());
            UserDaoImpl userDao = new UserDaoImpl();
            if (userDao.signup(user)) {
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/first.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        } else {
            request.setAttribute("emailE_err", "验证码错误,请再次获取");
            request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);
        }
    }

    /* 登陆 */
    public void Login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("account");
        String password = Md5Util.md5(request.getParameter("Lpassword"));
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.login(account, password);
        if (user != null) {
            if (user.isForbidden()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/first.jsp");
            } else {
                request.setAttribute("forbid", "账号已被封禁");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        } else {
            request.setAttribute("err", "账号或密码输入错误");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    /* 验证输入的密码与原密码 */
    public void P(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String password = request.getParameter("password");
        if (user.getPassword().equals(Md5Util.md5(password))) response.getWriter().write("true");
        else response.getWriter().write("false");
    }

    /* 修改密码 */
    public void ChangePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String newPassword = request.getParameter("newPassword");
        user.setPassword(Md5Util.md5(newPassword));
        UserDaoImpl userDao = new UserDaoImpl();
        if (userDao.updateUser(user)) response.sendRedirect(request.getContextPath() + "/index.jsp");
        else response.sendRedirect(request.getContextPath() + "/changePassword.jsp");
    }

    /**
     * 搜索
     */
    public void Search(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String search = request.getParameter("Search");
        UserDao userDao = new UserDaoImpl();
        HashMap<String, List> selectInfo = userDao.selectInfo(search);
        request.getSession().setAttribute("selectInfo", selectInfo);
        response.sendRedirect(request.getContextPath() + "/search.jsp");
    }

    public void Del(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("a");
        ArticleDao articleDao = new ArticleDaoImpl();
        articleDao.Del(Integer.parseInt(id));
    }

}
