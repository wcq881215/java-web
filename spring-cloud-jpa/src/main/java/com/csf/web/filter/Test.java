package com.csf.web.filter;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by changqi.wu on 17-10-23.
 */
public class Test {

    private static Set<String> exclude_path = new HashSet<>();

    static {

        exclude_path.add("/web/maintain/detail/*");
    }


    public static void main(String[] args) {
        String path = "/web/maintain/detail/1";

        for (String paths : exclude_path) {
            if (path.matches(paths)) {
                System.out.println(paths + "has contain");
                return;
            }
        }

    }


}
