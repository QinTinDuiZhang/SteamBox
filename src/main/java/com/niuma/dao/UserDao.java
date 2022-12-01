package com.niuma.dao;

import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.List;

public interface UserDao {

    List<Community> getLikeCommunity();

    boolean update(User user);

    int addUser(User user);

    User getSingleOne(String email, String email1);
}
