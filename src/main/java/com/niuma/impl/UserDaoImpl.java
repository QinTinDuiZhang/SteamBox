package com.niuma.impl;

import com.niuma.dao.UserDao;
import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public List<Community> getLikeCommunity() {
        return null;
    }

    @Override
    public boolean update(User user) {
        return false;
    }

    @Override
    public int addUser(User user) {
        return 0;
    }

    @Override
    public User getSingleOne(String email, String email1) {
        return null;
    }
}
