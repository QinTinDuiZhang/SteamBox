package mybatis;

import com.niuma.model.Comment;
import com.niuma.model.Community;
import com.niuma.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    public User getUser(@Param("account") String account,@Param("password") String password);   //登陆
    public Boolean addUser(Map<String,Object> map);                                             //注册
    public List<Community> getLikeCommunity(int id);                                            //获得喜欢的社区
    public  Boolean updateUser(String account);                                                 //修改个人信息
    public  Boolean changePassword(String account);                                             //修改密码
}
