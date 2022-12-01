package com.niuma.impl;

import com.niuma.dao.PostDao;
import com.niuma.model.Post;
import com.niuma.tool.SqlSessionUtils;
import mybatis.PostMapper;
import org.apache.ibatis.session.SqlSession;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class PostDaoImpl implements PostDao {

    /**
     * 用户发布帖子
     *
     * @param post 帖子信息
     * @return 是否写入成功
     */
    @Override
    public boolean publish(Post post) {
        Map<String, Object> map = new HashMap<>();
        map.put("title", post.getTitle());
        map.put("img", post.getImg());
        map.put("content", post.getContent());
        map.put("pubdate", new Timestamp(new java.util.Date().getTime()));
        map.put("click_count", post.getClickCount());
        map.put("creator", post.getCreator());
        map.put("auditor", post.getAuditor());
        map.put("community_id", post.getCommunityId());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        return postMapper.publish(map);
    }

    /**
     * 用户修改自己发布的帖子
     *
     * @param post 修改帖子
     * @return 是否修改成功
     */
    @Override
    public boolean updatePost(Post post) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", post.getId());
        map.put("title", post.getTitle());
        map.put("img", post.getImg());
        map.put("content", post.getContent());
        map.put("pubdate", new Timestamp(new java.util.Date().getTime()));
        map.put("click_count", post.getClickCount());
        map.put("creator", post.getCreator());
        map.put("auditor", post.getAuditor());
        map.put("community_id", post.getCommunityId());
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        return postMapper.updatePost(map);
    }

    /**
     * 用户删除自己发布的帖子
     *
     * @param id 帖子id
     * @return 是否删除帖子
     */
    @Override
    public boolean deletePost(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        return postMapper.deletePost(id);
    }
}
