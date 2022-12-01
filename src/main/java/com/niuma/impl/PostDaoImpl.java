package com.niuma.impl;

import com.niuma.dao.PostDao;
import com.niuma.model.Post;
import com.niuma.tool.SqlSessionUtils;
import mybatis.PostMapper;
import org.apache.ibatis.session.SqlSession;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class PostDaoImpl implements PostDao {

    @Override
    public boolean publish(Post post) {
        Map<String,Object> map=new HashMap<>();
        map.put("title",post.getTitle());
        map.put("img", post.getImg());
        map.put("content",post.getContent());
        map.put("pubdate",new Timestamp(new java.util.Date().getTime()));
        map.put("click_count",post.getClickCount());
        map.put("creator",post.getCreator());
        map.put("auditor",post.getAuditor());
        map.put("community_id",post.getCommunityId());
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        Boolean aBoolean = postMapper.publish(map);
        return aBoolean;
    }

    @Override
    public boolean updatePost(Post post) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",post.getId());
        map.put("title",post.getTitle());
        map.put("img", post.getImg());
        map.put("content",post.getContent());
        map.put("pubdate",new Timestamp(new java.util.Date().getTime()));
        map.put("click_count",post.getClickCount());
        map.put("creator",post.getCreator());
        map.put("auditor",post.getAuditor());
        map.put("community_id",post.getCommunityId());
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        Boolean aBoolean = postMapper.updatePost(map);
        return aBoolean;
    }

    @Override
    public boolean deletePost(int id) {
        SqlSession sqlSession= SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        Boolean aBoolean = postMapper.deletePost(id);
        return aBoolean;
    }

}
