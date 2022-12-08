package mybatis;

import com.niuma.model.Admin;
import com.niuma.model.Community;
import com.niuma.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    Admin login(String account,String password);

    Boolean changePassword(@Param("account") String account,@Param("password")String password);

    Boolean addCommunity(Community community);

    Boolean updateCommunity(Community community);

    Boolean setPostLook(int hidden, int id);

    Boolean setUserBan(int hidden, int id);

    List<User> getAllUser();
}
