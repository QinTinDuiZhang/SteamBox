package com.niuma.dao;

import com.niuma.model.Article;

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

    /**
     * 查询帖子
     *
     * @param map 条件库 可选[是否可见(0,1),社区分类,id(精确),发布时间,是否过审(-1,0),开始行数(只获取后面五行)]
     * @return 帖子列表
     */
    List<Article> selectAll(Map<String, Object> map);

    /**
     * 新建社区,帖子连接
     *
     * @param aid 帖子id
     * @param cid 社区id
     * @return 影响的行数
     */
    int newLink(int aid, int cid);

    /**
     * 设置帖子是否可见
     *
     * @param id     帖子id
     * @param hidden 可见/不可见
     * @return 是否成功
     */
    boolean setArticleLook(int id, int hidden);

    /**
     * @return
     */
    int getArticleCounts();

    /**
     * @param auditor
     * @param articleId
     * @return
     */
    boolean setArticleThrough(int auditor, int articleId);

    /**
     * @param articleId
     * @return
     */
    boolean setArticleBack(int articleId);

    /**
     * 获取用户发布的帖子
     *
     * @param uId 用户id
     * @return 用户所有的帖子
     */
    List<Article> getUserArticle(int uId);
}
