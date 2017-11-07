package com.csf.web.entity;

/**
 * Created by changqi.wu on 17-10-2.
 */
public enum UserRole {

    ADMIN("admin", "管理员"),
    TECHNICIAN("technician", "技术员"),
    OFFICE("office", "内勤"),
    SERVICE("sale", "售后服务"),
    MANAGER("manager", "售后管理"),
    CUSTOMER("customer", "购机客户");

    private String role;
    private String name;

    private UserRole(String role, String name) {
        this.role = role;
        this.name = name;
    }

    public static String getRole(String name) {
        for (UserRole role : UserRole.values()) {
            if (role.getName().equals(name)) {
                return role.getRole();

            }
        }
        return null;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
