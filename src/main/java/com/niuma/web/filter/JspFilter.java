package com.niuma.web.filter;

import com.niuma.model.Admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/admin/*")
public class JspFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        HttpSession session = httpServletRequest.getSession();
        Admin admin = (Admin)session.getAttribute("admin");

        String url = httpServletRequest.getRequestURI();

        //若不进行url.endsWith("login.jsp")判断则会出现无限循环重定向的问题；
        //若登陆成功之后则admin不为null，继续执行
        if(url.endsWith("/admin/ALogin.jsp") || admin!=null){
            chain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }

        //若该if放在上一if语句之前，仍然会出现无限循环重定向的问题
        if(admin==null){
            httpServletResponse.sendRedirect(((HttpServletRequest) request).getContextPath() + "/admin/ALogin.jsp");
            return;
        }
    }

    @Override
    public void destroy() {

    }
}
