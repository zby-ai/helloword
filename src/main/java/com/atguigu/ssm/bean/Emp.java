package com.atguigu.ssm.bean;

import javax.validation.constraints.Pattern;

public class Emp {
    private Integer eId;
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,6}$)",
            message = "姓名必须由6-16位字母下划线或2-6位汉字组成" )
    private String eName;
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "邮箱格式错误")
    private String eEmail;
    @Pattern(regexp = "^(?:[1-9][0-9]?|1[01][0-9]|120)$",
            message = "年龄不合法(年龄范围1-120)")
    private String eAge;

    private String eSax;

    private Integer dId;

    private Dep dep;

    public Emp() {
    }


    public Emp(Integer eId, String eName, String eEmail, String eAge, String eSax, Integer dId, Dep dep) {
        this.eId = eId;
        this.eName = eName;
        this.eEmail = eEmail;
        this.eAge = eAge;
        this.eSax = eSax;
        this.dId = dId;
        this.dep = dep;
    }

    public String geteEmail() {
        return eEmail;
    }

    public void seteEmail(String eEmail) {
        this.eEmail = eEmail;
    }

    public Dep getDep() {
        return dep;
    }

    public void setDep(Dep dep) {
        this.dep = dep;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName == null ? null : eName.trim();
    }

    public String geteAge() {
        return eAge;
    }

    public void seteAge(String eAge) {
        this.eAge = eAge;
    }

    public String geteSax() {
        return eSax;
    }

    public void seteSax(String eSax) {
        this.eSax = eSax == null ? null : eSax.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "eId=" + eId +
                ", eName='" + eName + '\'' +
                ", eEmail='" + eEmail + '\'' +
                ", eAge=" + eAge +
                ", eSax='" + eSax + '\'' +
                ", dId=" + dId +
                ", dep=" + dep +
                '}';
    }
}