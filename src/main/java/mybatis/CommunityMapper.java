package mybatis;

import com.niuma.model.Community;

import java.util.List;

public interface CommunityMapper {
    List<Community> getAll(int id);
    Boolean setCommunityLook(int communityId,int hidden);
    Boolean updateCommunity(String name,String link,int id);
}
