package com.fh.util.pay.alipay;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.request.AlipayOpenPublicTemplateMessageIndustryModifyRequest;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayOpenPublicTemplateMessageIndustryModifyResponse;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.fh.util.pay.IPay;
import com.fh.util.pay.PayAgency;
import com.fh.util.pay.PayConfig;
import com.fh.util.pay.alipay.entity.ALIPayEntity;

/**
 * Created by 18624915319 on 2017/7/18.
 */
public class AILPay implements IPay<ALIPayEntity> {

    @Override
    public String pay(ALIPayEntity info) {
        AlipayClient alipayClient = new DefaultAlipayClient(PayConfig.gateway,
                PayConfig.appid, PayConfig.private_key, "json",
                PayConfig.charset, PayConfig.public_key, PayConfig.sign_type);
        AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setBody(info.getBody());
        model.setSubject(info.getSubject());
        model.setOutTradeNo(info.getOutTradeNo());
        model.setTimeoutExpress(info.getTimeoutExpress());
        model.setTotalAmount(info.getTotalAmount());
        model.setProductCode(info.getProductCode());
        request.setBizModel(model);
        request.setNotifyUrl(PayConfig.notify_url);
        try {
            AlipayTradeAppPayResponse response = alipayClient.sdkExecute(request);
            String body = response.getBody();
            return body;
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String refund(ALIPayEntity info) {
        return null;
    }

    @Override
    public String query(ALIPayEntity info) {
        return null;
    }
}
