package com.niuma.dao;

import com.niuma.model.Admin;
import com.niuma.model.Community;

public interface AdminDao {
    public Admin login(String account,String password);       //管理员登陆
    public Boolean addCommunity(Community community);         //添加社区
    public Boolean updateCommunity(Community community);      //修改社区
    public Boolean setPostLook(int hidden,int id);            //设置帖子可见与否
}
