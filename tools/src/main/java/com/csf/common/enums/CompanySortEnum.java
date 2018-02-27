package com.csf.common.enums;

public enum CompanySortEnum {
    INCOME("income"), PROFIT("profit"),
    IND_INCOME("industry.income"), IND_INCOME_RATIO("industry.income_ratio"), IND_PROFIT("industry.profit"), IND_PROFIT_RATIO("industry.profit_ratio"),
    PRO_INCOME("product.income"), PRO_PROFIT("product.profit"), PRO_PROFIT_RATIO("product.profit_ratio"), PRO_INCOME_RATIO("product.income_ratio"),
    MKTC("mktc"), PE("pe"),
    GPM("gpm");
    ;
    private String sort;

    CompanySortEnum(String sort) {
        this.sort = sort;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
