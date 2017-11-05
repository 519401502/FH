package com.fh.util.pay;

/**
 * Created by 18624915319 on 2017/7/18.
 */
public class PayAgency {

    private IPay mIPay;

    public PayAgency(IPay aIPay){
        mIPay = aIPay;
    }

    public <T> String pay(T info){
        return mIPay.pay(info);
    }
}
