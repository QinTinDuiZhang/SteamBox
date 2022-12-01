package mybatis;

import com.niuma.model.Admin;

import java.util.Map;

public interface AdminMapper {
    Admin login(String account, String password);

    Boolean changePassword(String account);

    Boolean addCommunity(Map<String, Object> map);

    Boolean updateCommunity(Map<String, Object> map);

    Boolean setPostLook(int hidden, int id);
}
