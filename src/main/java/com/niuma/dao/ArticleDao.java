package com.niuma.dao;

import com.niuma.model.Article;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ArticleDao {
    /**
     * 用户发布帖子
     *
     * @param article 帖子信息
     * @return 是否写入成功
     */
    boolean publish(Article article);

    /**
     * 用户修改自己发布的帖子
     *
     * @param article 修改帖子
     * @return 是否修改成功
     */
    boolean updateArticle(Article article);

    /**
     * 用户删除自己发布的帖子
     *
     * @param id 帖子id
     * @return 是否删除帖子
     */
    boolean deleteArticle(int id);

    List<Article> selectAll(Map<String,Object> map);

    int newLink(int aid, int cid);

    boolean setArticleLook(int id,int hidden);

    int getArticleCounts();

    boolean setArticleThrough(int auditor,int articleId);
    boolean setArticleBack(int articleId);

}
