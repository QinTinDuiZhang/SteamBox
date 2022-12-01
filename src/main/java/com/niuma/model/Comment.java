package com.niuma.model;

import java.util.Date;

public class Comment {
    private int id;                       //评论ID
    private String content;               //评论内容
    private Date pubDate;                 //评论发布日期
    private String ipAddress;             //评论者的IP地址
    private boolean hidden;               //是否隐藏
    private int likeNum;                  //点赞数
    private int disLikeNum;               //点踩数
    private int replyForId;               //父评论ID
    private int creator;                  //创作者
    private int postId;                   //发送者ID

    public Comment(int id, String content, Date pubDate, String ipAddress, boolean hidden, int likeNum, int disLikeNum, int replyForId, int creator, int postId) {
        this.id = id;
        this.content = content;
        this.pubDate = pubDate;
        this.ipAddress = ipAddress;
        this.hidden = hidden;
        this.likeNum = likeNum;
        this.disLikeNum = disLikeNum;
        this.replyForId = replyForId;
        this.creator = creator;
        this.postId = postId;
    }

    public Comment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPubDate() {
        return pubDate;
    }

    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public boolean isHidden() {
        return hidden;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public int getDisLikeNum() {
        return disLikeNum;
    }

    public void setDisLikeNum(int disLikeNum) {
        this.disLikeNum = disLikeNum;
    }

    public int getReplyForId() {
        return replyForId;
    }

    public void setReplyForId(int replyForId) {
        this.replyForId = replyForId;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", pubDate=" + pubDate +
                ", ipAddress='" + ipAddress + '\'' +
                ", hidden=" + hidden +
                ", likeNum=" + likeNum +
                ", disLikeNum=" + disLikeNum +
                ", replyForId=" + replyForId +
                ", creator=" + creator +
                ", postId=" + postId +
                '}';
    }
}
