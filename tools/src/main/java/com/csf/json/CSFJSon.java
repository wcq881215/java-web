package com.csf.json;

/**
 * Created by changqi.wu on 2017/8/10.
 */

public class CSFJSon {

    private String json = "{}";

    public CSFJSon(String json) {
        this.json = json;
    }

    public String add() {
        return json;
    }

    public String add(String node,String json) {
        return json;
    }

    public String delete() {
        return json;
    }

    public String query() {
        return json;
    }

    public String update() {
        return json;
    }

    public static void main(String[] args) {
        CSFJSon csfjSon = new CSFJSon("{}");


    }
}
