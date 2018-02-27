package com.csf.email;

import com.sun.mail.util.MailSSLSocketFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.security.GeneralSecurityException;
import java.util.Properties;

/**
 * Created by changqi.wu on 2018/2/27.
 */

public class EmailUtil {

    public static void main(String[] args) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo("changqi.wu@chinascope.com");
        mailMessage.setSubject("test ");
        mailMessage.setText("xxxxx");
        mailMessage.setFrom("changqi.wu@chinascope.com");
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.qiye.163.com");
        javaMailSender.setUsername("changqi.wu@chinascope.com");
        javaMailSender.setPassword("");
        javaMailSender.setPort(465);
        javaMailSender.setProtocol("smtp");
        javaMailSender.setDefaultEncoding("utf-8");
        MailSSLSocketFactory sf = null;
        try {
            sf = new MailSSLSocketFactory();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
        sf.setTrustAllHosts(true);

        Properties prop = new Properties();
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable", "true");//ssl安全协议
        prop.put("mail.smtp.ssl.socketFactory", sf);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.timeout", "25000");
        javaMailSender.setJavaMailProperties(prop);

        javaMailSender.send(mailMessage);

    }

}
