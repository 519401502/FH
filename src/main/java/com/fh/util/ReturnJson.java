package com.fh.util;

/**
 * Created by 18624915319 on 2017/7/19.
 */
public class ReturnJson {

    public static String success(){
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setSuccess();
        responseUtil.setMsg("success");
        return responseUtil.toJsonStr();
    }

    public static String success(String message){
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setSuccess();
        responseUtil.setMsg(message);
        return responseUtil.toJsonStr();
    }

    public static String failed(String message){
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setFailed();
        responseUtil.setMsg(message);
        return responseUtil.toJsonStr();
    }

    public static String returnValue(Integer status,String message){
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setValue("code", status);
        responseUtil.setMsg(message);
        return responseUtil.toJsonStr();
    }

    public static String failed(){
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setFailed();
        responseUtil.setMsg("error");
        return responseUtil.toJsonStr();
    }
}
