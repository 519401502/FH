package com.fh.controller.signranking.signranking;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.signranking.signranking.SignRankingService;
import com.fh.util.*;
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
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：SignRankingController
 * 创建人：FH 
 * 创建时间：2017-10-22
 */
@Controller
@RequestMapping(value="/signranking")
public class SignRankingApp extends BaseController {
	
	String menuUrl = "signranking/list.do"; //菜单地址(权限用)
	@Resource(name="signrankingService")
	private SignRankingService signrankingService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/getranking")
	public void getRanking(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logBefore(logger, "新增SignRanking");
		response.setContentType("text/html;charset=utf-8");

		JSONObject jsonObject = new JSONObject();
		String name = request.getParameter("name");
		System.out.println(name);
		System.out.println("-----------");
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.put("CURRENTDATE", Tools.currentDate(new Date()));
			PageData result = signrankingService.findByTime(pd);
			if (result == null) {
				result = new PageData();
				result.put("SIGNRANKING_ID", this.get32UUID());    //主键
				result.put("CREATE_TIME", Tools.date2Str(new Date()));    //最早签到时间
				result.put("UPDATE_TIME", Tools.date2Str(new Date()));    //最晚签到时间
				result.put("CURRENTDATE", Tools.currentDate(new Date()));    //今天的日期
				result.put("RANKING", 1);
				signrankingService.save(result);
				jsonObject.put("code", 0);
				jsonObject.put("msg", 1);
				response.getWriter().write(jsonObject.toString());
			} else {
				int ranking;
				try {
					ranking = (int) result.get("RANKING");
				} catch (Exception e) {
					ranking = 0;
				}
				result.put("UPDATE_TIME", Tools.date2Str(new Date()));    //最晚签到时间
				result.put("RANKING", ++ranking);
				signrankingService.edit(result);
				jsonObject.put("code", 0);
				jsonObject.put("msg", ranking);
				response.getWriter().write(jsonObject.toString());
			}
		}catch (Exception e){
			jsonObject.put("code", 1);
			jsonObject.put("msg", "服务器发生未知错误");
			response.getWriter().write(jsonObject.toString());
		}
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
