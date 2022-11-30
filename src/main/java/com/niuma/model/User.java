package com.niuma.model;

import java.util.Date;

public class User {
    private int id;                     //用户ID
    private String account;             //用户账号
    private String password;            //用户密码
    private String nickName;            //昵称
    private String photo;               //用户头像
    private Date birthday;              //用户生日
    private String email;               //用户邮箱
    private String mobile;              //用户手机号码
    private Date regDate;               //用户注册时间
    private boolean forbidden;          //是否可见

    public User(int id, String account, String password, String nickName, String photo, Date birthday, String email, String mobile, Date regDate, boolean forbidden) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.nickName = nickName;
        this.photo = photo;
        this.birthday = birthday;
        this.email = email;
        this.mobile = mobile;
        this.regDate = regDate;
        this.forbidden = forbidden;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public boolean isForbidden() {
        return forbidden;
    }

    public void setForbidden(boolean forbidden) {
        this.forbidden = forbidden;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", photo='" + photo + '\'' +
                ", birthday=" + birthday +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", regDate=" + regDate +
                ", forbidden=" + forbidden +
                '}';
    }
}
