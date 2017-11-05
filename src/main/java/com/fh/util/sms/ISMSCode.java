package com.fh.util.sms;

/**
 * Created by xvhuichuang on 2017/6/29.
 */
public interface ISMSCode {

    boolean sendSMSCode(String phone);

    boolean validSMSCode(String code);

}
