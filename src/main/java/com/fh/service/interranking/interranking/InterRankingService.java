package com.fh.service.interranking.interranking;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("interrankingService")
public class InterRankingService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /*
    * 新增
    */
    public void save(PageData pd) throws Exception {
        dao.save("InterRankingMapper.save", pd);
    }

    /*
    * 删除
    */
    public void delete(PageData pd) throws Exception {
        dao.delete("InterRankingMapper.delete", pd);
    }

    /*
    * 修改
    */
    public void edit(PageData pd) throws Exception {
        dao.update("InterRankingMapper.edit", pd);
    }

   /*
    *列表(全部)
    */
    public List<PageData> rankingTop(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("InterRankingMapper.rankingTop", pd);
    }


    /*
    *列表
    */
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("InterRankingMapper.datalistPage", page);
    }

    /*
    *列表(全部)
    */
    public List<PageData> listAll(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("InterRankingMapper.listAll", pd);
    }

    /**
     * 附近
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> nearbyRanking(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("InterRankingMapper.nearbyRanking", pd);
    }

    public List<PageData> ranking(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("InterRankingMapper.ranking", pd);
    }

    /*
    * 通过id获取数据
    */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("InterRankingMapper.findById", pd);
    }

    //	findByIntegralId
    /*
    * 通过积分ID获取数据
	*/
    public PageData findByIntegralId(PageData pd) throws Exception {
        return (PageData) dao.findForObject("InterRankingMapper.findByIntegralId", pd);
    }

    /*
    * 批量删除
    */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.delete("InterRankingMapper.deleteAll", ArrayDATA_IDS);
    }

}

