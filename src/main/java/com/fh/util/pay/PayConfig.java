package com.fh.util.pay;

import java.util.UUID;

/**
 * Created by 18624915319 on 2017/7/18.
 */
public class PayConfig {

    //支付宝配置 - 正式环境
    public static final String gateway = "https://openapi.alipay.com/gateway.do";
    public static final String public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiSSV/9SR2YMwk9FoB1e1ExIFe0X/L0vA5w/9IS5qUO1QenYrOeUljLKavse23F8cExRF5vRGZDJU6XOF89OfOGhtOVz3BdfbrVL1DfkgDFPLH4isI2AcbmjodEJHsS8kNU1Mubs+MS2eoglHHs4FDlqnyWL6XZNRXztImbcs3t+JNndYut+092Jacc8CFAXzO/uO+8dfgJZrHgz82NHUrld7wEPgUk2pGFBWOgrlDBPaedDoLc3e+gmnzrwOMjcrFsfB6ORyNKZBFD0d+BNo5U4UGdWiUdvNfpftO5Kc1WbFtEt9hfP6brBOmaqrsrIkB2B0owhTnDfWXalU/WvCGQIDAQAB";
    public static final String appid = "2017071807794640";
    public static final String method = "alipay.trade.app.pay";
    public static final String charset = "utf-8";
    public static final String sign_type = "RSA2";
    public static final String version = "1.0";
    public static final String notify_url = "http://123.206.194.99:8082/aimilun/app/alipayResult";
    //public static final String notify_url = "http://xr6egq.natappfree.cc/app/alipayResult";
    public static final String private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQChAGlHMN9MBbwOtFMEmq9s1RGZWUNHhgjvpw512y0ob4xt2jRJhMWI+oDCXDUoZ+SgvcmYtZ7jiu/TxfgTlZWOMfsu1av6wb0F/jpktU8F06zp9nHmhtnTE9wuq1+qmBOjpgWWbtTLqL8YFHKz084kRjSZxpbqlCOhd8kiiG3yd6RGeb1kN2eOuDRcWvIfXrd/eizWclwzwa/3aaa5Cr3yUZaxUUoXXKZxKqjJq8Pe9etNI2Gi/Og6RwNNTeQ02fJLoJECJAxiKx5jAU6SRjqRMqXnQs9jka7L2OHbcl9wgszANaAVJOz7muBS8GdhvGAzTx4UrAlQxUYp+VJ8s/mvAgMBAAECggEAR6GNNXVTA9nRT6F/Bh9kSUGK8PU778h8lVN4JYt8Te9DRWS9uq/tywHY46Buril7GOEXnm+/33DjPw9nTh9RSNCH9tBuEcS8urvfcwsPu4Hv/q/9ARmiND0zyzfH+nhq1HZ7KfDpkCrlymrelY94ub7ajEhEwN1j9OT8gfa9JBDNpOYP+X+Y03o/4vKSMInjtusmZBieIcHvAzgzWaA8F/VuEfAfzCg1UxRTK++CiCsOdZ5mQXb0eB1ghPERD52Me5ixRBeEXkjmEXc9YM3Li6eX6ebaAiBNBsWRNQS5SbpzVha0AihABp88oO2JrucEfrGXitQ5AAbO+dP4X2zIwQKBgQDc2t12Z4Iew4BTbd6PUyBH3LLWFgL9s4U6N0CUFmC9dEZaNntZlOCN0Me2xPpth1t4oILIGLXZdOrSukZvyaqy4pII1U/5oiq/McsiEgksvCh55vgcjkN8MikZaNwAqX2FSVmTbi3IVKWF3Znou92ZNNWO5BM1cfn8Z+m5bxC1nwKBgQC6n0FqsIDvxne/hdzCkz67fF5SUNXlpzM8Bbz0NNDCGgv0uD1VCQ+MQxiPpdAP8vAz+yDbAM+nVgjCTEAaCLAdtCGBlVpvPNahOvaVXavMewUMXQRNpZN1tA5J1qRcygsMAMoD1Gy4UegaPearoarXcygvwA9oj92lhLeffECh8QKBgQCXWoKlL2B0FsTt6AC7NluMBAqnPuSD2zB1agIeuotHqtS/5FB6XtXZOnhzn+CDiVy9eTrHSG/ve/mlurSkzY7nEvDDjvRE/sbOyqAMVFHnT3dpu0jTwQcsqO+Tk1IaPg1gd5kkuUA05xWcfPaKEZ1W7mdgiptDaD3Kpaf+RcgsvwKBgE+5Svvl7R8BfRSPfhCNUKZNagnmSIo0FFoW5XK5wVi6QdNIhcL2/PJhk3OCVVEK6nx6Ur3cKdmFknZWlqfIgFwgIJQ4FosgxVvZUY/blVHkV/LBJd551nXY9qWqkUqmcXOuPp7GN6/CJdJYEVvO06n4ovlLJgn4M6rK+JqkPQQxAoGActXZPUOjhoZorRaAGHTbvqkMzLB9He5oZRiBm8Lutcfdp3U2xSplc/dJww5qyFPA4qRpjDf7gmZIjQ62IKMZ3lpI3We+riY/t6OZDTXvU3m+ZqZrvq4dw4vwgsGFW4dA9bTpAYRcJKGY7gL+9ARoRHqSSNjg8cjK6Xjq3XV/m+Q=";
    public static final String ProductCode = "QUICK_MSECURITY_PAY";
    public static final String timeoutExpress = "10d";

    //微信支付配置
    public static final String WX_MCH_ID = "1486622612";
    public static final String WX_SIGN_TYPE = "MD5";
    public static final String WX_FEE_TYPE = "CNY";
    public static final String WX_APPID = "wxb7580459ba7cf525";
    public static final String WX_NOTIFY_URL = "http://123.206.194.99:8082/aimilun/app/wxpayResult";
    //public static final String WX_NOTIFY_URL = "http://xr6egq.natappfree.cc/app/wxpayResult";
    public static final String WX_TRADE_TYPE = "APP";
    public static final String WX_KEY = "aimilunkejihenanaimilunkejihenan";
    public static final String WX_SPBILL_CREATE_IP = "127.0.0.1";

    public static String getWXPayXML(String body, String orderId, String sign, String fee, String nonceStr) {
        String reqBody = "<xml>"
                + "<body>" + body + "</body>"
                + "<trade_type>" + WX_TRADE_TYPE + "</trade_type>"
                + "<mch_id>" + WX_MCH_ID + "</mch_id>"
                + "<nonce_str>" + nonceStr + "</nonce_str>"
                + "<sign_type>" + WX_SIGN_TYPE + "</sign_type>"
                + "<detail />"
                + "<fee_type>" + WX_FEE_TYPE + "</fee_type>"
                + "<out_trade_no>" + orderId + "</out_trade_no>"
                + "<total_fee>" + fee + "</total_fee>"
                + "<appid>" + WX_APPID + "</appid>"
                + "<notify_url>" + WX_NOTIFY_URL + "</notify_url>"
                + "<sign>" + sign + "</sign>"
                + "<spbill_create_ip>" + WX_SPBILL_CREATE_IP + "</spbill_create_ip>"
                + "</xml>";
        return reqBody;
    }
}
