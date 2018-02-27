package com.csf.common.enums;

public enum StateDeleteEnum {
    /**
     * 已删除状态
     */
    DELETED(0),
    /**
     * 系统生成
     */
    ADD_BY_SYSTEM(1),
    /**
     * 人工维护
     */
    ADD_BY_USER(2);

    private int value;

    StateDeleteEnum(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

}
