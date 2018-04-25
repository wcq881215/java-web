package com.csf.mongo;

import java.util.List;

/**
 * Created by changqi.wu on 2018/3/6.
 */

public class Link {

    private List<String> codes;

    public boolean addNode(String node){
        if(codes.contains(node)){
            codes.add(node);
            return false;
        }
        return true;
    }

    public List<String> getCodes() {
        return codes;
    }

    public void setCodes(List<String> codes) {
        this.codes = codes;
    }


}
