package com.niuma.model;

public class Community {
    private int id;                 //社区ID
    private String name;            //社区名字
    private String shopLink;        //折扣商店链接
    private Boolean hidden;         //是否可见

    public Community(int id, String name, String shopLink, Boolean hidden) {
        this.id = id;
        this.name = name;
        this.shopLink = shopLink;
        this.hidden = hidden;
    }

    public Community() {
    }

    public Boolean getHidden() {
        return hidden;
    }

    public void setHidden(Boolean hidden) {
        this.hidden = hidden;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShopLink() {
        return shopLink;
    }

    public void setShopLink(String shopLink) {
        this.shopLink = shopLink;
    }

    @Override
    public String toString() {
        return "Community{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", shopLink='" + shopLink + '\'' +
                ", hidden=" + hidden +
                '}';
    }
}
