package mybatis;

import com.niuma.model.Comment;

public interface CommentMapper {
    Boolean addComment(Comment comment);    //添加评论

    void updateLikeNum(int likeNum, int id);     //修改点赞数量

    void updateDislikeNum(int disLikeNum, int id);   //修改点踩数量

    int selectLikeNum(int id);              //查询点赞数量

    int selectDisLikeNum(int id);           //查询点踩数量
}
