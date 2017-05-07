package com.service.impl;

import java.util.HashMap;
import java.util.List;

import com.common.Page;
import com.dao.ITopicDao;
import com.dao.impl.TopicDao;
import com.entity.Topic;
import com.service.ITopicService;

/**
 * 业务层主题实现类
 * @author Aeyjie
 *
 */
public class TopicService implements ITopicService{
	

	private ITopicDao dao = new TopicDao();

	@Override
	public Page getPage(int pageNo, int pageSize ,Page page) {
		
		return dao.getPage(pageNo, pageSize, page);
	}
	
	
	@Override
	public List<Topic> getAll() {
		return dao.getAll();
	}

	@Override
	public int add(Topic t2) {
		return dao.add(t2);
	}

	@Override
	public int update(Topic t2) {
		return dao.update(t2);
	}

	@Override
	public int delete(int tid) {
		return dao.delete(tid);
	}

	@Override
	public Topic getOne(int tid) {
		return dao.getOne(tid);
	}
	

}
