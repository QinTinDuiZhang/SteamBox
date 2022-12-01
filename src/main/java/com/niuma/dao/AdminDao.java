package com.niuma.dao;

import com.niuma.model.Admin;
import com.niuma.model.Community;

public interface AdminDao {
    /**
     * 管理员登陆
     *
     * @param account  管理员账号
     * @param password 管理员密码
     * @return 返回一个管理员对象
     */
    Admin login(String account, String password);       //管理员登陆

    /**
     * 添加社区
     *
     * @param community 传入一个community对象
     * @return 是否成功
     */
    Boolean addCommunity(Community community);         //添加社区

    /**
     * 修改社区
     *
     * @param community 传入一个community对象
     * @return 返回一个布尔值
     */
    Boolean updateCommunity(Community community);      //修改社区

    /**
     * 设置帖子可见与否,hidden为可见与否参数，第二个为帖子id
     *
     * @param hidden 为0/1的数字，0为不可见，1为可见
     * @param id     需要修改的帖子id
     * @return 是否成功
     */
    Boolean setPostLook(int hidden, int id);            //设置帖子可见与否
}
