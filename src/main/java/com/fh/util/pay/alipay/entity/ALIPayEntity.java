package com.fh.util.pay.alipay.entity;

/**
 * Created by 18624915319 on 2017/7/18.
 */
public class ALIPayEntity {

    private String body;
    private String subject;
    private String outTradeNo;
    private String timeoutExpress;
    private String totalAmount;
    private String productCode;

    public String getBody() {
        return body;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public String getProductCode() {
        return productCode;
    }

    public String getSubject() {
        return subject;
    }

    public String getTimeoutExpress() {
        return timeoutExpress;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setTimeoutExpress(String timeoutExpress) {
        this.timeoutExpress = timeoutExpress;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }
}
