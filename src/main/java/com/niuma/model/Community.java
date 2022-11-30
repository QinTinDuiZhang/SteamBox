package com.niuma.model;

public class Community {
    private int id;                 //社区ID
    private String name;            //社区名字
    private String shopLink;        //折扣商店链接

    public Community(int id, String name, String shopLink) {
        this.id = id;
        this.name = name;
        this.shopLink = shopLink;
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
                '}';
    }
}
