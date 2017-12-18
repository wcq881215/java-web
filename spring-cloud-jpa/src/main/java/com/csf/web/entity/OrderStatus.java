package com.csf.web.entity;

/**
 * Created by changqi.wu on 17-10-23.
 */
public enum OrderStatus {
    // 1:内勤录入等待生产，2生产中待发货，3已发货待安装 4安装完成等待客户确认 5 已完成
    in("1","内勤录入等待生产"),
    producting("2","内勤录入等待生产"),
    delivery("3","内勤录入等待生产"),
    packed("4","内勤录入等待生产"),
    finish("5","内勤录入等待生产");

    OrderStatus(String status,String msg){
        this.status = status;
        this.msg = msg;
    }

    private String status;
    private String msg;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static String getStatusMsg(String status){

        for(OrderStatus state :OrderStatus.values()){
            if(state.getStatus().equals(status)){
                return state.getMsg();
            }
        }
        return null;
    }
}
