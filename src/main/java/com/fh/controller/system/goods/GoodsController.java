package com.fh.controller.system.goods;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.goods.GoodsService;
import com.fh.util.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：GoodsController
 * 创建人：FH 
 * 创建时间：2017-07-14
 */
@Controller
@RequestMapping(value="/goods")
public class GoodsController extends BaseController {
	
	String menuUrl = "goods/list.do"; //菜单地址(权限用)
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(@RequestParam(value="tp",required=false) MultipartFile file,
							 @RequestParam(value="GNAME",required=false) String GNAME,
							 @RequestParam(value="GPRICE",required=false) String GPRICE,
							 @RequestParam(value="GNOW_PRICE",required=false) String GNOW_PRICE) throws Exception{
		logBefore(logger, "新增Goods");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("GOODS_ID", this.get32UUID());	//主键
		pd.put("GNAME",GNAME);
		pd.put("GPRICE",GPRICE);
		pd.put("GDESC","");
		pd.put("GPIC_SALE",0);
		pd.put("GNOW_PRICE",GNOW_PRICE);
		String  ffile = "goods";
		String fileName = "";
		String filePath = "";
		if (null != file && !file.isEmpty()) {
			filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			pd.put("GPIC_PATH",ffile + "/" + fileName);
		}
		goodsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Goods");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd =  goodsService.findById(pd);
			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("GPIC_PATH")); //删除图片
			goodsService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam(value="tp",required=false) MultipartFile file,
							 @RequestParam(value="GNAME",required=false) String GNAME,
							 @RequestParam(value="GOODS_ID",required=false) String GOODS_ID,
							 @RequestParam(value="GPRICE",required=false) String GPRICE,
							 @RequestParam(value="GNOW_PRICE",required=false) String GNOW_PRICE) throws Exception{
		logBefore(logger, "修改Goods");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("GOODS_ID", GOODS_ID);	//主键
		pd.put("GNAME",GNAME);
		pd.put("GPRICE",GPRICE);
		pd.put("GDESC","");
		pd.put("GNOW_PRICE",GNOW_PRICE);

		String  ffile = "goods";
		String fileName = "";
		String filePath = "";
		if (null != file && !file.isEmpty()) {
			filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			pd.put("GPIC_PATH",ffile + "/" + fileName);
		}
		goodsService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/deltp")
	public void deltp(PrintWriter out) {
		logBefore(logger, "删除Home");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} //校验权限
		PageData pd = new PageData();
		PageData pdd = new PageData();
		try {
			pd = this.getPageData();
			pd = goodsService.findById(pd);    //列出Home列表
			if(pd != null){
				DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("GPIC_PATH")); //删除图片
				pd.put("GPIC_PATH","");
				goodsService.edit(pd);
			}
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Goods");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = goodsService.list(page);	//列出Goods列表
			mv.setViewName("system/goods/goods_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Goods页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/goods/goods_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Goods页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = goodsService.findById(pd);	//根据ID读取
			mv.setViewName("system/goods/goods_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Goods");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			List<PageData> pathList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				pathList = goodsService.getAllById(ArrayDATA_IDS);
				//删除图片
				for(int i=0;i<pathList.size();i++){
					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pathList.get(i).getString("GPIC_PATH"));
				}
				goodsService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Goods到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("商品名称");	//1
			titles.add("商品价格");	//2
			titles.add("现价");	//3
			titles.add("商品描述");	//4
			titles.add("商品图片地址");	//5
			dataMap.put("titles", titles);
			List<PageData> varOList = goodsService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("GNAME"));	//1
				vpd.put("var2", varOList.get(i).getString("GPRICE"));	//2
				vpd.put("var3", varOList.get(i).getString("GNOW_PRICE"));	//3
				vpd.put("var4", varOList.get(i).getString("GDESC"));	//4
				vpd.put("var5", varOList.get(i).getString("GPIC_PATH"));	//5
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
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
