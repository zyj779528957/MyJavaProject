package com.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



import com.common.Page;
import com.dao.ITopicDao;
import com.entity.Topic;

public class TopicDao extends BaseDao implements ITopicDao {


	@Override
	public Page getPage(int pageNo, int pageSize, Page page) {
		
		super.init();

		ArrayList<Topic> list = new ArrayList<Topic>();
		
		//分页流程
		//----------------------------------------------------
		//1.取总记录数
		String sql = "select count(tid) from topic";
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				//2.set 每页容量数到page对象中与总记录数到page对象中（必须先set入页容量数，在set入总记录数）
				page.setPageSize(pageSize);
				page.setTotalCount(rs.getInt(1));
			}
			
			//3.set 页码号到page对象中
			page.setPageNo(pageNo);
			
			
			//4.页面显示的数据
			sql=" select * from (select row_number() over(order by tid) as rid,t.* from topic t) t2 where t2.rid >?  and t2.rid <=? ";
			//或   sql="select * from (select rownum rn,t.* from topic t)a where rn>? and rn<=?";
		
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, (page.getPageNo() - 1) * pageSize);
			ps.setInt(2, page.getPageNo() * pageSize);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Topic t2 = new Topic();
				t2.setTid(rs.getInt("tid"));
				t2.setTname(rs.getString("tname"));
				
				list.add(t2);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//5.set所查询出的对象集合list到page对象中
		page.setPageList(list);
		
		System.out.println("---TopicDao---totalPageCount:"+page.getTotalPageCount());

		 
		super.close();
		return page;
	}

	
	@Override
	public List<Topic> getAll() {
		
		super.init();
		
		ArrayList<Topic> list = new ArrayList<Topic>();
		String sql = "select * from topic order by tid desc";
		
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			ResultSet rs = prestmt.executeQuery();
			
			while(rs.next()){
				Topic temp = new Topic();
				temp.setTid(rs.getInt("tid"));
				temp.setTname(rs.getString("tname"));
				
				list.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return list;
	}

	@Override
	public int add(Topic t2) {
		
		super.init();
		int num = 0;
		
		String sql = "insert into topic values(news_seq.nextval,?)";
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			prestmt.setString(1, t2.getTname());
			
			num = prestmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return num;
	}

	@Override
	public int update(Topic t2) {
		
		super.init();
		int num = 0;
		
		String sql = "update topic set tname=? where tid = ?";
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			prestmt.setString(1, t2.getTname());
			prestmt.setInt(2, t2.getTid());
			
			num = prestmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return num;
	}

	@Override
	public int delete(int tid) {
		
		super.init();
		int num = 0;
		
		String sql = "delete from topic where tid = ?";
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			
			prestmt.setInt(1, tid);
			
			num = prestmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return num;
	}

	@Override
	public Topic getOne(int tid) {
		
		super.init();
		Topic temp = new Topic();
		
		String sql = " select * from topic where tid = ? ";
		
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			prestmt.setInt(1, tid);
			ResultSet rs = prestmt.executeQuery();
			
			while(rs.next()){
				temp.setTid(rs.getInt("tid"));
				temp.setTname(rs.getString("tname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return temp;
	}

}
