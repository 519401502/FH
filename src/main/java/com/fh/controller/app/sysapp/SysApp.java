package com.fh.controller.app.sysapp;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.appuser.AppUserA0Service;
import com.fh.service.system.broad.BroadService;
import com.fh.service.system.goods.GoodsService;
import com.fh.service.system.notice.NoticeService;
import com.fh.service.system.order.OrderService;
import com.fh.service.system.ranking.RankingService;
import com.fh.service.system.user.UserService;
import com.fh.service.system.withdrawals.WithdrawalsService;
import com.fh.system.SystemStaticData;
import com.fh.util.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by gaoz on 17/7/17.
 */
@Controller
@RequestMapping(value = "/app")
public class SysApp extends BaseController {
    @Resource(name = "noticeService")
    private NoticeService noticeService;

    @Resource(name = "broadService")
    private BroadService broadService;

    @Resource(name = "rankingService")
    private RankingService rankingService;

    @Resource(name = "withdrawalsService")
    private WithdrawalsService withdrawalsService;

    @Resource(name = "orderService")
    private OrderService orderService;

    @Resource(name="appusera0Service")
    private AppUserA0Service appusera0Service;
    /**
      * 获取最新新闻
     */
    @RequestMapping(value = "/getNewNotice", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getNewNotice() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();

        try {
            pd = noticeService.findNewNotice(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取公告信息失败！");
        }

        return reponseUtil.toJsonStr();
    }

    /**
     * 获取最新新闻
     */
    @RequestMapping(value = "/getListNotice", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getListNotice() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();

        try {
            int page = 0;
            int maxCount = 10;
            if(StringUtils.isNotBlank(pd.getString("PAGE"))){
                page = Integer.valueOf(pd.getString("PAGE"));
            }

            pd.put("MAXR",page * maxCount + maxCount);
            pd.put("MINR",page * maxCount);
            List<PageData> varList = noticeService.findPageNotice(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(varList);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取公告信息失败！");
        }

        return reponseUtil.toJsonStr();
    }
    /**
     * 获取我的订单
     */
    @RequestMapping(value = "/getListOrder", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getListOrder() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            int page = 0;
            int maxCount = 10;
            if(StringUtils.isNotBlank(pd.getString("PAGE"))){
                page = Integer.valueOf(pd.getString("PAGE"));
            }
            pd.put("ACCOUNT_ID",pd.getString("USER_ID"));
            pd.put("MAXR",page * maxCount + maxCount);
            pd.put("MINR",page * maxCount);
            List<PageData> varList = orderService.findByUserId(pd);
            List<PageData> filtList = new ArrayList<>();
            int index = 0, length = varList.size();
            for(; index < length; index++){
                String status = varList.get(index).getString("PAY_STATUS");
                if (StringUtils.isNotBlank(status) && (status.equals("已支付") || status.equals(Constants.PAY_YES))){
                    filtList.add(varList.get(index));
                }
            }
            reponseUtil.setSuccess();
            reponseUtil.setData(filtList);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取订单信息失败！");
        }

        return reponseUtil.toJsonStr();
    }

    /**
     * 获取最新十条广播
     */
    @RequestMapping(value = "/getListBroad", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getListBroad() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            pd.put("MAXR",10);
            pd.put("MINR",0);
            List<PageData> varList = broadService.findNewTen(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(varList);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取公告信息失败！");
        }

        return reponseUtil.toJsonStr();
    }

//    /**
//     * 获取购买排名
//     */
//    @RequestMapping(value = "/getListRank", produces = "application/json;charset=UTF-8")
//    @ResponseBody
//    public Object getListRank() {
//        PageData pd = new PageData();
//        pd = this.getPageData();
//        ResponseUtil reponseUtil = new ResponseUtil();
//        try {
//            int page = 0;
//            int maxCount = 10;
//            if(StringUtils.isNotBlank(pd.getString("PAGE"))){
//                page = Integer.valueOf(pd.getString("PAGE"));
//            }
//            if(StringUtils.isBlank(pd.getString("RANK_NUMBER"))){
//                pd.put("RANK_NUMBER",1);
//            }
//            pd.put("MAXR",page * maxCount + maxCount);
//            pd.put("MINR",page * maxCount);
//            List<PageData> varList = rankingService.findPageData(pd);
//
//            PageData mine = rankingService.getMineRanking(pd);
//            reponseUtil.setSuccess();
//            reponseUtil.setData(varList);
//            reponseUtil.setValue("mine",mine);
//        } catch (Exception e) {
//            e.printStackTrace();
//            reponseUtil.setFailed();
//            reponseUtil.setMsg("获取公告信息失败！");
//        }
//
//        return reponseUtil.toJsonStr();
//    }

    /**
     * 获取购买排名
     */
    @RequestMapping(value = "/getListRank", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getListRank() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            int page = 0;
            int maxCount = 200;
            if(StringUtils.isNotBlank(pd.getString("PAGE"))){
                page = Integer.valueOf(pd.getString("PAGE"));
            }
            if(StringUtils.isBlank(pd.getString("RANK_NUMBER"))){
                pd.put("RANK_NUMBER",1);
            }
            pd.put("MAXR",page * maxCount + maxCount);
            pd.put("MINR",page * maxCount);
            List<PageData> varList = rankingService.findPageData(pd);
            PageData mine = rankingService.getMineRanking(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(varList);
            reponseUtil.setValue("mine",mine);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取公告信息失败！");
        }

        return reponseUtil.toJsonStr();
    }

    /**
     * 申请提款
     */
    @RequestMapping(value = "/presentApplication", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object presentApplication() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        String userId = pd.getString("USER_ID");
        String wmoney = pd.getString("WMONEY");
        if (StringUtils.isBlank(userId) || StringUtils.isBlank(wmoney))
            return ReturnJson.failed("参数不能为空");
        try {
            PageData userInfo = new PageData();
            userInfo.put("USER_ID", userId);
            //拿到个人余额, 与提款金额对比, 大于则提款, 小于则返回余额不足, 最后更新个人余额信息
            PageData data = appusera0Service.findById(userInfo);
            if (null == data) return ReturnJson.failed("系统异常");
            String balance = data.getString("BALANCE");
            if (StringUtils.isBlank(balance)) return ReturnJson.failed("余额不足");
            int balanceDouble = stringToInt(balance);
            int wmoneyDouble = stringToInt(wmoney);
            if (balanceDouble < wmoneyDouble) return ReturnJson.failed("余额不足");
            int surplusMoney = balanceDouble - wmoneyDouble;
            data.put("BALANCE", String.valueOf(surplusMoney));
            appusera0Service.edit(data);
            pd.put("WITHDRAWALS_ID",this.get32UUID());
            pd.put("CREATETIME", Tools.date2Str(new Date()));	//发起时间
            pd.put("STATUS", 0);	//0 发起状态；1同意提现；2已完成提现；3余额不足
            pd.put("WMONEY", wmoney);
            pd.put("USER_ID", userId);
            withdrawalsService.save(pd);
            reponseUtil.setSuccess();
            reponseUtil.setMsg(String.valueOf(surplusMoney));
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("申请提款失败！");
        }

        return reponseUtil.toJsonStr();
    }

    private int stringToInt(String string){
        if (StringUtils.isBlank(string)) return 0;
        int dou = 0;
        try {
            dou = Integer.parseInt(string);
        }finally {
            return dou;
        }
    }

    /**
     * 申请提款列表
     */
    @RequestMapping(value = "/presentApplicationList", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object presentApplicationList() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();

        try {
            List<PageData> varList = withdrawalsService.listAll(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(varList);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("申请提款失败！");
        }

        return reponseUtil.toJsonStr();
    }
}
