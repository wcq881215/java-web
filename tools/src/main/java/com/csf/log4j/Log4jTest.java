package com.csf.log4j;

import org.apache.log4j.Logger;

/**
 * Created by changqi.wu on 2017/7/27.
 */

public class Log4jTest {

    private static final Logger log = Logger.getLogger(Log4jTest.class);

    public static void main(String[] args) {
        testLog();
    }

    public static void testLog() {

        log.debug("debug -----      debug xxxxx");
        log.info( " info -----      info  xxxxx");
        log.warn( " warn -----      warn  xxxxx");
        log.error("error -----      error error " +System.currentTimeMillis());
        System.out.println("out");
    }



}
