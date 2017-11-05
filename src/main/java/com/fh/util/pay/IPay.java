package com.fh.util.pay;

/**
 * Created by 18624915319 on 2017/7/18.
 */
public interface IPay<T> {

    String pay(T info);

    String refund(T info);

    String query(T info);

}
