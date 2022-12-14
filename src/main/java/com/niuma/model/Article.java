package com.niuma.model;

import java.util.Date;

public class Article {
    private int id;                 //发帖ID
    private String title;           //标题
    private String img;             //图片
    private String content;         //发布内容
    private Date pubDate;           //发布日期
    private int clickCount;         //点击数
    private int creator;            //创作者ID
    private int auditor;            //审核员ID
    private int communityId;        //发帖的社区ID
    private boolean hidden;         //是否可见
    private boolean back;           //是否通过

    public Article(int id, String title, String img, String content, Date pubDate, int clickCount, int creator, int auditor, int communityId, boolean hidden, boolean back) {
        this.id = id;
        this.title = title;
        this.img = img;
        this.content = content;
        this.pubDate = pubDate;
        this.clickCount = clickCount;
        this.creator = creator;
        this.auditor = auditor;
        this.communityId = communityId;
        this.hidden = hidden;
        this.back = back;
    }

    public Article() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public int getClickCount() {
        return clickCount;
    }

    public void setClickCount(int clickCount) {
        this.clickCount = clickCount;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public int getAuditor() {
        return auditor;
    }

    public void setAuditor(int auditor) {
        this.auditor = auditor;
    }

    public int getCommunityId() {
        return communityId;
    }

    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    public boolean isHidden() {
        return hidden;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public boolean isBack() {
        return back;
    }

    public void setBack(boolean back) {
        this.back = back;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", img='" + img + '\'' +
                ", content='" + content + '\'' +
                ", pubDate=" + pubDate +
                ", clickCount=" + clickCount +
                ", creator=" + creator +
                ", auditor=" + auditor +
                ", communityId=" + communityId +
                ", hidden=" + hidden +
                ", back=" + back +
                '}';
    }
}
