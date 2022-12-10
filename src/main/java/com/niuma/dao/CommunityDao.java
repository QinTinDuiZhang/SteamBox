package com.niuma.dao;

import com.niuma.model.Community;

import java.util.List;

public interface CommunityDao {
    List<Community> getAllCommunity(int id);
    Boolean setCommunityLook(int communityId,int hidden);

    boolean likeCommunity(int community,int userId);

    boolean disLikeCommunity(int communityId,int userId);
}
