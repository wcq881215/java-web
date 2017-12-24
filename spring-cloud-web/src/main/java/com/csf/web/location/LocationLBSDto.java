package com.csf.web.location;

import java.util.Map;

/**
 * Created by changqi.wu on 17-12-24.
 */
public class LocationLBSDto {

    private Integer status;
    private String message;
    private String request_id;
    private Result result;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRequest_id() {
        return request_id;
    }

    public void setRequest_id(String request_id) {
        this.request_id = request_id;
    }

    public Result getResult() {
        return result;
    }

    public void setResult(Result result) {
        this.result = result;
    }
}

class Result {

    private Map<String, Double> location;
    private String address;
    private Map<String, String> formatted_addresses;
    private Map<String, String> address_component;
    private Map<String, Object> ad_info;
    private Map<String, Object> address_reference;


    public Map<String, Double> getLocation() {
        return location;
    }

    public void setLocation(Map<String, Double> location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Map<String, String> getFormatted_addresses() {
        return formatted_addresses;
    }

    public void setFormatted_addresses(Map<String, String> formatted_addresses) {
        this.formatted_addresses = formatted_addresses;
    }

    public Map<String, String> getAddress_component() {
        return address_component;
    }

    public void setAddress_component(Map<String, String> address_component) {
        this.address_component = address_component;
    }

    public Map<String, Object> getAd_info() {
        return ad_info;
    }

    public void setAd_info(Map<String, Object> ad_info) {
        this.ad_info = ad_info;
    }

    public Map<String, Object> getAddress_reference() {
        return address_reference;
    }

    public void setAddress_reference(Map<String, Object> address_reference) {
        this.address_reference = address_reference;
    }
}
