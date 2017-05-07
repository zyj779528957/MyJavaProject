package com.service;

import java.util.HashMap;
import java.util.List;

import com.common.Page;
import com.entity.Topic;

public interface ITopicService {
	
	/**
	 * 分页查询
	 * @param pageNo：request中传过来的第几页
	 * @param pageSize：每页有多少行
	 * @return
	 */
	Page getPage(int pageNo, int pageSize, Page page);
	
	/**
	 * 得到所有主题对象集合
	 * @return
	 */
	List<Topic> getAll();
	
	/**
	 * 新增主题
	 * @param t2
	 * @return
	 */
	int add(Topic t2);
	
	/**
	 * 修改主题
	 * @param t2
	 * @return
	 */
	int update(Topic t2);
	
	/**
	 * 删除主题
	 * @param tid
	 * @return
	 */
	int delete(int tid);
	
	/**
	 * 得到单个主题对象
	 * @param tid
	 * @return
	 */
	Topic getOne(int tid);

	
}
