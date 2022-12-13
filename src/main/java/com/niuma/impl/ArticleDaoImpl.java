package com.niuma.impl;

import com.niuma.dao.ArticleDao;
import com.niuma.model.Article;
import com.niuma.tool.SqlSessionUtils;
import mybatis.ArticleMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class ArticleDaoImpl implements ArticleDao {

    @Override
    public boolean publish(Article article) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.publish(article);
    }

    @Override
    public boolean updateArticle(Article article) {
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
    public List<Article> selectAll(Map<String,Object> map) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.selectAll(map);
    }

    @Override
    public int newLink(int aid, int cid) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.newLink(aid, cid);
    }

    @Override
    public boolean setArticleLook(int id, int hidden) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.setArticleLook(id, hidden);
    }

    @Override
    public int getArticleCounts() {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.getArticleCounts();
    }
}
