package com.niuma.dao;

import com.niuma.model.Community;

import java.util.List;

public interface CommunityDao {
    List<Community> getAllCommunity();
    Boolean setCommunityLook(int communityId,int hidden);
}
