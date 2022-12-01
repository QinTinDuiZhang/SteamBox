package com.niuma.impl;

import com.niuma.dao.UserDao;
import com.niuma.model.Community;
import com.niuma.model.User;
import com.niuma.tool.Md5Util;
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
     *
     * @param account 用户账号
     * @param password 用户密码
     * @return  用户对象
     */
    @Override
    public User login(String account , String password) {         //登陆
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUser(account, Md5Util.md5(password));
    }

    /**
     *
     * @param user 传入一个user对象
     * @return 返回一个布尔值
     */
    @Override
    public boolean signup(User user) {                             //注册
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
        return userMapper.addUser(map);
    }

    /**
     *
     * @param id 为用户的ID
     * @return 一个Community的List集合
     */
    @Override
    public List<Community> getLikeCommunity(int id) {               //获取关注社区
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getLikeCommunity(id);
    }

    /**
     *
     * @param account 用户账号
     * @return 返回一个布尔值
     */
    public Boolean updateUser(String account){                      //修改个人信息
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.updateUser(account);
    }

    /**
     * 修改密码
     * @param account 用户账号
     * @return 返回一个布尔值
     */
    public Boolean changePassword(String account,String password){
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.changePassword(account,Md5Util.md5(password));
    }

    @Override
    public User getSingleOne(String email, String email1) {
        return null;
    }

    @Override
    public boolean update(User userT) {
        return false;
    }

}
