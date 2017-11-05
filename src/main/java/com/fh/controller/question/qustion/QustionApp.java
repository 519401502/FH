package com.fh.controller.question.qustion;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.question.qustion.QustionService;
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
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：QustionController
 * 创建人：FH 
 * 创建时间：2017-08-24
 */
@Controller
@RequestMapping(value="/qustion")
public class QustionApp extends BaseController {
	
	String menuUrl = "qustion/list.do"; //菜单地址(权限用)
	@Resource(name="qustionService")
	private QustionService qustionService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/feedback")
	@ResponseBody
	public void save(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logBefore(logger, "新增Qustion");
		response.setContentType("text/html;charset=utf-8");
		PageData pd = new PageData();
		pd = getPageData();
		String question = pd.getString("QUESTION");
		if (StringUtils.isBlank(question)) {
			response.getWriter().println(ReturnJson.failed("内容不能为空"));
			return;
		}
		String integralId = pd.getString("INTEGRAL_ID");
		if (StringUtils.isBlank(integralId)){
			integralId = "无积分APP版本";
		}
		System.out.println(question + integralId);
		pd.put("INTEGRAL_ID", integralId);
		pd.put("QUESTION", question);
		pd.put("QUSTION_ID", this.get32UUID());	//主键
		pd.put("TIME", Long.toString(System.currentTimeMillis()));
		qustionService.save(pd);
		response.getWriter().write(ReturnJson.success("反馈成功"));
	}

}
