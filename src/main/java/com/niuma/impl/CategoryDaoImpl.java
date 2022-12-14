package com.niuma.impl;

import com.niuma.dao.CategoryDao;
import com.niuma.model.Article;
import com.niuma.model.Category;
import com.niuma.tool.SqlSessionUtils;
import mybatis.CategoryMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    @Override
    public List<Category> getAllCategory() {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        return categoryMapper.getAllCategory();
    }

    @Override
    public List<Article> getCategoryArticle(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        return categoryMapper.getCategoryArticle(id);
    }

    @Override
    public List<Category> toGainByArticle(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        return categoryMapper.ToGainByArticle(id);
    }

    @Override
    public Boolean setClassLook(int id, int hidden) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        return categoryMapper.setClassLook(id, hidden);
    }

    @Override
    public Boolean addClass(String className) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        return categoryMapper.addClass(className);
    }

    @Override
    public List<Category> getCategoryUserId(int uId) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        return categoryMapper.getCategoryByUserId(uId);
    }
}
