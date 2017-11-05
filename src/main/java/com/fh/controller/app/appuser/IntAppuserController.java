package com.fh.controller.app.appuser;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fh.common.AppTokenManage;
import com.fh.entity.system.User;
import com.fh.service.system.appuser.AppUserA0Service;
import com.fh.service.system.goods.GoodsService;
import com.fh.service.system.order.OrderService;
import com.fh.service.system.ranking.RankingService;
import com.fh.service.system.useraddress.UserAddressService;
import com.fh.service.system.userbank.UserBankService;
import com.fh.system.SystemStaticData;
import com.fh.util.*;
import com.fh.util.pay.PayAgency;
import com.fh.util.pay.PayConfig;
import com.fh.util.pay.RequestOrder;
import com.fh.util.pay.alipay.AILPay;
import com.fh.util.pay.alipay.entity.ALIPayEntity;
import com.fh.util.pay.wxpay.WXPay;
import com.fh.util.pay.wxpay.util.WXPayResult;
import com.fh.util.pay.wxpay.util.WXPayResultHandle;
import com.fh.util.pay.wxpay.util.WXSign;
import com.fh.util.sms.ISMSCode;
import com.fh.util.sms.YunPianImpl;
import com.mysql.jdbc.util.ResultSetUtil;
import com.sun.tools.doclets.internal.toolkit.util.DocFinder;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.service.system.appuser.AppuserService;
import org.springframework.web.servlet.ModelAndView;


