package com.fh.controller.exception.xexception;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.exception.xexception.XExceptionService;
import com.fh.util.*;
import org.apache.commons.lang.StringUtils;
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
import javax.swing.plaf.ButtonUI;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：XExceptionController
 * 创建人：FH 
 * 创建时间：2017-10-16
 */
@Controller
@RequestMapping(value="/xexception")
public class XExceptionApp extends BaseController {
	
	String menuUrl = "xexception/list.do"; //菜单地址(权限用)
	@Resource(name="xexceptionService")
	private XExceptionService xexceptionService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/appcrash")
	public void appcrash(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logBefore(logger, "新增XException");
		response.setContentType("text/html;charset=utf-8");
		PageData pd = new PageData();
		pd = this.getPageData();
		InputStream inputStream = request.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
		String text = reader.readLine();
		StringBuilder builder = new StringBuilder();
		while (text != null){
			builder.append(text);
			text = reader.readLine();
		}
		pd = this.getPageData();
		if (builder.toString() != null) {
			pd.put("MESSAGE", builder.toString());
		}
		pd.put("APPCRASH", 0);
		pd.put("CREATETIME", DataUtil.stampToDate(System.currentTimeMillis()));
		pd.put("XEXCEPTION_ID", this.get32UUID());	//主键
		xexceptionService.save(pd);
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
