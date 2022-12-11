package com.niuma.dao;

import com.niuma.model.Community;

import java.util.List;

public interface CommunityDao {
    List<Community> getAllCommunity(int id);

    Boolean setCommunityLook(int communityId, int hidden);

    Boolean updateCommunity(String name, String link, int id);

    boolean likeCommunity(int community, int userId);

    boolean disLikeCommunity(int communityId, int userId);

    Boolean addCommunity(String name, String link);
}
