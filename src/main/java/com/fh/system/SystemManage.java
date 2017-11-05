package com.fh.system;

import com.fh.service.system.order.OrderService;
import com.fh.service.system.ranking.RankingService;
import com.fh.util.PageData;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.Properties;

/**
 * Created by gaoz on 17/7/14.
 */
@Component
public class SystemManage  implements InitializingBean,ApplicationListener<ContextRefreshedEvent> {
    private static SystemManage instance;
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SystemManage.class);
    private static Properties p = new Properties();

    @Resource(name="rankingService")
    private RankingService rankingService;




    @PostConstruct
    public void afterPropertiesSet() {
        instance =  this;
        initData();
    }

    public static SystemManage getInstance() {
        return instance;
    }

    static {
        init();
    }

    private static void init() {
        try {
            p.load(new InputStreamReader(SystemManage.class.getClassLoader().getResourceAsStream("/system.properties"), "UTF-8"));
            logger.info(p.toString());
            SystemStaticData.imgRootPath = p.getProperty("imgRootPath");
            SystemStaticData.appDesc = p.getProperty("appDesc");
            SystemStaticData.appVersion = p.getProperty("appVersion");
            SystemStaticData.appDown = p.getProperty("appDown");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

    }

    /**
     * 获取最新排名信息
     */
    public  void initData(){
        PageData pd = new PageData();
        try {
            pd = rankingService.findNewRankNum(pd);
            if(pd == null || pd.isEmpty() ){
                SystemStaticData.newRankingNumber = 1;
                return;
            }
            SystemStaticData.newRankingNumber = (Integer)pd.get("RANK_NUMBER");
            pd.put("RANK_NUMBER", SystemStaticData.newRankingNumber);
            int sellNum = rankingService.getRankNumCount(pd);
            SystemStaticData.sellNumber = sellNum;
            if( SystemStaticData.sellNumber >= SystemStaticData.MAX_COUNT_NUMBER){
                SystemStaticData.newRankingNumber ++;
                SystemStaticData.sellNumber = 0;
            }
            logger.info("-----------new  ranknum: " + SystemStaticData.newRankingNumber );
            logger.info("-----------sell num: " + SystemStaticData.sellNumber );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
