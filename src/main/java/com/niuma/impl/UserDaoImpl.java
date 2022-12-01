package com.niuma.impl;

import com.niuma.dao.UserDao;
import com.niuma.model.Community;
import com.niuma.model.User;
import com.niuma.tool.SqlSessionUtils;
import mybatis.UserMapper;
import org.apache.ibatis.session.SqlSession;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDaoImpl implements UserDao {
    /**
     * 登陆
     *
     * @param account  账号
     * @return 登陆用户信息
     */
    @Override
    public User login(String account) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUser(account);
    }

    /**
     * 注册用户
     *
     * @param user 用户填入字段
     * @return 是否注册成功
     */
    @Override
    public boolean signup(User user) {
        Map<String, Object> map = new HashMap<>();
        map.put("account", user.getAccount());
        map.put("password", user.getPassword());
        map.put("nickname", user.getNickName());
        map.put("photo", user.getPhoto());
        map.put("birthday", new Date(user.getBirthday().getTime()));
        map.put("email", user.getEmail());
        map.put("mobile", user.getMobile());
        map.put("regdate", new Timestamp(new java.util.Date().getTime()));
        map.put("forbidden", 0);
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.addUser(map);
    }

    /**
     * 通过 用户id 搜索用户 关注的社区
     *
     * @param id 用户id
     * @return 关注社区列表
     */
    @Override
    public List<Community> getLikeCommunity(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getLikeCommunity(id);
    }
}
