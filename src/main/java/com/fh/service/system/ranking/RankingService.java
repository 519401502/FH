package com.fh.service.system.ranking;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("rankingService")
public class RankingService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void rankingSa(PageData pd)throws Exception{
		dao.save("RankingMapper.save", pd);
	}

	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("RankingMapper.save", pd);
	}
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("RankingMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void rankingUp(PageData pd)throws Exception{
		dao.update("RankingMapper.edit", pd);
	}
	/*
	* 修改
	*/
		public void edit(PageData pd)throws Exception{
			dao.update("RankingMapper.edit", pd);
		}

	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("RankingMapper.datalistPage", page);
	}
	
	/*
	*分页获取指定期数的数据
	*/
	public List<PageData> findPageData(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("RankingMapper.findPageData", pd);
	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("RankingMapper.listAll", pd);
	}

	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RankingMapper.findById", pd);
	}

	/*
	* 通过id获取数据
	*/
	public PageData findByUserId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RankingMapper.findByUserId", pd);
	}

	/*
	* 通过id获取数据
	*/
	public PageData getMineRanking(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RankingMapper.getMineRanking", pd);
	}

	/*
	* 获取最新周期的记录
	*/
	public Integer getRankNumCount(PageData pd)throws Exception{
		return (Integer)dao.findForObject("RankingMapper.getRankNumCount", pd);
	}

	/*
	* 获取最新周期的记录
	*/
	public PageData findNewRankNum(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RankingMapper.findNewRankNum", pd);
	}


	/*
	* 根据获取第一名
	*/
	public PageData findFirst(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RankingMapper.findFirst", pd);
	}


	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("RankingMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

