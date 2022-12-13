package com.niuma.dao;

import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.HashMap;
import java.util.List;

public interface UserDao {
    /**
     * 登陆
     *
     * @param account  用户账号
     * @param password 用户密码
     * @return 用户对象
     */
    User login(String account, String password);

    /**
     * 注册
     *
     * @param user 传入一个user对象
     * @return 返回一个布尔值
     */
    boolean signup(User user);

    /**
     * 获取关注的社区
     *
     * @param id 为用户的ID
     * @return 一个Community的List集合
     */
    List<Community> getLikeCommunity(int id);

    /**
     * 修改密码
     *
     * @param account 用户账号
     * @return 是否成功
     */
    Boolean changePassword(String account, String password);

    /**
     * 通过一个字段获取 User对象 ,用于验重
     *
     * @param key   数据库中字段名
     * @param value 数据值
     * @return User对象 或 null
     */
    User getSingleOne(String key, String value);

    /**
     * 修改用户信息
     *
     * @param user 用户修改后的信息
     * @return 是否成功
     */
    boolean updateUser(User user);

    /**
     * 模糊查询帖子社区
     *
     * @param content 输入查询内容
     * @return 返回一个HashMap, 内嵌入两个集合元素（“帖子”，“社区”）
     */
    HashMap<String, List> selectInfo(String content);

    User getUserByID(int id,String email);
}
