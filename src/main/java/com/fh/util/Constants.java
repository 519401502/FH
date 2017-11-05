package com.fh.util;

public class Constants {
	
	public static String PICTURE_VISIT_FILE_PATH = "";//图片访问的路径
	
	public static String PICTURE_SAVE_FILE_PATH = "";//图片存放的路径

	public final static int APP_RETURN_ERROR_CODE =  1; //返回失败标示
	public final static int APP_RETURN_SUCCESS_CODE =  0; //返回成功标示
	public final static int APP_RETURN_NO_INVITECODE =  10; //邀请码不存在

	public final static String PAY_NO = "n";
	public final static String PAY_YES = "y";

	//已收单
	public final static String STATE_GET = "1";
	//已发货
	public final static String STATE_SEND = "2";
	//已签收
	public final static String STATE_SIGNIN = "3";
	//已归档
	public final static String STATE_FINISH = "4";
	//代收单
	public final static String STATE_BUG = "0";
	
	public static String getPICTURE_VISIT_FILE_PATH() {
		return PICTURE_VISIT_FILE_PATH;
	}

	public static void setPICTURE_VISIT_FILE_PATH(String pICTURE_VISIT_FILE_PATH) {
		PICTURE_VISIT_FILE_PATH = pICTURE_VISIT_FILE_PATH;
	}

	public static String getPICTURE_SAVE_FILE_PATH() {
		return PICTURE_SAVE_FILE_PATH;
	}

	public static void setPICTURE_SAVE_FILE_PATH(String pICTURE_SAVE_FILE_PATH) {
		PICTURE_SAVE_FILE_PATH = pICTURE_SAVE_FILE_PATH;
	}

	public static void main(String[] args) {
		Constants.setPICTURE_SAVE_FILE_PATH("D:/Tomcat 6.0/webapps/FH/topic/");
		Constants.setPICTURE_VISIT_FILE_PATH("http://192.168.1.225:8888/FH/topic/");
	}
	
}
