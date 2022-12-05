package com.niuma.impl;

import com.niuma.dao.ArticleDao;
import com.niuma.model.Article;
import com.niuma.tool.SqlSessionUtils;
import mybatis.ArticleMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

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
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.publish(article);
    }

    @Override
    public boolean updateArticle(Article article) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("id", article.getId());
//        map.put("title", article.getTitle());
//        map.put("img", article.getImg());
//        map.put("content", article.getContent());
//        map.put("pubdate", new Timestamp(new java.util.Date().getTime()));
//        map.put("click_count", article.getClickCount());
//        map.put("creator", article.getCreator());
//        map.put("auditor", article.getAuditor());
//        map.put("community_id", article.getCommunityId());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.updateArticle(article);
    }

    @Override
    public boolean deleteArticle(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.deleteArticle(id);
    }

    @Override
    public List<Article> selectAll(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.selectAll(id);
    }
}
