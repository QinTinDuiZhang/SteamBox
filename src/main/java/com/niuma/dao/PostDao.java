package com.niuma.dao;

import com.niuma.model.Post;

public interface PostDao {
    /**
     * 用户发布帖子
     *
     * @param post 帖子信息
     * @return 是否写入成功
     */
    boolean publish(Post post);

    /**
     * 用户修改自己发布的帖子
     *
     * @param post 修改帖子
     * @return 是否修改成功
     */
    boolean updatePost(Post post);

    /**
     * 用户删除自己发布的帖子
     *
     * @param id 帖子id
     * @return 是否删除帖子
     */
    boolean deletePost(int id);
}
