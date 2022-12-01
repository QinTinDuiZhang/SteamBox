package mybatis;

import java.util.Map;

public interface PostMapper {

    //发布帖子
    boolean publish(Map<String, Object> map);

    //修改帖子
    boolean updatePost(Map<String, Object> map);

    //删除帖子
    boolean deletePost(int id);
}
