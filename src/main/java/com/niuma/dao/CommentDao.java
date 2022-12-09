package com.niuma.dao;

import com.niuma.model.Comment;

import java.util.List;
import java.util.Map;

public interface CommentDao {

    int insert(Map map);

    List<Comment> getCommentsByArticleId(int articleId);

    /**
     * 更新点赞数
     *
     * @param commentId 评论ID
     * @param like      true:点赞 或 false:取消点赞
     * @return 点赞数量
     */
    int updateLikeNum(int commentId, boolean like);

    /**
     * 更新点踩数
     *
     * @param commentId 评论ID
     * @param dislike   true:点踩 或 false:取消点踩
     * @return 点踩数量
     */
    int updateDislikeNum(int commentId, boolean dislike);

    /**
     * 得到单个用户的所有评论
     * @param userid 用户ID
     * @return 返回一个评论集合
     */
    List<Comment> getUserComments(int userid);

    /**
     * 删除用户评论
     * @param id 评论的id
     * @return 返回一个布尔值
     */
    Boolean deleteComment(int id);
}
