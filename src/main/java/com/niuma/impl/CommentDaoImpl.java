package com.niuma.impl;

import com.niuma.dao.CommentDao;
import com.niuma.model.Comment;
import com.niuma.tool.SqlSessionUtils;
import mybatis.CommentMapper;
import org.apache.ibatis.session.SqlSession;

public class CommentDaoImpl implements CommentDao {

    @Override
    public Boolean addComment(Comment comment) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        return commentMapper.addComment(comment);
    }

    @Override
    public void updateLikeNum(int likeNum, int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        commentMapper.updateLikeNum(likeNum, id);
    }

    @Override
    public void updateDislikeNum(int disLikeNum, int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        commentMapper.updateDislikeNum(disLikeNum, id);
    }

    @Override
    public int selectLikeNum(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        return commentMapper.selectLikeNum(id);
    }

    @Override
    public int selectDisLikeNum(int id) {
        SqlSession sqlSession = SqlSessionUtils.getSqlSession();
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        return commentMapper.selectDisLikeNum(id);
    }

}
