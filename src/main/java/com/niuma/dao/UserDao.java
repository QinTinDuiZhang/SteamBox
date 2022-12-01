package com.niuma.dao;

import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.Date;
import java.util.List;

public interface UserDao {
    User getUser(String account , String password);      //登陆
    boolean addUser(User user);                          //注册
    List<Community> getLikeCommunity(int id);            //获取关注的社区
    Boolean updateUser(String account);                  //修改各人信息
    Boolean changePassword(String account);              //修改密码
}
