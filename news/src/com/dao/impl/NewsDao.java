package com.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.INewsDao;
import com.entity.News;

public class NewsDao extends BaseDao implements INewsDao {

	@Override
	public List<News> getAll() {
		
		super.init();
		ArrayList<News> list = new ArrayList<News>();
		String sql = "select * from news order by nid desc";
		
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			ResultSet rs = prestmt.executeQuery();
			//有参构造：new News(Integer nid, Integer ntid, String ntitle, String nauthor, Date ncreatedate, String npicpath,String ncontent, Date nmodifydate, String nsummary)
			while(rs.next()){
				News temp = new News(rs.getInt("nid"), rs.getInt("ntid"), rs.getString("ntitle"), rs.getString("nauthor"),
						rs.getDate("ncreatedate"), rs.getString("npicpath"), rs.getString("ncontent"), rs.getDate("nmodifydate"), rs.getString("nsummary")); 
				list.add(temp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return list;
	}

	@Override
	public int add(News n2) {
		
		super.init();
		int num = 0;
		
		String sql = "insert into news( nid, ntid, ntitle, nauthor, ncreatedate, npicpath, ncontent, nsummary) values(news_seq.nextval,?,?,?,sysdate,?,?,?)";
		try {
			PreparedStatement  prestmt = super.conn.prepareStatement(sql);

			prestmt.setInt(1, n2.getNtid());
			prestmt.setString(2, n2.getNtitle());
			prestmt.setString(3, n2.getNauthor());
			prestmt.setString(4, n2.getNpicpath());
			prestmt.setString(5, n2.getNcontent());
			prestmt.setString(6, n2.getNsummary());
			
			num = prestmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return num;
	}

	@Override
	public int update(News n2) {
		
		super.init();
		int num = 0;
		
		//有参构造：new News(Integer nid, Integer ntid, String ntitle, String nauthor, Date ncreatedate, String npicpath,String ncontent, Date nmodifydate, String nsummary)
		String sql = "update news set ntid=?, ntitle=?, nauthor=?, npicpath=?, ncontent=?, nsummary=?, nmodifydate=sysdate where nid=?";

		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			
			prestmt.setInt(7, n2.getNid());
			prestmt.setInt(1, n2.getNtid());
			prestmt.setString(2, n2.getNtitle());
			prestmt.setString(3, n2.getNauthor());
			prestmt.setObject(4, n2.getNpicpath());
			prestmt.setString(5, n2.getNcontent());
			prestmt.setString(6, n2.getNsummary());
			
			
			num = prestmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return num;
	}

	@Override
	public int delete(int nid) {
		
		super.init();
		int num = 0;
		
		String sql = "delete from news where nid = ?";
		
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			prestmt.setInt(1, nid);
			
			num = prestmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return num;
	}

	@Override
	public News getOne(int nid) {
		
		super.init();
		News temp = null;
		
		String sql = "select * from news where nid = ?";
		
		try {
			PreparedStatement prestmt = super.conn.prepareStatement(sql);
			prestmt.setInt(1, nid);
			ResultSet rs = prestmt.executeQuery();
			
			while(rs.next()){
				temp = new News(rs.getInt("nid"), rs.getInt("ntid"), rs.getString("ntitle"), rs.getString("nauthor"),
						rs.getDate("ncreatedate"), rs.getString("npicpath"), rs.getString("ncontent"), rs.getDate("nmodifydate"), rs.getString("nsummary")); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		super.close();
		return temp;
	}

}
