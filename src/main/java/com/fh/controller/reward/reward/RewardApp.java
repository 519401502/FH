package com.fh.controller.reward.reward;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.reward.reward.RewardService;
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
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 类名称：RewardController
 * 创建人：FH
 * 创建时间：2017-11-01
 */
@Controller
@RequestMapping(value = "/reward")
public class RewardApp extends BaseController {

    String menuUrl = "reward/list.do"; //菜单地址(权限用)
    @Resource(name = "rewardService")
    private RewardService rewardService;

    /**
     * 用户根据积分ID 查看自己有没有奖励
     */
    @RequestMapping(value = "/myreward")
    public void myReward(HttpServletRequest request, HttpServletResponse response) throws Exception {
        logBefore(logger, " add Reward");
        response.setContentType("text/html;charset=utf-8");
        PageData pd = new PageData();
        pd = this.getPageData();
        String integralId = pd.getString("INTEGRAL_ID");
        if (StringUtils.isBlank(integralId)) {
            response.getWriter().println(ReturnJson.failed("积分id为空"));
            return;
        }
        List<PageData> dbPageData = rewardService.findByIntegralId(pd);
        if (dbPageData == null || dbPageData.size() == 0){
            response.getWriter().println(ReturnJson.failed("暂时没有奖励"));
            return;
        }
        JSONArray array = new JSONArray();
        try {
            for (int i = 0; i < dbPageData.size(); i++) {
                int isGet = (int) dbPageData.get(i).get("IS_GET");
                if (isGet == 0){
                    JSONObject jsonObject = new JSONObject();
                    String reason = dbPageData.get(i).getString("REASON");
                    jsonObject.put("REASON", reason);
                    int integral = (int) dbPageData.get(i).get("INTEGRAL");
                    jsonObject.put("INTEGRAL", integral);
                    array.add(jsonObject);
                    //将is_get 改为 1 表示已经领取奖励
                    PageData data = dbPageData.get(i);
                    data.put("IS_GET", 1);
                    rewardService.edit(data);
                }
            }
            if (array.size() == 0){
                response.getWriter().println(ReturnJson.failed("暂时没有奖励"));
                return;
            }
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 0);
            jsonObject.put("msg", array);
            response.getWriter().write(jsonObject.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(ReturnJson.failed("未知错误"));
        }
    }


}
