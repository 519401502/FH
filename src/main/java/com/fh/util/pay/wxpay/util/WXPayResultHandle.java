package com.fh.util.pay.wxpay.util;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by xvhuichuang on 2017/7/7.
 */
public class WXPayResultHandle {

    public static WXPayResult handleResult(String xmlResult){
        Document document = null;
        try {
            document = DocumentHelper.parseText(xmlResult);
            //获取根节点元素对象
            Element node = document.getRootElement();
            // 当前节点下面子节点迭代器
            Iterator<Element> it = node.elementIterator();
            // 遍历
            WXPayResult wxPayResult = new WXPayResult();
            while (it.hasNext()) {
                Element e = it.next();
                if (e.getName() == null) continue;
                switch (e.getName()){
                    case "appid":
                        wxPayResult.setAppid(e.getText());
                        break;
                    case "bank_type":
                        wxPayResult.setBank_type(e.getText());
                        break;
                    case "cash_fee":
                        wxPayResult.setCash_fee(e.getText());
                        break;
                    case "device_info":
                        wxPayResult.setDevice_info(e.getText());
                        break;
                    case "fee_type":
                        wxPayResult.setFee_type(e.getText());
                        break;
                    case "is_subscribe":
                        wxPayResult.setIs_subscribe(e.getText());
                        break;
                    case "mch_id":
                        wxPayResult.setMch_id(e.getText());
                        break;
                    case "nonce_str":
                        wxPayResult.setNonce_str(e.getText());
                        break;
                    case "openid":
                        wxPayResult.setOpenid(e.getText());
                        break;
                    case "out_trade_no":
                        wxPayResult.setOut_trade_no(e.getText());
                        break;
                    case "result_code":
                        wxPayResult.setResult_code(e.getText());
                        break;
                    case "return_code":
                        wxPayResult.setReturn_code(e.getText());
                        break;
                    case "sign":
                        wxPayResult.setSign(e.getText());
                        break;
                    case "time_end":
                        wxPayResult.setTime_end(e.getText());
                        break;
                    case "total_fee":
                        wxPayResult.setTotal_fee(e.getText());
                        break;
                    case "trade_type":
                        wxPayResult.setTrade_type(e.getText());
                        break;
                    case "transaction_id":
                        wxPayResult.setTransaction_id(e.getText());
                        break;
                    default:
                        continue;
                }
            }
            return wxPayResult;
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Map<String, String> handleRefundResult(String xmlResult){
        Document document = null;
        Map<String, String> maps = new HashMap<String, String>();
        try {
            document = DocumentHelper.parseText(xmlResult);
            //获取根节点元素对象
            Element node = document.getRootElement();
            // 当前节点下面子节点迭代器
            Iterator<Element> it = node.elementIterator();
            // 遍历
            WXPayResult wxPayResult = new WXPayResult();
            while (it.hasNext()) {
                Element e = it.next();
                if (e.getName() == null) continue;
                if (e.getName().equals("return_code")){
                    maps.put("return_code", e.getText());
                }
                if (e.getName().equals("result_code")){
                    maps.put("result_code", e.getText());
                }
                if (e.getName().equals("err_code_des")){
                    maps.put("err_code_des", e.getText());
                }
            }
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return maps;
    }

}
