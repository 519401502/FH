package com.fh.controller.kit.kit;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.kit.kit.KitService;
import com.fh.util.*;
import net.sf.json.JSONArray;
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
 * 类名称：KitController
 * 创建人：FH 
 * 创建时间：2017-10-18
 */
@Controller
@RequestMapping(value="/kit")
public class KitApp extends BaseController {
	
	String menuUrl = "kit/list.do"; //菜单地址(权限用)
	private final int SHOW = 0;
	@Resource(name="kitService")
	private KitService kitService;

	/**
	 * 列表
	 */
	@RequestMapping(value="/getdata")
	public void getdata(HttpServletRequest request, HttpServletResponse response){
		logBefore(logger, "getData");
		response.setContentType("text/html;charset=utf-8");
		JSONObject result;
		PageData pd = new PageData();
		try{
			List<PageData> varList = kitService.listAll(pd);
			int length = varList.size();
			JSONArray array = new JSONArray();
			for (int i = 0; i< length; i++){
				PageData data = varList.get(i);
				int isShow = (int) data.get("IS_SHOW");
				if (isShow != SHOW)
					continue;
				array.add(pageToJSON(data));
			}
			result = new JSONObject();
			result.put("code", 0);
			result.put("msg", array);
			response.getWriter().write(result.toString());
		} catch(Exception e){
			logger.error(e.toString(), e);
			try {
				result = new JSONObject();
				result.put("code", 1);
				result.put("msg", "服务器处理异常");
				response.getWriter().write(result.toString());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	private JSONObject pageToJSON(PageData data){
		if (data == null)
			return new JSONObject();
		String title = data.getString("TITLE");
		String srcPath = data.getString("SRC_PATH");
		int integral;
		try {
			integral = (int) data.get("INTEGRAL");
		}catch (Exception e){
			integral = 0;
		}
		String type1 = data.getString("TYPE1");
		String type2 = data.getString("TYPE2");
		String desc = data.getString("SRC_DESC");
		String id = data.getString("KIT_ID");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		title = title != null ? title : "null";
		jsonObject.put("title", title);
		srcPath = srcPath != null ? srcPath : "null";
		jsonObject.put("srcpath", srcPath);
		jsonObject.put("integral", integral);
		type1 = type1 != null ? type1 : "null";
		jsonObject.put("type1", type1);
		type2 = type2 != null ? type2 : "null";
		jsonObject.put("type2", type2);
		desc = desc != null ? desc : "null";
		jsonObject.put("desc", desc);
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
