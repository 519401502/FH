package com.fh.util.sms;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Random;

/**
 * Created by 18624915319 on 2017/7/24.
 */
public class YunPianImpl implements ISMSCode {

    private static String code = null;
    private static ISMSCode sISMSCode = null;

    private YunPianImpl(){}

    public synchronized static ISMSCode getInstance(){
        if (sISMSCode == null) {
            sISMSCode = new YunPianImpl();
        }
        return sISMSCode;
    }

    @Override
    public boolean sendSMSCode(String phone) {
        String urlString = "http://sms.yunpian.com/v2/sms/single_send.json";
        URL url = null;
        try {
            //验证码,随机四位数字
            code = getCode();
            url = new URL(urlString);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Accept-Charset", "utf-8");
            connection.setRequestProperty("contentType", "utf-8");
            OutputStream outputStream = connection.getOutputStream();
            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(outputStream, "utf-8"));
            String con = "apikey=5a24b918c120b2082b342e3cf3aec227&" +
                    "mobile=" + phone + "&" +
                    "tpl_id=1891098&" +
                    "tpl_value=1234&text=【米伦科技】您的验证码是"+code;
            printWriter.write(con);
            printWriter.flush();
            InputStream inputStream = connection.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
            String str = bufferedReader.readLine();
            System.out.println("云片短信:" + str);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }

    public String getCode(){
        Random random = new Random();
        int code = random.nextInt(9999-1000+1)+1000;
        return String.valueOf(code);
    }

    @Override
    public boolean validSMSCode(String code_) {
        if (code_ == null) return false;
        if (code == null) return false;
        if (code.equals(code_)) return true;
        return false;
    }

}
