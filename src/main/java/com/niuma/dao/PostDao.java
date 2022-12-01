package com.niuma.dao;

import com.niuma.model.Post;

public interface PostDao {
    public boolean publish(Post post);              //发布帖子
    public boolean updatePost(Post post);           //修改帖子
    public boolean deletePost(int id);              //删除帖子
}
