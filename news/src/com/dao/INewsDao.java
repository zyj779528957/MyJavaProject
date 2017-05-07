package com.dao;

import java.util.List;
import com.entity.News;

/**
 * 数据层新闻接口
 * @author Aeyjie
 *
 */
public interface INewsDao {
	
	/**
	 * 得到所有新闻对象集合
	 * @return 
	 */
	List<News> getAll();
	
	/**
	 * 新增新闻
	 * @param n2
	 * @return
	 */
	int add(News n2);
	
	/**
	 * 修改新闻
	 * @param n2
	 * @return
	 */
	int update(News n2);
	
	/**
	 * 删除新闻
	 * @param nid
	 * @return
	 */
	int delete(int nid);
	
	/**
	 * 得到单个新闻对象
	 * @param nid
	 * @return
	 */
	News getOne(int nid);
	

}
