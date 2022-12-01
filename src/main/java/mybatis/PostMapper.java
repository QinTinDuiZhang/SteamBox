package mybatis;

import java.util.Map;

public interface PostMapper {
    public boolean publish(Map<String,Object> map);             //发布帖子
    public  boolean updatePost(Map<String,Object> map);         //修改帖子
    public boolean deletePost(int id);                          //删除帖子
}
