package com.niuma.test;

import com.niuma.impl.UserDaoImpl;
import com.niuma.model.Community;
import com.niuma.model.User;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        UserDaoImpl userDao = new UserDaoImpl();
        Boolean aBoolean = userDao.changePassword("test","123456");
        System.out.println(aBoolean);
    }

}
