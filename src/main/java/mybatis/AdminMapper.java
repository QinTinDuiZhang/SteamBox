package mybatis;

import com.niuma.model.Admin;
import com.niuma.model.Community;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface AdminMapper {
    public Admin login(String account, String password);                                       //管理员登陆
    public Boolean changePassword(String account);                                             //修改密码
    public Boolean addCommunity(Map<String,Object> map);                                       //添加社区
    public Boolean updateCommunity(Map<String,Object> map);                                    //修改社区信息
    public Boolean setPostLook(int hidden,int id);                                             //设置帖子可见与否,hidden为可见与否参数，第二个为帖子id
}
