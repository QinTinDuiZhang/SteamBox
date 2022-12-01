package com.niuma.dao;

import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.List;

public interface UserDao {
    /**
     * 登陆
     *
     * @param account  账号
     * @return 登陆用户信息
     */
    User login(String account);

    /**
     * 注册用户
     *
     * @param user 用户填入字段
     * @return 是否注册成功
     */
    boolean signup(User user);

    /**
     * 通过 用户id 搜索用户 关注的社区
     *
     * @param id 用户id
     * @return 关注社区列表
     */
    List<Community> getLikeCommunity(int id);
}
