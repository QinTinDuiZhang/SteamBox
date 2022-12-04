package com.niuma.dao;

import com.niuma.model.Comment;

public interface CommentDao {
    /**
     * 用户进行评论
     *
     * @param comment 评论实体类
     * @return 是否成功
     */
    Boolean addComment(Comment comment);

    /**
     * 修改点赞数
     *
     * @param likeNum 点赞数量
     * @param id      哪一条评论的id
     */
    void updateLikeNum(int likeNum, int id);

    /**
     * 修改点踩数
     *
     * @param disLikeNum 点踩数量
     * @param id         哪一条评论的id
     */
    void updateDislikeNum(int disLikeNum, int id);

    /**
     * 查询点赞的数量
     *
     * @param id 哪一条评论的id
     * @return 返回点赞数
     */
    int selectLikeNum(int id);

    /**
     * 查询点踩的数量
     *
     * @param id 哪一条评论的id
     * @return 返回点踩数
     */
    int selectDisLikeNum(int id);
}
