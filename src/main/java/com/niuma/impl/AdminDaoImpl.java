package com.niuma.impl;

import com.niuma.dao.AdminDao;
import com.niuma.model.Admin;
import com.niuma.model.Community;
import com.niuma.tool.SqlSessionUtils;
import mybatis.AdminMapper;
import org.apache.ibatis.session.SqlSession;


import java.util.HashMap;
import java.util.Map;

public class AdminDaoImpl implements AdminDao {
    @Override
    public Admin login(String account, String password) {               //管理员登陆
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        Admin admin =adminMapper.login(account, password);
        return admin;
    }

    @Override
    public Boolean addCommunity(Community community) {                  //添加社区
        Map<String,Object> map=new HashMap<>();
        map.put("name",community.getName());
        map.put("shopLink", community.getShopLink());
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        Boolean aBoolean = adminMapper.addCommunity(map);
        return aBoolean;
    }

    @Override
    public Boolean updateCommunity(Community community) {                            //修改社区
        Map<String,Object> map=new HashMap<>();
        map.put("name",community.getName());
        map.put("shopLink",community.getShopLink());
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        Boolean aBoolean = adminMapper.updateCommunity(map);
        return aBoolean;
    }
    public Boolean setPostLook(int hidden,int id){              //设置帖子可见与否,hidden为可见与否参数，第二个为帖子id
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        Boolean aBoolean = adminMapper.setPostLook(hidden,id);
        return aBoolean;
    }
}
