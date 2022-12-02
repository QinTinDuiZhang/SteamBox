package mybatis;

import com.niuma.model.Article;

import java.util.Map;

public interface PostMapper {

    //发布帖子
    boolean publish(Article article);

    //修改帖子
    boolean updatePost(Map<String, Object> map);

    //删除帖子
    boolean deletePost(int id);
}
