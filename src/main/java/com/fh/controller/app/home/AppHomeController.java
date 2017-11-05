package com.fh.controller.app.home;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.fh.service.system.goods.GoodsService;
import com.fh.service.system.home.HomeService;
import com.fh.service.system.ranking.RankingService;
import com.fh.system.SystemStaticData;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;

/**
 * 类名称：HomeController
 * 创建人：FH
 * 创建时间：2017-07-12
 */
@Controller
@RequestMapping(value = "/app")
public class AppHomeController extends BaseController {

    @Resource(name = "homeService")
    private HomeService homeService;
    @Resource(name = "goodsService")
    private GoodsService goodsService;
    @Resource(name = "rankingService")
    private RankingService rankingService;

    /**
     * 获取首页图片
     */
    @RequestMapping(value = "/getHomePic", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getHomePic() {
        PageData pd = new PageData();
        pd = this.getPageData();
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            List<PageData> pds = homeService.listAll(pd);
            PageData rp = null;
            if (pds != null && pds.size() > 0) {
                String imgRootPath = SystemStaticData.imgRootPath;
                rp = pds.get(0);
                if (StringUtils.isNotBlank(rp.getString("PIC1"))) {
                    String pic1 = imgRootPath + rp.getString("PIC1");
                    rp.put("PIC1", pic1);

                }
                if (StringUtils.isNotBlank(rp.getString("PIC2"))) {
                    String pic2 = imgRootPath + rp.getString("PIC2");
                    rp.put("PIC2", pic2);

                }
                if (StringUtils.isNotBlank(rp.getString("PIC3"))) {
                    String pic3 = imgRootPath + rp.getString("PIC3");
                    rp.put("PIC3", pic3);

                }

                reponseUtil.setData(rp);
            }
            reponseUtil.setSuccess();
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取图片信息失败！");
        }
        return reponseUtil.toJsonStr();
    }

    /**
     * 商品信息
     */
    @RequestMapping(value = "/getGoodsInfo", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getGoodsInfo() {

        PageData pd = new PageData();
        PageData userPd = new PageData();
        pd = this.getPageData();
        userPd.put("USER_ID",pd.getString("USER_ID"));
        ResponseUtil reponseUtil = new ResponseUtil();
        try {
            List<PageData> pds = goodsService.listAll(pd);
            if(pds != null && pds.size() > 0){
                pd = pds.get(0);
            }
            String rp = pd.getString("GPIC_PATH");
            if(StringUtils.isNotBlank(rp)){

                pd.put("GPIC_PATH",SystemStaticData.imgRootPath+rp);
            }

            PageData rankingData = rankingService.findByUserId(userPd);
            if (null == rankingData) {
                pd.put("BUY_REALNUMBER", 0);
            } else {
                int i = (int) rankingData.get("BUY_REALNUMBER");
                pd.put("BUY_REALNUMBER", i);
            }
            reponseUtil.setData(pd);
            reponseUtil.setSuccess();
        } catch (Exception e) {
            e.printStackTrace();
            reponseUtil.setFailed();
            reponseUtil.setMsg("获取商品信息失败！");
        }
        return reponseUtil.toJsonStr();
    }
}
