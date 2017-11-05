package com.fh.util.pay.wxpay.util;

/**
 * Created by xvhuichuang on 2017/7/7.
 */
public class WXPayResult {

    //公众账号id
    String appid;
    //付款银行
    String bank_type;
    //现金支付金额
    String cash_fee;
    //设备号
    String device_info;
    //货币种类
    String fee_type;
    //是否关注公众账号
    String is_subscribe;
    //商户号
    String mch_id;
    //随机字符串
    String nonce_str;
    //用户标识
    String openid;
    //商户订单号
    String out_trade_no;
    //业务结果
    String result_code;
    String return_code;
    //签名
    String sign;
    //支付完成时间
    String time_end;
    //订单金额
    String total_fee;
    //交易类型
    String trade_type;
    //微信支付订单号
    String transaction_id;

    public void setAppid(String appid){
        this.appid = appid;
    }

    public void setBank_type(String bank_type){
        this.bank_type = bank_type;
    }

    public void setCash_fee(String cash_fee) {
        this.cash_fee = cash_fee;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public void setIs_subscribe(String is_subscribe) {
        this.is_subscribe = is_subscribe;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public void setResult_code(String result_code) {
        this.result_code = result_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }

    public void setTotal_fee(String total_fee) {
        this.total_fee = total_fee;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getAppid() {
        return appid;
    }

    public String getBank_type() {
        return bank_type;
    }

    public String getCash_fee() {
        return cash_fee;
    }

    public String getDevice_info() {
        return device_info;
    }

    public String getFee_type() {
        return fee_type;
    }

    public String getIs_subscribe() {
        return is_subscribe;
    }

    public String getMch_id() {
        return mch_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public String getOpenid() {
        return openid;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public String getResult_code() {
        return result_code;
    }

    public String getReturn_code() {
        return return_code;
    }

    public String getSign() {
        return sign;
    }

    public String getTime_end() {
        return time_end;
    }

    public String getTotal_fee() {
        return total_fee;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

}
