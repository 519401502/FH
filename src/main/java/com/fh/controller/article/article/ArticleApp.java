package com.fh.controller.article.article;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.article.article.ArticleService;
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
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

/** 
 * 类名称：ArticleController
 * 创建人：FH 
 * 创建时间：2017-10-16
 */
@Controller
@RequestMapping(value="/article")
public class ArticleApp extends BaseController {
	
	String menuUrl = "article/list.do"; //菜单地址(权限用)
	@Resource(name="articleService")
	private ArticleService articleService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/addarticle")
	public void addarticle(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logBefore(logger, "add Article");
		response.setContentType("text/html;charset=utf-8");
		PageData pd = new PageData();
		pd = this.getPageData();

		InputStream inputStream = request.getInputStream();
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
		String content = bufferedReader.readLine();
		StringBuilder builder = new StringBuilder();
		while (content != null) {
			builder.append(content);
			content = bufferedReader.readLine();
		}
		JSONObject jsonObject = JSONObject.fromObject(builder.toString());
		String WHO = jsonObject.getString("WHO");
		String TITLE = jsonObject.getString("TITLE");
		String URL = jsonObject.getString("URL");
		String TYPE = jsonObject.getString("TYPE");
		pd.put("WHO", WHO);
		pd.put("TITLE", TITLE);
		pd.put("URL", URL);
		pd.put("TYPE", TYPE);
		if (!isUrl(URL)){
			JSONObject json = new JSONObject();
			json.put("error", true);
			json.put("msg", "地址有误");
			response.getWriter().write(json.toString());
			return;
		}
		if (isRepetition(URL)){
			JSONObject json = new JSONObject();
			json.put("error", true);
			json.put("msg", "抱歉,地址重复了,或者已有人推荐此文章!");
			response.getWriter().write(json.toString());
			return;
		}
		System.out.println("接收到的信息是 =  " + WHO + TITLE + URL + TYPE);
		pd.put("ARTICLE_ID", this.get32UUID());	//主键
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		articleService.save(pd);
		JSONObject json = new JSONObject();
		json.put("error", false);
		json.put("msg", "提交成功,感谢您的推荐!");
		response.getWriter().write(json.toString());
	}

	private boolean isRepetition(String url){
		PageData pd = new PageData();
		pd.put("URL", url);
		try {
			PageData data = articleService.findUrl(pd);
			if (data == null)
				return false;
			if (data.isEmpty())
				return false;
			if (data.getString("URL") == null || data.getString("URL").equals("")){
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	private boolean isUrl(String url){
		if (url == null || url.equals(""))
			return false;
		Pattern pattern = Pattern
				.compile("^([hH][tT]{2}[pP]://|[hH][tT]{2}[pP][sS]://)(([A-Za-z0-9-~]+).)+([A-Za-z0-9-~\\/])+$");
		return pattern.matcher(url).matches();
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
