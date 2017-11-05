package com.fh.controller.introwcount.introwcount;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.introwcount.introwcount.IntrowcountService;
import com.fh.util.*;
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
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：IntrowcountController
 * 创建人：FH 
 * 创建时间：2017-09-11
 */
@Controller
@RequestMapping(value="/introwcount")
public class IntrowcountApp extends BaseController {
	
	@Resource(name="introwcountService")
	private IntrowcountService introwcountService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/record")
	public void record(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logBefore(logger, "Introwcount");
		response.setContentType("text/html;charset=utf-8");
		PageData pd = new PageData();
		pd = this.getPageData();
		String time = DataUtil.stringData();
		pd.put("TIME", time);
		pd = introwcountService.findByTime(pd);
		if (pd == null){
			pd = new PageData();
			pd.put("TIME", time);
			pd.put("INTROWCOUNT_ID", this.get32UUID());	//主键
			pd.put("CREATETIME", DataUtil.stampToDate(System.currentTimeMillis()));
			pd.put("LATETIME", DataUtil.stampToDate(System.currentTimeMillis()));
			pd.put("TOTAL", 1);
			introwcountService.save(pd);
		} else {
			pd.put("LATETIME", DataUtil.stampToDate(System.currentTimeMillis()));
			int total = (int) pd.get("TOTAL");
			total += 1;
			pd.put("TOTAL", total);
			introwcountService.edit(pd);
		}
		response.getWriter().write(ReturnJson.success("记录成功"));
	}

	@RequestMapping(value="/notice")
	public void notice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logBefore(logger, "新增Introwcount");
		response.setContentType("text/html;charset=utf-8");
		Jedis jedis = new Jedis("115.159.78.127");
		jedis.auth("123456");
		String code = jedis.get("code");
		String describe = jedis.get("describe");
		response.getWriter().write(ReturnJson.success(""));
	}

}
