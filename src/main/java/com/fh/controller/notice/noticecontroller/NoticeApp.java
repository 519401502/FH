package com.fh.controller.notice.noticecontroller;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.notice.noticecontroller.NoticeControllerService;
import com.fh.util.*;
import com.google.gson.JsonObject;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：NoticeControllerController
 * 创建人：FH 
 * 创建时间：2017-10-14
 */
@Controller
@RequestMapping(value="/noticecontroller")
public class NoticeApp extends BaseController {
	
	String menuUrl = "noticecontroller/list.do"; //菜单地址(权限用)
	@Resource(name="noticecontrollerService")
	private NoticeControllerService noticecontrollerService;
	

	@RequestMapping(value="/info")
	public void info(HttpServletRequest request, HttpServletResponse response) throws IOException {
		logBefore(logger, "info");
		response.setContentType("text/html;charset=utf-8");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			PageData data = noticecontrollerService.findTopOne(pd);	//列出NoticeController列表
			JSONObject jsonObject = new JSONObject();
			JSONObject jsonData = pageDataToJson(data);
			if (jsonData == null){
				JSONObject json = new JSONObject();
				//code 是否成功 0成功 1失败
				json.put("code", 1);
				json.put("message", "");
				response.getWriter().write(json.toString());
				return;
			}
			//code 是否成功 0成功 1失败
			jsonObject.put("code", 0);
			jsonObject.put("message", jsonData);
			response.getWriter().write(jsonObject.toString());
			return;
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		JSONObject json = new JSONObject();
		//code 是否成功 0成功 1失败
		json.put("code", 1);
		json.put("message", "");
		response.getWriter().write(json.toString());
	}

	//PageData打包成Json
	private JSONObject pageDataToJson(PageData data){
		JSONObject jsonObject = new JSONObject();
		String code = data.getString("CODE");
		if (code == null || code.equals(""))
			return null;
		String message = data.getString("MESSAGE");
		if (message == null || message.equals(""))
			return null;
		int integral;
		try {
			integral = (int) data.get("INTEGRAL");
		}catch (Exception e){
			return null;
		}
		String version = data.getString("VERSION");
		if (version == null || message.equals(""))
			return null;
		String createTime = data.getString("create_time");
		if (createTime == null || createTime.equals(""))
			return null;
		jsonObject.put("code", code);
		jsonObject.put("message", message);
		jsonObject.put("integral", integral);
		jsonObject.put("version", version);
		jsonObject.put("create_time", createTime);
		return jsonObject;
	}


	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
