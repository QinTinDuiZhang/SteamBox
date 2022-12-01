package mybatis;

import com.niuma.model.Community;
import com.niuma.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    //登陆
    User getUser(@Param("account") String account);

    //注册
    Boolean addUser(Map<String, Object> map);

    //获得喜欢的社区
    List<Community> getLikeCommunity(int id);

    //修改个人信息
    Boolean updateUser(String account);
}
