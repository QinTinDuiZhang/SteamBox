package com.niuma.dao;

import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.Date;
import java.util.List;

public interface UserDao {
    public User getUser(String account , String password);
    public boolean addUser(User user);
    public List<Community> getLikeCommunity(int id);
}
