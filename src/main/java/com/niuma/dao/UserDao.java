package com.niuma.dao;

import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.Date;
import java.util.List;

public interface UserDao {
    public User login(String account , String password);      //登陆
    public boolean signup(User user);                          //注册
    public List<Community> getLikeCommunity(int id);            //获取关注的社区
    public Boolean updateUser(String account);                  //修改各人信息
    public Boolean changePassword(String account,String password);              //修改密码

    User getSingleOne(String email, String email1);

    boolean update(User userT);
}
