package com.niuma.impl;

import com.niuma.dao.CommunityDao;
import com.niuma.model.Community;
import com.niuma.tool.SqlSessionUtils;
import mybatis.CommunityMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CommunityDaoImpl implements CommunityDao {

    @Override
    public List<Community> getAll() {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.getAll();
    }
}
