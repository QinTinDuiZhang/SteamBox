package com.niuma.impl;

import com.niuma.dao.AdminDao;
import com.niuma.model.Admin;
import com.niuma.model.Community;
import com.niuma.tool.SqlSessionUtils;
import mybatis.AdminMapper;
import org.apache.ibatis.session.SqlSession;

public class AdminDaoImpl implements AdminDao {

    @Override
    public Admin login(String account, String password) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        return adminMapper.login(account, password);
    }

    @Override
    public Boolean addCommunity(Community community) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("name", community.getName());
//        map.put("shopLink", community.getShopLink());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        return adminMapper.addCommunity(community);
    }

    @Override
    public Boolean updateCommunity(Community community) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("name", community.getName());
//        map.put("shopLink", community.getShopLink());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        return adminMapper.updateCommunity(community);
    }

    public Boolean setPostLook(int hidden, int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        return adminMapper.setPostLook(hidden, id);
    }

    @Override
    public Boolean setUserBan(int hidden, int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        return adminMapper.setUserBan(hidden, id);
    }
}
