package mybatis;

import com.niuma.model.Admin;
import com.niuma.model.Community;

import java.util.Map;

public interface AdminMapper {
    Admin login(String account, String password);

    Boolean changePassword(String account);

    Boolean addCommunity(Community community);

    Boolean updateCommunity(Community community);

    Boolean setPostLook(int hidden, int id);
}
