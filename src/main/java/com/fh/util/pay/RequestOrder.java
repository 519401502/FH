package com.fh.util.pay;

/**
 * Created by 18624915319 on 2017/7/19.
 */
public class RequestOrder {

    private String userId;
    private String buyNumber;
    private String body;
    private String subject;
    private String totalAmount;
    private String payType;
    private String orderId;
    private String gname;
    private String gid;

    public String getGid() {
        return gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getBody() {
        return body;
    }

    public void setBuyNumber(String buyNumber) {
        this.buyNumber = buyNumber;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBuyNumber() {
        return buyNumber;
    }

    public String getUserId() {
        return userId;
    }
}
