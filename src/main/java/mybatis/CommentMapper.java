package mybatis;

import com.niuma.model.Comment;

import java.util.Map;

public interface CommentMapper {
    Boolean addComment(Comment comment);
    void updateLikeNum(int likeNum,int id);
    void updateDislikeNum(int disLikeNum,int id);
    int selectLikeNum(int id);
    int selectDisLikeNum(int id);
}
