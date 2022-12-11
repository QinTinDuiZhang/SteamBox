package mybatis;

import com.niuma.model.Community;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityMapper {
    List<Community> getAll(int id);

    Boolean setCommunityLook(int communityId, int hidden);

    boolean likeCommunity(@Param("communityId") int communityId, @Param("userId") int userId);

    boolean disLikeCommunity(@Param("communityId") int communityId, @Param("userId") int userId);

    Boolean updateCommunity(String name, String link, int id);

}
