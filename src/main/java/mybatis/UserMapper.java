package mybatis;

import com.niuma.model.Community;
import com.niuma.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    User getUser(@Param("account") String account, @Param("password") String password);   //登陆

    Boolean addUser(User user);                                                           //注册

    List<Community> getLikeCommunity(@Param("id") int id);                               //获得喜欢的社区

    Boolean updateUser(User user);                                                       //修改个人信息

    Boolean changePassword(@Param("account") String account, @Param("password") String password);  //修改密码
}
