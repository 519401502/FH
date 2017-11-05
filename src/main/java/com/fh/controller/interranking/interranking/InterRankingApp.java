package com.fh.controller.interranking.interranking;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.interranking.interranking.InterRankingService;
import com.fh.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 类名称：InterRankingController
 * 创建人：FH
 * 创建时间：2017-10-30
 */
@Controller
@RequestMapping(value = "/interranking")
public class InterRankingApp extends BaseController {

    String menuUrl = "interranking/list.do"; //菜单地址(权限用)
    @Resource(name = "interrankingService")
    private InterRankingService interrankingService;

    /**
     * App提交用户信息
     */
    @RequestMapping(value = "/putinfo")
    public void putInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        logBefore(logger, "put info InterRanking");
        response.setContentType("text/html;charset=utf-8");
        JSONObject jsonObject;
        PageData pd = new PageData();
        pd = this.getPageData();
        String id = pd.getString("INTEGRAL_ID");
        if (StringUtils.isBlank(id)) {
            jsonObject = new JSONObject();
            jsonObject.put("code", 1);
            jsonObject.put("msg", "参数错误,INTEGRAL_ID不能为空!");
            response.getWriter().write(jsonObject.toString());
            return;
        }
        int integral;
        try {
            String integralString = pd.getString("INTEGRAL");
            integral = Integer.parseInt(integralString);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject = new JSONObject();
            jsonObject.put("code", 1);
            jsonObject.put("msg", "参数错误,INTEGRAL必须为整型!");
            response.getWriter().write(jsonObject.toString());
            return;
        }
        PageData data = interrankingService.findByIntegralId(pd);
        /**
         * 如果数据库中没有此ID,那么就插入数据
         * 如果数据库中包含此ID,那么就更新数据
         */
        if (data == null || data.getString("INTEGRAL_ID") == null) {
            data = new PageData();
            data.put("INTERRANKING_ID", this.get32UUID());    //主键
            data.put("CREATE_TIME", Tools.date2Str(new Date()));    //创建时间
            data.put("UPDATE_TIME", Tools.date2Str(new Date()));    //更新时间
            data.put("CREATE_TIMEMILLIS", TimeMillis.get());    //创建的时间戳
            data.put("UPDATE_TIMEMILLIS", TimeMillis.get());    //更新的时间戳
            data.put("INTEGRAL_ID", id);
            data.put("INTEGRAL", integral);
            interrankingService.save(data);
        } else {
            data.put("INTEGRAL", integral);
            data.put("UPDATE_TIME", Tools.date2Str(new Date()));    //更新时间
            data.put("UPDATE_TIMEMILLIS", TimeMillis.get());    //更新的时间戳
            interrankingService.edit(data);
        }
        PageData page = new PageData();
        List<PageData> pageDatas = interrankingService.ranking(page);
        //过滤数据
        if (pageDatas == null) {
            jsonObject = new JSONObject();
            jsonObject.put("code", 1);
            jsonObject.put("msg", "数据为空!");
            response.getWriter().write(jsonObject.toString());
            return;
        }
        JSONArray array = new JSONArray();
        for (int i = 0; i < pageDatas.size(); i++) {
            if (pageDatas.get(i).getString("INTEGRAL_ID").equals(id)) {
                if (i != 0) {
                    JSONObject objectUp = new JSONObject();
                    objectUp.put("INTEGRAL_ID", pageDatas.get(i - 1).getString("INTEGRAL_ID"));
                    objectUp.put("INTEGRAL", pageDatas.get(i - 1).get("INTEGRAL"));
                    objectUp.put("RANKING", i);
                    array.add(objectUp);
                }
                JSONObject object = new JSONObject();
                object.put("INTEGRAL_ID", id);
                object.put("INTEGRAL", pageDatas.get(i).get("INTEGRAL"));
                object.put("RANKING", i + 1);
                array.add(object);
                if (i + 1 != pageDatas.size()) {
                    JSONObject objectDown = new JSONObject();
                    objectDown.put("INTEGRAL_ID", pageDatas.get(i + 1).getString("INTEGRAL_ID"));
                    objectDown.put("INTEGRAL", pageDatas.get(i + 1).get("INTEGRAL"));
                    objectDown.put("RANKING", i + 2);
                    array.add(objectDown);
                }
                break;
            }
        }
        jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", array.toString());
        response.getWriter().write(jsonObject.toString());
    }


    /**
     * 获取积分排名前二十名
     */
    @RequestMapping(value = "/topten")
    public void topTen(HttpServletRequest request, HttpServletResponse response) throws Exception {
        logBefore(logger, "top 10 InterRanking");
        response.setContentType("text/html;charset=utf-8");

        PageData pd = new PageData();
        List<PageData> datas = interrankingService.rankingTop(pd);
        JSONObject jsonObject;
        if (datas == null) {
            jsonObject = new JSONObject();
            jsonObject.put("code", 1);
            jsonObject.put("msg", "数据出现异常");
            response.getWriter().write(jsonObject.toString());
            return;
        }

        JSONArray array = new JSONArray();
        JSONObject object;
        for (int i = 0; i < datas.size(); i++) {
            object = new JSONObject();
            object.put("INTEGRAL_ID", datas.get(i).getString("INTEGRAL_ID"));
            object.put("INTEGRAL", datas.get(i).get("INTEGRAL"));
            object.put("RANKING", i + 1);
            array.add(object);
        }
        jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", array.toString());
        response.getWriter().write(jsonObject.toString());
    }


}
