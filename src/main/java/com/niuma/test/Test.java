package com.niuma.test;

import com.niuma.impl.UserDaoImpl;

public class Test {
    public static void main(String[] args) {
        UserDaoImpl userDao = new UserDaoImpl();
        Boolean aBoolean = userDao.changePassword("test", "123456");
        System.out.println(aBoolean);

    }

}
