package com.csf.test;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Created by changqi.wu on 2018/3/15.
 */

public class Base {

    public static void main(String[] args) {
        option();
    }

    public static Map createMap(){
        Map map = new HashMap<>();
        map.put("x",1212);
        map.put("12","1212");
        return map;
    }

    public static Map createNullMap(){
        return null;
    }

    public static void option(){
        Optional<String> test = Optional.ofNullable("test");
        test.ifPresent( v -> System.out.println(v.length()));

        Optional<Map> map = Optional.ofNullable(createMap());
        map.ifPresent(m -> System.out.println(m.get("x")));

        map = Optional.ofNullable(createNullMap());
        map.ifPresent(m -> System.out.println(m.get("x")));
    }

}
