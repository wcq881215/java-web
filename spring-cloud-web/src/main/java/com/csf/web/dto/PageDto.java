package com.csf.web.dto;

/**
 * Created by changqi.wu on 17-10-8.
 */
public class PageDto {
    private Long total;
    private Integer page;
    private Integer pageSize;
    private boolean isLast;
    private Object data;

    public PageDto() {

    }

    public PageDto(Integer page, Integer pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
        if (pageSize != null && page != null) {
            if (total / pageSize > page + 1) {
                this.isLast = false;
            } else {
                this.isLast = true;
            }

        }
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public boolean isLast() {
        return isLast;
    }

    public void setLast(boolean last) {
        isLast = last;
    }
}
