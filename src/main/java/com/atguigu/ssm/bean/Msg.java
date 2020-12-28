package com.atguigu.ssm.bean;


import java.util.HashMap;

/**
 * Msg 作为统一的回响的对象
 * @author zbystart
 * @create 2020-12-22 19:02
 */
public class Msg {
    //100 表示成功，200表示失败
    private  Integer code;
    //存放回应的数据
    private HashMap<String ,Object> msg = new HashMap<>();

    private Msg() {
    }
    public Msg add(String str,Object obj){
        this.getMsg().put(str,obj);
        return this;
    }
    //代表响应成功
    public static Msg succeed(){
        Msg msg = new Msg(100);
        return msg;
    }
    public static Msg fail(){
        Msg msg = new Msg(200);
        return msg;
    }

    private Msg(Integer code) {
        this.code = code;
    }

    private Msg(Integer code, HashMap<String, Object> msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public HashMap<String, Object> getMsg() {
        return msg;
    }

    public void setMsg(HashMap<String, Object> msg) {
        this.msg = msg;
    }
}
