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
    /**
     *
     * @param account 管理员账号
     * @param password 管理员密码
     * @return 返回一个管理员对象
     */
    @Override
    public Admin login(String account, String password) {               //管理员登陆
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        Admin admin =adminMapper.login(account, password);
        return admin;
    }

    /**
     *
     * @param community 传入一个community对象
     * @return 返回一个布尔值
     */
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

    /**
     *
     * @param community 传入一个community对象
     * @return 返回一个布尔值
     */

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

    /**
     *
     * @param hidden 为0/1的数字，0位不可见，1为可见
     * @param id 需要修改的帖子id
     * @return 返回一个布尔值
     */
    public Boolean setPostLook(int hidden,int id){              //设置帖子可见与否,hidden为可见与否参数，第二个为帖子id
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        Boolean aBoolean = adminMapper.setPostLook(hidden,id);
        return aBoolean;
    }
}
