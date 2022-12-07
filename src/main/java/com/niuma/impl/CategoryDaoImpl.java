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
}
