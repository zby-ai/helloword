package com.atguigu.ssm.bean;

public class Dep {
    private Integer dId;

    private String dName;

    public Dep() {
    }

    public Dep(Integer dId, String dName) {
        this.dId = dId;
        this.dName = dName;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName == null ? null : dName.trim();
    }

    @Override
    public String toString() {
        return "Dep{" +
                "dId=" + dId +
                ", dName='" + dName + '\'' +
                '}';
    }
}