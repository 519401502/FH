package com.fh.util.pay.wxpay.util;

/**
 * Created by xvhuichuang on 2017/7/5.
 */

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.util.Iterator;


public class XMLParse {


    private static final String return_code = "return_code";

    public String parse(String xml) throws Exception {
        // 把String转换为Document
        Document document = DocumentHelper.parseText(xml);
        //获取根节点元素对象
        Element node = document.getRootElement();
        // 当前节点下面子节点迭代器
        Iterator<Element> it = node.elementIterator();
        // 遍历
        while (it.hasNext()) {
            Element e = it.next();
            System.out.println(e.getText());
            if ("prepay_id".equals(e.getName())){
                return e.getText();
            }
        }
        return null;
    }
}