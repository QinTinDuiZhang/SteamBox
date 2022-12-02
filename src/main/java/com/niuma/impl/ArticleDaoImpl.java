package com.niuma.impl;

import com.niuma.dao.ArticleDao;
import com.niuma.model.Article;
import com.niuma.tool.SqlSessionUtils;
import mybatis.PostMapper;
import org.apache.ibatis.session.SqlSession;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class ArticleDaoImpl implements ArticleDao {

    @Override
    public boolean publish(Article article) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("title", article.getTitle());
//        map.put("img", article.getImg());
//        map.put("content", article.getContent());
//        map.put("pubdate", new Timestamp(new java.util.Date().getTime()));
//        map.put("click_count", article.getClickCount());
//        map.put("creator", article.getCreator());
//        map.put("auditor", article.getAuditor());
//        map.put("community_id", article.getCommunityId());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        return postMapper.publish(article);
    }

    @Override
    public boolean updatePost(Article article) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", article.getId());
        map.put("title", article.getTitle());
        map.put("img", article.getImg());
        map.put("content", article.getContent());
        map.put("pubdate", new Timestamp(new java.util.Date().getTime()));
        map.put("click_count", article.getClickCount());
        map.put("creator", article.getCreator());
        map.put("auditor", article.getAuditor());
        map.put("community_id", article.getCommunityId());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        return postMapper.updatePost(map);
    }

    @Override
    public boolean deletePost(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        return postMapper.deletePost(id);
    }
}
