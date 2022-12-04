package com.niuma.impl;

import com.niuma.dao.UserDao;
import com.niuma.model.Community;
import com.niuma.model.User;
import com.niuma.tool.Md5Util;
import com.niuma.tool.SqlSessionUtils;
import mybatis.UserMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public User login(String account, String password) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUser(account, password);
    }

    @Override
    public boolean signup(User user) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("account", user.getAccount());
//        map.put("password", user.getPassword());
//        map.put("nickname", user.getNickName());
//        map.put("photo", user.getPhoto());
//        map.put("birthday", new Date(user.getBirthday().getTime()));
//        map.put("email", user.getEmail());
//        map.put("mobile", user.getMobile());
//        map.put("regdate", new Timestamp(new java.util.Date().getTime()));
//        map.put("forbidden", false);
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.addUser(user);
    }

    @Override
    public List<Community> getLikeCommunity(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getLikeCommunity(id);
    }

    public Boolean changePassword(String account, String password) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.changePassword(account, Md5Util.md5(password));
    }

    @Override
    public User getSingleOne(String email, String email1) {
        return null;
    }

    @Override
    public boolean updateUser(User user) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.updateUser(user);
    }

}
