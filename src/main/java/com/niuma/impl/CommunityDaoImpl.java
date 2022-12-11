package com.niuma.impl;

import com.niuma.dao.CommunityDao;
import com.niuma.model.Community;
import com.niuma.tool.SqlSessionUtils;
import mybatis.CommunityMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CommunityDaoImpl implements CommunityDao {

    @Override
    public List<Community> getAllCommunity(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.getAll(id);
    }

    @Override
    public Boolean setCommunityLook(int communityId, int hidden) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.setCommunityLook(communityId, hidden);
    }

    @Override
    public boolean likeCommunity(int communityId, int userId) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.likeCommunity(communityId, userId);
    }

    @Override
    public boolean disLikeCommunity(int communityId, int userId) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.disLikeCommunity(communityId, userId);
    }

    @Override
    public Boolean updateCommunity(String name, String link, int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.updateCommunity(name, link, id);
    }

    @Override
    public Boolean addCommunity(String name, String link) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommunityMapper communityMapper = sqlSession.getMapper(CommunityMapper.class);
        return communityMapper.addCommunity(name, link);
    }

}
