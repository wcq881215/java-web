package com.jin.data.access.mysql;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

/**
 * Created by changqi.wu on 2017/10/18.
 */

public class DBConfig {

    public static final String cfg_file = "/common-mysql.properties";

    public static void test() {
        BasicDataSource bs = null;
        Properties p = new Properties();
        InputStream inStream = DBConfig.class.getResourceAsStream(cfg_file);
        try {
            p.load(inStream);
            bs = BasicDataSourceFactory.createDataSource(p);
            Connection conn = bs.getConnection();
            Statement stm = conn.createStatement();
            ResultSet set = stm.executeQuery("select count(*) from pub_area ");
            while (set.next()) {
                System.out.println("表总数为：" + set.getString(1));
            }
            conn.close();

        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        test();

    }
}
