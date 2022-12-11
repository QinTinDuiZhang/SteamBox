package com.niuma.impl;

import com.niuma.dao.ArticleDao;
import com.niuma.model.Article;
import com.niuma.tool.SqlSessionUtils;
import mybatis.ArticleMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.Date;
import java.util.List;

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
    public List<Article> selectAll(int id, int aId, Date pubDate) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.selectAll(id, aId, null);
    }

    @Override
    public int newLink(int aid, int cid) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        ArticleMapper postMapper = sqlSession.getMapper(ArticleMapper.class);
        return postMapper.newLink(aid, cid);
    }
}
