package com.niuma.dao;

import com.niuma.model.Post;

public interface PostDao {
    public boolean publish(Post post);
    public boolean updatePost(Post post);
    public boolean deletePost(int id);
}
