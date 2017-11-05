package com.fh.controller.system.order;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.order.OrderService;
import com.fh.util.*;
import com.fh.util.pay.PayAgency;
import com.fh.util.pay.alipay.AILPay;
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
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 类名称：OrderControllerController
 * 创建人：FH 
 * 创建时间：2017-07-16
 */
@Controller
@RequestMapping(value="/order")
public class OrderController extends BaseController {
	
	String menuUrl = "order/list.do"; //菜单地址(权限用)
	@Resource(name="orderService")
	private OrderService orderService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增OrderController");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDER_ID", this.get32UUID());    //主键
		orderService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除OrderController");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			orderService.delete(pd);
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
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改OrderController");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		orderService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表OrderController");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = orderService.list(page);	//列出OrderController列表
			mv.setViewName("system/ordercontroller/ordercontroller_list");
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
		logBefore(logger, "去新增OrderController页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/ordercontroller/ordercontroller_edit");
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
		logBefore(logger, "去修改OrderController页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = orderService.findById(pd);	//根据ID读取
			mv.setViewName("system/ordercontroller/ordercontroller_edit");
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
		logBefore(logger, "批量删除OrderController");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				orderService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出OrderController到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("账号ID");	//1
			titles.add("付款方式");	//2
			titles.add("运送方式");	//3
			titles.add("折扣");	//4
			titles.add("创建日期");	//5
			titles.add("备注");	//6
			titles.add("审核状态");	//7
			titles.add("退款状态");	//8
			titles.add("支付状态");	//9
			titles.add("库存余量");	//10
			titles.add("订单总金额");	//11
			titles.add("订单总兑换积分");	//12
			titles.add("运费总金额");	//13
			titles.add("商品总金额");	//14
			titles.add("商品总数量");	//15
			titles.add("是否有过修改");	//16
			titles.add("配送方式编码");	//17
			titles.add("配送方式名称");	//18
			titles.add("快递运单号");	//19
			titles.add("快递公司名称");	//20
			titles.add("确认发货备注");	//21
			titles.add("客户的附加要求");	//22
			titles.add("是否已经评论");	//23
			titles.add("订单获赠的积分");	//24
			dataMap.put("titles", titles);
			List<PageData> varOList = orderService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("ACCOUNT_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("PAY_TYPE"));	//2
				vpd.put("var3", varOList.get(i).getString("CARRY"));	//3
				vpd.put("var4", varOList.get(i).getString("REBATE"));	//4
				vpd.put("var5", varOList.get(i).getString("CREATE_DATE"));	//5
				vpd.put("var6", varOList.get(i).getString("REMARK"));	//6
				vpd.put("var7", varOList.get(i).getString("STATUS"));	//7
				vpd.put("var8", varOList.get(i).getString("REFUND_STATUS"));	//8
				vpd.put("var9", varOList.get(i).getString("PAY_STATUS"));	//9
				vpd.put("var10", varOList.get(i).getString("LOW_STOCKS"));	//10
				vpd.put("var11", varOList.get(i).getString("AMOUNT"));	//11
				vpd.put("var12", varOList.get(i).get("AMOUNT_EXCHANGE_SCORE").toString());	//12
				vpd.put("var13", varOList.get(i).getString("FEE"));	//13
				vpd.put("var14", varOList.get(i).getString("PTOTAL"));	//14
				vpd.put("var15", varOList.get(i).getString("QUANTITY"));	//15
				vpd.put("var16", varOList.get(i).getString("UPDATE_AMOUNT"));	//16
				vpd.put("var17", varOList.get(i).getString("EXPRESS_CODE"));	//17
				vpd.put("var18", varOList.get(i).getString("EXPRESS_NAME"));	//18
				vpd.put("var19", varOList.get(i).getString("EXPRESS_NO"));	//19
				vpd.put("var20", varOList.get(i).getString("EXPRESS_COMPANY_NAME"));	//20
				vpd.put("var21", varOList.get(i).getString("CONFIRM_SEND_PRODUCT_REMARK"));	//21
				vpd.put("var22", varOList.get(i).getString("OTHER_REQUIREMENT"));	//22
				vpd.put("var23", varOList.get(i).getString("CLOSED_COMMENT"));	//23
				vpd.put("var24", varOList.get(i).get("SCORE").toString());	//24
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

	//修改订单状态
	@RequestMapping(value="/alertState")
	@ResponseBody
	public String alertState(){
		logger.info("alertState");
		PageData data = getPageData();
		//检查id, state是否存在
		String id = data.getString("id");
		String state = data.getString("state");
		if (StringUtils.isBlank(id) || StringUtils.isBlank(state)){
			return ReturnJson.failed("参数无效");
		}
		data = selectOrder(id);
		if (data == null) return ReturnJson.failed("操作订单表失败");
		boolean isSuccess = alertStateHandle(data);
		return isSuccess? ReturnJson.success() : ReturnJson.failed();
	}

	//修改订单状态
	public boolean alertStateHandle(PageData aPageData){
		final String currentState = aPageData.getString("PAY_STATUS");
		String targetState;
		if(StringUtils.equalsIgnoreCase(currentState,Constants.STATE_GET)){
			targetState = Constants.STATE_SEND;
		}else if(StringUtils.equalsIgnoreCase(currentState,Constants.STATE_SEND)){
			targetState = Constants.STATE_SIGNIN;
		}else if(StringUtils.equalsIgnoreCase(currentState,Constants.STATE_SIGNIN)){
			targetState = Constants.STATE_FINISH;
		}else {
			targetState = Constants.STATE_BUG;
		}
//		switch (currentState){
//			case Constants.STATE_GET:
//				targetState = Constants.STATE_SEND;
//				break;
//			case Constants.STATE_SEND:
//				targetState = Constants.STATE_SIGNIN;
//				break;
//			case Constants.STATE_SIGNIN:
//				targetState = Constants.STATE_FINISH;
//				break;
//			default:
//				targetState = Constants.STATE_BUG;
//		}
		aPageData.put("PAY_STATUS", targetState);
		try {
			orderService.edit(aPageData);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	//查询订单
	public PageData selectOrder(String id){
		PageData pageData = new PageData();
		pageData.put("ORDER_ID", id);
		try {
			pageData = orderService.findById(pageData);
			return pageData;
		} catch (Exception e) {
			logger.info("orderServce.findById执行失败");
		}
		return null;
	}
}
