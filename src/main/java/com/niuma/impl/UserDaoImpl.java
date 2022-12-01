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
    @Override
    public User getUser(String account , String password) {
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User user =userMapper.getUser(account, password);
        return user;
    }

    @Override
    public boolean addUser(User user) {
        Map<String,Object> map=new HashMap<>();
        map.put("account",user.getAccount());
        map.put("password", user.getPassword());
        map.put("nickname",user.getNickName());
        map.put("photo",user.getPhoto());
        map.put("birthday",new Date(user.getBirthday().getTime()));
        map.put("email",user.getEmail());
        map.put("mobile",user.getMobile());
        map.put("regdate",new Timestamp(new java.util.Date().getTime()));
        map.put("forbidden",false);
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        Boolean aBoolean = userMapper.addUser(map);
        return aBoolean;
    }

    @Override
    public List<Community> getLikeCommunity(int id) {
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        List<Community> community = userMapper.getLikeCommunity(id);
        return community;
    }

}
