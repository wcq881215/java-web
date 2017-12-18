package com.csf.web.test;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by changqi.wu on 17-11-11.
 */
public class DaoTest {
    private static Connection connection;
    private static PreparedStatement state = null;

    public static void main(String[] args) {
        connect();
        readFile();
    }

    public static void insert(String sql) {
        try {
            state = connection.prepareStatement(sql);
            boolean result = state.execute();
            System.out.println("execute " + result);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void readFile() {
        String file = "/home/changqi.wu/data1.txt";
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(new File(file)));
            String line = null;
            String insertSql = "insert into haohai_data(period,data) values ";
            StringBuilder sb = new StringBuilder(insertSql);
            int sie = 100;
            int i = 0;
            String prexif = "('", subfix = "'),";
            while ((line = br.readLine()) != null) {
                i++;
                line = prexif + line.replace("=", "','") + subfix;
                sb.append(line).append("\n");
                if (i == sie) {
                    sb.setCharAt(sb.length() - 2, ';');
                    insert(sb.toString());
//                    System.out.println(sb.toString());
                    i = 0;
                    sb = new StringBuilder(insertSql);
                }
            }
            br.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void connect() {
        String url = "jdbc:mysql://119.28.12.118:3306/haohai?useUnicode=true&amp;characterEncoding=UTF-8";
        String username = "root";
        String password = "13524309647,./";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void read() {
        String file = "/home/changqi.wu/data.txt";
        try {
            BufferedReader br = new BufferedReader(new FileReader(new File(file)));
            String line = br.readLine();
            line = line.replace("\\r\\n", "\n");
            System.out.println(line);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
