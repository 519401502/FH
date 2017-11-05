package com.fh.util.pay.wxpay;

import com.fh.util.pay.IPay;
import com.fh.util.pay.wxpay.util.XMLParse;
import org.apache.poi.ss.formula.functions.T;
import org.dom4j.DocumentException;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

/**
 * Created by 18624915319 on 2017/7/18.
 */
public class WXPay implements IPay<String> {

    private OutputStream outputStream;
    private InputStream inputStream;
    private StringBuffer stringBuffer;
    private BufferedReader bufferedReader;
    private final String UTF8 = "UTF-8";

    @Override
    public String pay(String info) {
        if (info == null) return null;
        URL httpUrl = null;
        try {
            httpUrl = new URL("https://api.mch.weixin.qq.com/pay/unifiedorder");
            HttpURLConnection httpURLConnection = (HttpURLConnection)httpUrl.openConnection();
            httpURLConnection.setRequestProperty("Host", "api.mch.weixin.qq.com");
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setConnectTimeout(10000);
            httpURLConnection.setReadTimeout(10000);
            httpURLConnection.setRequestProperty("Accept-Charset", "utf-8");
            httpURLConnection.setRequestProperty("contentType", "utf-8");
            httpURLConnection.connect();
            outputStream = httpURLConnection.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream));
            writer.write(info);
            writer.flush();
            inputStream = httpURLConnection.getInputStream();
            bufferedReader = new BufferedReader(new InputStreamReader(inputStream, UTF8));
            stringBuffer = new StringBuffer();
            String line = null;
            while((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }
            String resp = stringBuffer.toString();
            System.out.println("微信订单" + resp);
            if (resp == null || resp.equals("")) return null;
            String wxCode = new XMLParse().parse(resp);
            if (wxCode == null) return null;
            return wxCode;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(stringBuffer != null) {
                try {
                    bufferedReader.close();
                } catch (IOException var14) {
                    var14.printStackTrace();
                }
            }
            if(inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException var13) {
                    var13.printStackTrace();
                }
            }
            if(outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException var12) {
                    var12.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public String refund(String info) {
        return null;
    }

    @Override
    public String query(String info) {
        return null;
    }

}