/**
 * 会员-接口类
 * <p>
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整
 * 04  用户名或密码错误
 * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value = "/app")
public class IntAppuserController extends BaseController {

    private final String ali = "ali";
    private final String wx = "wx";
    private final String only = "8f0904195adc4984935089a6e0ce301a";

    @Resource(name = "userbankService")
    private UserBankService userBankService;

    @Resource(name = "goodsService")
    private GoodsService goodsService;

    @Resource(name = "appuserService")
    private AppuserService appuserService;

    @Resource(name = "appusera0Service")
    private AppUserA0Service appusera0Service;

    @Resource(name = "useraddressService")
    private UserAddressService userAddressService;

    @Resource(name = "orderService")
    private OrderService orderService;

    @Resource(name = "rankingService")
    private RankingService rankingService;

    /**
     * 登陆验证
     */
    @RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object login() {
        return handleLogin();
    }

    private String handleLogin() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            List<PageData> pddList = appusera0Service.findByPd(pd);
            PageData pdd = new PageData();
            //手机号码为空判断
            if (StringUtils.isBlank(pd.getString("USERNAME"))) {
                reponseUtil.setFailed();
                reponseUtil.setMsg("手机号码不能为空！");
                return reponseUtil.toJsonStr();

            } else if (pddList != null && pddList.size() > 0) {//登陆用户不做邀请码校验
//				pd.put("LAST_LOGIN", DateUtil.getTime().toString());
//				appuserService.updateLastLogin(pd);
                pdd = pddList.get(0);

            } else {
                //新注册用户做邀请码校验，如果邀请码数据库不存在，则返回提示，如果存在 "INVITECHECK"属性，则不校验
                if (StringUtils.isNotBlank(pd.getString("INVITECODE"))) {
                    List<PageData> invites = appusera0Service.findByPd(pd);
                    if (invites == null || invites.size() <= 0) {
                        reponseUtil.setValue("code", Constants.APP_RETURN_NO_INVITECODE);
                        reponseUtil.setMsg("邀请码不存在！");
                        return reponseUtil.toJsonStr();
                    } else {
                        pd.put("REF_USERID", invites.get(0).getString("USER_ID"));
                    }
                }
                String NICK_NAME = "AML" + StringUtils.substring(pd.getString("USERNAME"), 7);
                pd.put("INVITECODE", "");
                pd.put("USER_ID", this.get32UUID());
                pd.put("CREATETIME", DateUtil.getTime().toString());
                pd.put("BALANCE", 0);
                pd.put("INVITE_NUM", 0);
                pd.put("NICK_NAME", NICK_NAME);
                pdd = pd;
                appusera0Service.save(pd);
            }
            // ---
            String userId = pdd.getString("USER_ID");
            if (StringUtils.isBlank(userId)) return ReturnJson.failed("登录异常");
            PageData rankingData = rankingService.findByUserId(pdd);
            if (null == rankingData) {
                pdd.put("BUY_REALNUMBER", 0);
            } else {
                int i = (int) rankingData.get("BUY_REALNUMBER");
                pdd.put("BUY_REALNUMBER", i);
            }
            PageData userAddress = userAddressService.findByUserId(pdd);
            if (null != userAddress && userAddress.size() > 0) {
                String phone = userAddress.getString("USER_PHONE") == null ? "" : userAddress.getString("USER_PHONE");
                String address = userAddress.getString("USER_ADDRESS") == null ? "" : userAddress.getString("USER_ADDRESS");
                String name = userAddress.getString("USER_NAME") == null ? "" : userAddress.getString("USER_NAME");
                String userAddressId = userAddress.getString("USERADDRESS_ID") == null ? "" : userAddress.getString("USERADDRESS_ID");
                pdd.put("USER_PHONE", phone);
                pdd.put("USER_ADDRESS", address);
                pdd.put("USER_NAME", name);
                pdd.put("USERADDRESS_ID", userAddressId);
            }
            // ---
            String token = UUID.randomUUID().toString();
            AppTokenManage.tokenValMap.put(pd.getString("USER_ID"), token);
            reponseUtil.setSuccess();
            reponseUtil.setValue("token", token);

            reponseUtil.setData(pdd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("登陆异常！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 登陆验证
     */
    @RequestMapping(value = "/verifyCode", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object verifyCode() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        String token = pd.getString("token");
        String uid = AppTokenManage.validateToken(token);
        if (StringUtils.isNotBlank(uid)) {
            reponseUtil.setSuccess();
            reponseUtil.setMsg("token存在！");
        } else {
            reponseUtil.setFailed();
            reponseUtil.setMsg("token不存在！");
        }

        return reponseUtil.toJsonStr();
    }

    /**
     * 保存银行卡
     */
    @RequestMapping(value = "/saveBank", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object saveBank() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        pd.put("CREATETIME", new Date());
        pd.put("USERBANK_ID", this.get32UUID());
        try {
            userBankService.save(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息新建失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 保存个人地址信息
     */
    @RequestMapping(value = "/saveAddress", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object saveAddress() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        pd.put("CREATETIME", new Date());
        pd.put("USERADDRESS_ID", this.get32UUID());
        try {
            userAddressService.save(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息新建失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 保存个人地址信息
     */
    @RequestMapping(value = "/editAddress", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object editAddress() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            if (StringUtils.isBlank(pd.getString("USERADDRESS_ID"))) {
                pd.put("USERADDRESS_ID", this.get32UUID());
                userAddressService.save(pd);
            } else {
                userAddressService.edit(pd);
            }
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息新建失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 保存银行卡
     */
    @RequestMapping(value = "/getBankList", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getBankList() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            List<PageData> pds = userBankService.findByUserId(pd);
//            PageData pds = userBankService.findById(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(pds);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息新建失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 保存银行卡
     */
    @RequestMapping(value = "/editBank", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object editBank() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        pd.put("CREATETIME", new Date());
        try {
            userBankService.edit(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息修改失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 保存银行卡
     */
    @RequestMapping(value = "/editUserInfo", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object editUserInfo() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();

        try {
            appusera0Service.edit(pd);
            reponseUtil.setSuccess();
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("个人信息修改失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 获取用户信息
     */
    @RequestMapping(value = "/getUserInfo", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getUserInfo() {
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd.toString());
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            pd = appusera0Service.findById(pd);
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取用户信息失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 获取版本信息
     */
    @RequestMapping(value = "/getAppVersion", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getAppVersion() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();

        try {
            pd.put("appVersion", SystemStaticData.appVersion);
            pd.put("appDesc", SystemStaticData.appDesc);
            pd.put("appDown", SystemStaticData.appDown);
            reponseUtil.setSuccess();
            reponseUtil.setData(pd);
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息修改失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 保存银行卡
     */
    @RequestMapping(value = "/deleteBank", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object deleteBank() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            userBankService.delete(pd);
            reponseUtil.setSuccess();
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("银行卡信息删除失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 根据用户名获取会员信息
     */
    @RequestMapping(value = "/getAppuserByUm")
    @ResponseBody
    public Object getAppuserByUsernmae() {
        logBefore(logger, "根据用户名获取会员信息");
        Map<String, Object> map = new HashMap<String, Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try {
            if (Tools.checkKey("USERNAME", pd.getString("FKEY"))) {    //检验请求key值是否合法
                if (AppUtil.checkParam("getAppuserByUsernmae", pd)) {    //检查参数
                    pd = appuserService.findByUId(pd);
                    map.put("pd", pd);
                    result = (null == pd) ? "02" : "01";
                } else {
                    result = "03";
                }
            } else {
                result = "05";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            map.put("result", result);
            logAfter(logger);
        }

        return AppUtil.returnObject(new PageData(), map);
    }

    @RequestMapping(value = "/alipayResult")
    @ResponseBody
    public synchronized void alipayResult(PrintWriter out) {
        logBefore(logger, "alipay");
        System.out.println("执行了回调");
        PageData pageData = getPageData();
        String status = pageData.getString("trade_status");
        if (status.equals("TRADE_SUCCESS") || status.equals("TRADE_FINISHED")) {
            //商户订单号
            String order = pageData.getString("out_trade_no");
            pageData.put("ORDER_ID", order);
//            try {
//                pageData = orderService.findById(pageData);
//                if (pageData != null) {
//                    String state = pageData.getString("PAY_STATUS");
//                    if (state == null || Constants.PAY_NO.equals(state)) {
//                        pageData.put("PAY_STATUS", Constants.PAY_YES);
//                        orderService.edit(pageData);
//                        processRanking(pageData);
//                        out.write(ReturnJson.success());
//                    }
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                out.write(ReturnJson.failed("订单生成失败..."));
//            }
        }
    }

    /**
     * 处理排名算法
     * 当购买量为25支笔时，增加期数
     * 支付成功后，首先获取当前期数；然后获取当前期卖的数量；
     * <p>
     * 根据购买用户ID，获取用户信息；
     * 根据用户ID，去 rangking 获取当前期，当前用户，有没有数据，如果有，则修改他的购买数量和购买总量；
     * 如果当前用户存在父id，则父id用户的rangking变当前期购买数量增加1
     * <p>
     * 如果没有，则新插入数据，并获取该用户的购买总量
     * <p>
     * 最后，增加缓存sellNumber的数量；判断是否超过25支笔；如果超过，则 期数增加1；
     */
    private synchronized void processRanking(PageData pd) {
        String USER_ID = pd.getString("ACCOUNT_ID");
        try {
            PageData p1 = new PageData();
            p1.put("USER_ID", USER_ID);

            // 获取当前用户
            PageData cuserPg = appusera0Service.findById(p1);
            if (cuserPg == null) return;
            if (StringUtils.isBlank(cuserPg.getString("INVITECODE"))) {
                /**
                 * 生成六位随机数
                 */
                String inviteCode = String.valueOf(Tools.getRandomNum());
                PageData invp = new PageData();
                invp.put("INVITECODE", inviteCode);
                while (true) {
                    List<PageData> invites = appusera0Service.findByPd(invp);
                    if (invites == null || invites.size() <= 0) {
                        cuserPg.put("INVITECODE", inviteCode);
                        break;
                    }
                    inviteCode = String.valueOf(Tools.getRandomNum());
                    invp.put("INVITECODE", inviteCode);
                }
                appusera0Service.edit(cuserPg);
            }
            //获取当前用户当前期购买数据
            PageData crkPg = rankingService.findByUserId(p1);

            if (crkPg == null || crkPg.isEmpty()) {
                crkPg = new PageData();
                crkPg.put("RANKING_ID", this.get32UUID());
                crkPg.put("RANK_NUMBER", SystemStaticData.newRankingNumber);
                crkPg.put("USERNAME", cuserPg.getString("USERNAME"));
                crkPg.put("NICK_NAME", cuserPg.getString("NICK_NAME"));
                crkPg.put("USER_ID", cuserPg.getString("USER_ID"));
                crkPg.put("CREATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                crkPg.put("UPDATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                crkPg.put("BUY_REALNUMBER", Integer.parseInt(pd.getString("QUANTITY")));
//				crkPg.put("BUY_NUMBER",Integer.valueOf(pd.getString("QUANTITY")));
                crkPg.put("BUY_NUMBER", Integer.valueOf(pd.getString("QUANTITY")));
                // 用户购买总数量
                crkPg.put("BUY_COUNT", Integer.valueOf(pd.getString("QUANTITY")));

                rankingService.rankingSa(crkPg);
            } else {
                crkPg.put("UPDATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                int c1 = (Integer) crkPg.get("BUY_REALNUMBER") + Integer.valueOf(pd.getString("QUANTITY"));
                int c2 = (Integer) crkPg.get("BUY_NUMBER") + Integer.valueOf(pd.getString("QUANTITY"));
                int c3 = (Integer) crkPg.get("BUY_COUNT") + Integer.valueOf(pd.getString("QUANTITY"));
                crkPg.put("BUY_REALNUMBER", c1);
                crkPg.put("BUY_NUMBER", c2);
                crkPg.put("BUY_COUNT", c3);

                //用户购买后，更新期数
                crkPg.put("RANK_NUMBER", SystemStaticData.newRankingNumber);
                rankingService.rankingUp(crkPg);
            }
            //父用户信息 和父用户购买数量
            PageData puserPg = null;
            PageData prkPg = null;
            if (StringUtils.isNotBlank(cuserPg.getString("REF_USERID"))) {
                PageData p = new PageData();
                p.put("USER_ID", cuserPg.getString("REF_USERID"));
                puserPg = appusera0Service.findById(p);
                if (puserPg != null) {
                    int i = (int) puserPg.get("INVITE_NUM");
                    i += 1;
                    puserPg.put("INVITE_NUM", i);
                    appusera0Service.edit(puserPg);
                }
                prkPg = rankingService.findByUserId(p);
                if (prkPg == null || prkPg.isEmpty()) {
                    prkPg = new PageData();
                    prkPg.put("RANKING_ID", this.get32UUID());
                    prkPg.put("RANK_NUMBER", SystemStaticData.newRankingNumber);
                    prkPg.put("USERNAME", puserPg.getString("USERNAME"));
                    prkPg.put("NICK_NAME", puserPg.getString("NICK_NAME"));
                    prkPg.put("USER_ID", puserPg.getString("USER_ID"));
                    prkPg.put("CREATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                    prkPg.put("UPDATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                    prkPg.put("BUY_REALNUMBER", 0);
                    prkPg.put("BUY_NUMBER", Integer.valueOf(pd.getString("QUANTITY")));
//					用户购买总数量

                    prkPg.put("BUY_COUNT", cuserPg.getString("QUANTITY"));

                    rankingService.rankingSa(prkPg);
                } else {
                    prkPg.put("UPDATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                    int c2 = (Integer) prkPg.get("BUY_NUMBER") + Integer.valueOf(pd.getString("QUANTITY"));
                    int c3 = (Integer) prkPg.get("BUY_COUNT") + Integer.valueOf(pd.getString("QUANTITY"));
                    prkPg.put("BUY_NUMBER", c2);
                    prkPg.put("BUY_COUNT", c3);
                    rankingService.rankingUp(prkPg);
                }
            }

            /**
             * 判断购买量，如果等于25支笔时，则奖励第一名2000元，并把购买量置空
             */
            SystemStaticData.sellNumber = SystemStaticData.sellNumber + Integer.valueOf(pd.getString("QUANTITY"));
            if (SystemStaticData.sellNumber >= SystemStaticData.MAX_COUNT_NUMBER) {
                logInfo(logger, "发放排名第一2000");
                PageData fd = new PageData();
                fd = rankingService.findFirst(fd);
                fd.put("BUY_NUMBER", 0);
                fd.put("BUY_REALNUMBER", 0);
                rankingService.rankingUp(fd);
                PageData fupd = new PageData();
                fupd.put("USER_ID", fd.getString("USER_ID"));
                fupd = appusera0Service.findById(fupd);
                int balance = Integer.valueOf(fupd.getString("BALANCE")) + 2000;
                String balanceStr = String.valueOf(balance);
                fupd.put("BALANCE", balanceStr);
                fupd.put("INVITECODE", "");
                appusera0Service.edit(fupd);
                logInfo(logger, "发放排名第一:" + fupd.getString("USERNAME"));
                SystemStaticData.newRankingNumber++;
                SystemStaticData.sellNumber = 0;
            }
            logInfo(logger, "SystemStaticData.newRankingNumber = " + SystemStaticData.newRankingNumber);
            logInfo(logger, "SystemStaticData.sellNumber = " + SystemStaticData.sellNumber);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/wxpayResult")
    @ResponseBody
    public synchronized void wxpayResult(HttpServletRequest request, HttpServletResponse response) {
        logBefore(logger, "wxpay");
        //接受微信返回的信息
        InputStream inputStream = null;
        BufferedReader reader = null;
        OutputStream outputStream = null;
        PrintWriter printWriter = null;
        try {
            inputStream = request.getInputStream();
            reader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
            StringBuilder stringBuilder = new StringBuilder();
            String str;
            while ((str = reader.readLine()) != null) {
                stringBuilder.append(str);
            }
            //给微信发送通知, 关闭此次支付流程
            response.reset();
            response.setContentType("text/html;charset=UTF-8");
            printWriter = response.getWriter();
            printWriter.write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
            printWriter.flush();

            //对微信返回的xml信息做解析
            WXPayResult wxPayResult = WXPayResultHandle.handleResult(stringBuilder.toString());
            String trade_status = "";
            if (StringUtils.equalsIgnoreCase("SUCCESS", wxPayResult.getResult_code())) {
                trade_status = "WAIT_SELLER_SEND_GOODS";
            }
            /**
             *  @param trade_status 交易状态
             * @param refund_status    退款状态
             * @param out_trade_no 商户订单号
             * @param trade_no 微信交易号
             */
//            PageData pageData = getPageData();
//            pageData.put("ORDER_ID", wxPayResult.getOut_trade_no());
//            pageData = orderService.findById(pageData);
//            if (pageData == null) return;
//            String state = pageData.getString("PAY_STATUS");
//            if (state == null || Constants.PAY_NO.equals(state)) {
//                pageData = orderService.findById(pageData);
//                pageData.put("PAY_STATUS", Constants.PAY_YES);
//                orderService.edit(pageData);
//                processRanking(pageData);
//            }
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (printWriter != null) printWriter.close();
                if (outputStream != null) outputStream.close();
                if (reader != null) reader.close();
                if (reader != null) inputStream.close();
            } catch (IOException e1) {
            }
        }
    }


    @RequestMapping(value = "/appResult")
    @ResponseBody
    public synchronized String appResult() {
        logBefore(logger, "appResult------------");
        PageData pageData = getPageData();
        String orderId = pageData.getString("ORDER_ID");
        if (StringUtils.isBlank(orderId)) return ReturnJson.returnValue(2, "参数为空");
        try {
            pageData = orderService.findById(pageData);
            if (pageData == null) return ReturnJson.returnValue(2, "订单不存在");
            String state = pageData.getString("PAY_STATUS");
            if (StringUtils.isNotBlank(state) && Constants.PAY_YES.equals(state))
                return ReturnJson.success("订单已经支付");
            if (state == null || Constants.PAY_NO.equals(state)) {
                pageData.put("PAY_STATUS", Constants.PAY_YES);
                orderService.edit(pageData);
                processRanking(pageData);
                return ReturnJson.success("订单支付状态修改成功");
            }
        } catch (Exception e) {
            logger.error(e);
            return ReturnJson.failed("数据库出现未知异常");
        }
        return ReturnJson.failed("服务器出现异常");
    }


    @RequestMapping(value = "/alipay")
    @ResponseBody
    public void alipay(PrintWriter out) {
        logBefore(logger, "alipay");
        final RequestOrder order = getRequestOrder();
        order.setPayType(ali);
        if (order == null) {
            out.write(ReturnJson.failed("参数不能为空"));
            return;
        }
        PageData rakingData = new PageData();
        rakingData.put("USER_ID", order.getUserId());
        try {
            rakingData = rankingService.findByUserId(rakingData);
            if (rakingData != null) {
                int buyRealnumber = (int) rakingData.get("BUY_REALNUMBER");
                if (buyRealnumber > 0) {
                    out.write(ReturnJson.failed("用于已经没有权限购买"));
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        PayAgency pay = new PayAgency(new AILPay());
        ALIPayEntity aliPayEntity = new ALIPayEntity() {{
            setBody(order.getBody() != null ? order.getBody() : "");
            setSubject(order.getSubject() != null ? order.getSubject() : "");
            setTimeoutExpress(PayConfig.timeoutExpress);
            setTotalAmount("0.01");
            setOutTradeNo(order.getOrderId() != null ? order.getOrderId() : "");
            setProductCode(PayConfig.ProductCode);
        }};
        String result = pay.pay(aliPayEntity);
        if (StringUtils.isBlank(result)) {
            out.write(ReturnJson.failed("订单生成失败"));
            return;
        }
        String orderid = saveOrder(order);
        if (StringUtils.isBlank(orderid)) {
            out.write(ReturnJson.failed("订单生成失败"));
            return;
        }
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setSuccess();
        PageData resultData = new PageData();
        resultData.put("PAY", result);
        resultData.put("ORDER_ID", orderid);
        responseUtil.setData(resultData);
        out.write(responseUtil.toJsonStr());
    }

    @RequestMapping(value = "/wxpay")
    @ResponseBody
    public void wxpay(PrintWriter out) {
        final RequestOrder order = getRequestOrder();
        order.setPayType(wx);
        if (order == null) {
            out.write(ReturnJson.failed("参数不能为空"));
            return;
        }
        PageData rakingData = new PageData();
        rakingData.put("USER_ID", order.getUserId());
        try {
            rakingData = rankingService.findByUserId(rakingData);
            if (rakingData != null) {
                int buyRealnumber = (int) rakingData.get("BUY_REALNUMBER");
                if (buyRealnumber > 0) {
                    out.write(ReturnJson.failed("用于已经没有权限购买"));
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        PayAgency pay = new PayAgency(new WXPay());
        String nonceStr = UUID.randomUUID().toString().substring(6);
        String moneyStr = order.getTotalAmount();
        String monryValue;
        if (moneyStr == null || "".equals("")) {
//			out.write(ReturnJson.failed("参数moneyStr不能为空"));
            monryValue = "18800";
        } else {
            double monry_ = Double.parseDouble(moneyStr);
            //微信默认单位为 分
            monry_ *= 100;
            int m = (int) monry_;
            monryValue = String.valueOf(m);
        }
        String body = order.getBody();
        if (body == null || "".equals(body)) {
            order.setBody("没有商品描述");
        }
        String orderId = order.getOrderId();
        if (orderId == null || "".equals(orderId)) {
            order.setOrderId(getOrderId());
        }
        String sign = getSign("Notice", order.getOrderId(), "1", nonceStr);
        String resultXML = PayConfig.getWXPayXML("Notice", order.getOrderId(), sign, "1", nonceStr);
        logger.error("resultXML:" + resultXML);
        String result = pay.pay(resultXML);
        logger.error("result:" + result);
        String orderid = saveOrder(order);
        ResponseUtil responseUtil = new ResponseUtil();
        responseUtil.setSuccess();
        PageData resultData = new PageData();
        resultData.put("PAY", result);
        resultData.put("ORDER_ID", orderid);
        responseUtil.setData(resultData);
        out.write(responseUtil.toJsonStr());
    }

    //得到sign
    private String getSign(final String body, final String orderId, final String fee, final String nonceStr) {
        SortedMap<Object, Object> parameters = new TreeMap<Object, Object>() {{
            put("body", body);
            put("trade_type", PayConfig.WX_TRADE_TYPE);
            put("mch_id", PayConfig.WX_MCH_ID);
            put("nonce_str", nonceStr);
            put("sign_type", PayConfig.WX_SIGN_TYPE);
            put("fee_type", PayConfig.WX_FEE_TYPE);
            put("out_trade_no", orderId);
            put("total_fee", fee);
            put("appid", PayConfig.WX_APPID);
            put("notify_url", PayConfig.WX_NOTIFY_URL);
            put("spbill_create_ip", PayConfig.WX_SPBILL_CREATE_IP);
        }};
        return WXSign.sign(parameters);
    }

    //拿到订单id
    private String getOrderId() {
        return UUID.randomUUID().toString().substring(6);
    }

    //保存生成的订单
    private String saveOrder(final RequestOrder order) {
        PageData pageData = new PageData() {{
            put("ACCOUNT_ID", order.getUserId());
            put("QUANTITY", order.getBuyNumber());
            put("PAY_TYPE", order.getPayType());
            put("PAY_STATUS", Constants.PAY_NO);
            put("AMOUNT", order.getTotalAmount());
            put("ORDER_ID", order.getOrderId());
            put("STATUS", Constants.STATE_GET);
            put("CREATE_DATE", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            put("GNAME", order.getGname());
            put("GOODS_ID", order.getGid());
        }};
        try {
            PageData page = orderService.findById(pageData);
            if (page == null) {
                orderService.save(pageData);
            }
            return order.getOrderId();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("保存订单失败");
        }
        return null;
    }

    //拿到 APP请求的参数
    public RequestOrder getRequestOrder() {
        PageData pd = this.getPageData();
        String userId = pd.getString("USER_ID");
        String buyNumber = pd.getString("BUY_NUMBER");
        System.out.println("USER_ID" + userId + "BUY_NUMBER" + buyNumber);
        if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(buyNumber)) {
            return null;
        }
        try {
            pd = goodsService.findById(pd);
            String gprice = pd.getString("GPRICE");
            double gprice_ = Double.parseDouble(gprice);
            int number_ = Integer.parseInt(buyNumber);
            double sum = gprice_ * number_;
            DecimalFormat df = new java.text.DecimalFormat("#0.00");
            String money = df.format(sum);
            RequestOrder order = new RequestOrder();
            order.setTotalAmount(money);
            String gdesc = pd.getString("GDESC");
            if (gdesc == null || "".equals(gdesc)) {
                order.setBody("暂无商品描述");
            } else {
                order.setBody(gdesc);
            }
            order.setSubject(pd.getString("GNAME"));
            order.setBuyNumber(buyNumber);
            order.setOrderId(getOrderId());
            order.setUserId(userId);
            order.setGid(pd.getString("GOODS_ID"));
            String gname = pd.getString("GNAME");
            if (gname == null) {
                order.setGname("暂无商品名称");
            } else {
                order.setGname(gname);
            }
            return order;
        } catch (Exception e) {
            System.out.println("5");
            return null;
        }
    }

    @RequestMapping(value = "/share")
    public ModelAndView share() {
        logBefore(logger, "share");
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/share/html/register");
        //参数名字: INVITECODE
        System.out.println("inviteCode邀请码是:" + getPageData().getString("INVITECODE"));
        mv.addObject("pd", getPageData());
        return mv;
    }

    @RequestMapping(value = "/download")
    public ModelAndView download(PrintWriter out) {
        logBefore(logger, "download");
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/share/html/download");
        //处理注册事件
        PageData data = this.getPageData();
        String invite = data.getString("invite");
        String phone = data.getString("phone");
        if (StringUtils.isNotBlank(phone)) {
            //如果手机号不满11位, 则不注册
            if (phone.length() != 11) {
                return mv;
            }
            PageData pageData = new PageData();
            pageData.put("INVITECODE", invite);
            try {
                //根据邀请码找邀请人, 找到之后邀请人的邀请人数+1接着注册用户, 没找到那么直接注册用户
                pageData = appusera0Service.findById(pageData);
                PageData userPg = new PageData();
                userPg.put("USERNAME", phone);
                if (pageData != null) {
                    userPg.put("REF_USERID", pageData.getString("USER_ID"));
//                    int inviteNum = (int) pageData.get("INVITE_NUM");
//                    if (inviteNum != 0) {
//                        int num = inviteNum + 1;
//                        pageData.put("INVITE_NUM", num);
//                    } else {
//                        pageData.put("INVITE_NUM", 1);
//                    }
                    //appusera0Service.edit(pageData);
                }
                register(userPg);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return mv;
    }

    //用户注册初始化
    private void register(PageData userPg) {
        try {
            if (userPg.getString("USERNAME") == null) return;
            PageData upd = new PageData();
            upd.put("USERNAME", userPg.getString("USERNAME"));
            upd = appusera0Service.findById(upd);
            if (upd != null) return;
            String NICK_NAME = "AML" + StringUtils.substring(userPg.getString("USERNAME"), 7);
            userPg.put("INVITECODE", "");
            userPg.put("USER_ID", this.get32UUID());
            userPg.put("CREATETIME", DateUtil.getTime().toString());
            userPg.put("BALANCE", 0);
            userPg.put("INVITE_NUM", 0);
            userPg.put("NICK_NAME", NICK_NAME);
            appusera0Service.save(userPg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/sendcode")
    @ResponseBody
    public String sendcode(PrintWriter out) {
        logBefore(logger, "sendcode");
        String phone = getPageData().getString("phone");
        ISMSCode mISMSCode = YunPianImpl.getInstance();
        mISMSCode.sendSMSCode(phone);
        return ReturnJson.success();
    }

    //此方法用于测试, 请忽略
    @RequestMapping(value = "/text")
    @ResponseBody
    public void text(PrintWriter out) {
        logBefore(logger, "text");

        //绝对路径
        String absPath = getRequest().getSession().getServletContext().getRealPath("/");
        logBefore(logger, absPath);
        //相对路径
        String path = absPath + "database/images";
        logBefore(logger, path);
        File file = new File(path);
        if (!file.exists()) {
            try {
                file.mkdirs();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            DataInputStream dos = new DataInputStream(getRequest().getInputStream());
            ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
            byte[] data = new byte[1024];
            byte[] datas;
            int length = 0;
            while ((length = dos.read(data, 0, data.length)) > 0) {
                bytestream.write(data, 0, length);
            }
            datas = bytestream.toByteArray();
            File f = new File(path + "/" + UUID.randomUUID() + ".jpg");
            if (!f.exists()){
                f.createNewFile();
            }
            FileOutputStream fout = new FileOutputStream(f);
            fout.write(datas);
            fout.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "/http")
    @ResponseBody
    public void http(PrintWriter out) {
        logBefore(logger, "http");
        try {
            ServerSocket serverSocket = new ServerSocket(8888);
            while (true){
                Socket socket = serverSocket.accept();
                OutputStream outputStream = socket.getOutputStream();
                PrintWriter writer = new PrintWriter(outputStream);
                writer.write("连接客户端成功");
                System.out.println("连接客户端成功");
                writer.flush();
                InputStream inputStream = socket.getInputStream();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
                String string = bufferedReader.readLine();
                System.out.println(string);
                OutputStream stream = socket.getOutputStream();
                BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(stream));
                bufferedWriter.write("再一次给客户端发送消息");
                bufferedWriter.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}

 