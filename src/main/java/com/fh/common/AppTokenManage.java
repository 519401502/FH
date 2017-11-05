package com.fh.common;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/**
 * Created by gaoz on 17/7/10.
 */
public class AppTokenManage {

    /**
     * token验证 key:uid,val:token
     */
    public static HashMap<String, String> tokenValMap = new HashMap<String, String>();

    public static String validateToken(String token) {
        String uid = null;
        Set<String> keySet = tokenValMap.keySet();
        Iterator<String> iterator = keySet.iterator();
        while (iterator.hasNext()) {
            String id = iterator.next();
            if (tokenValMap.get(id).equals(token)) {
                uid = id;
                break;
            }
        }

        return uid;
    }
}
