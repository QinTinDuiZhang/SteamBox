package com.niuma.dao;

import com.niuma.model.Article;
import com.niuma.model.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> getAllCategory();

    List<Article> getCategoryArticle(int id);

    List<Category> toGainByArticle(int id);

    Boolean setClassLook(int id, int hidden);

    Boolean addClass(String className);
}
