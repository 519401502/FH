package com.fh.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by gaoz on 17/7/7.
 *
 * json 返回值工具类
 */
public class ResponseUtil {
    private static final Logger logger = LoggerFactory
            .getLogger(ResponseUtil.class);
    private final static Integer success = 0;
    private final static Integer failed = 1;
    private Map<String, Object> result = new HashMap<String, Object>();

    public void setSuccess() {
        result.put("code", success);
    }

    public void setFailed() {
        result.put("code", failed);
    }

    public void setMsg(String msg) {
        result.put("msg", msg);
    }

    public void setData(List data) {
        if (data != null)
            result.put("data", data);
    }
    public void setData(Object data) {
        if (data != null)
            result.put("data", data);
    }

    public void setValue(String key, Object o) {
        result.put(key, o);
    }

    public String toJsonStr() {
        String json = "{}";
        try {
            json = JsonUtils.objToJson(result);
            logger.debug("response : " + json);
        } catch (Exception e) {
            logger.debug(e.getMessage(), e);
        }

        return json;
    }
}
