package mybatis;

import com.niuma.model.Community;

import java.util.List;

public interface CommunityMapper {
    List<Community> getAll();
    Boolean setCommunityLook(int communityId,int hidden);
}
