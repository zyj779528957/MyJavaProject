package com.service.impl;

import java.util.List;

import com.dao.INewsDao;
import com.dao.impl.NewsDao;
import com.entity.News;
import com.service.INewsService;

/**
 * 业务层新闻实现类
 * @author Aeyjie
 *
 */
public class NewsService implements INewsService {
	
	private INewsDao dao = new NewsDao();

	@Override
	public List<News> getAll() {
		return dao.getAll();
	}

	@Override
	public int add(News n2) {
		return dao.add(n2);
	}

	@Override
	public int update(News n2) {
		return dao.update(n2);
	}

	@Override
	public int delete(int nid) {
		return dao.delete(nid);
	}

	@Override
	public News getOne(int nid) {
		return dao.getOne(nid);
	}


}
