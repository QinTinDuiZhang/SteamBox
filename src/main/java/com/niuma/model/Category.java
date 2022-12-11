package com.niuma.model;

public class Category {
    private int id;             //分类ID
    private String name;        //分类名字
    private Boolean hidden;    //是否可见

    public Category(int id, String name, Boolean hidden) {
        this.id = id;
        this.name = name;
        this.hidden = hidden;
    }


    public Category() {
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

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", hidden=" + hidden +
                '}';
    }
}
