package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ContestDto;
import mysql.db.DbConnect;

public class ContestDao {
	
	DbConnect db=new DbConnect();
	
	//insert
	public void insertContest(ContestDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into contest (connum,id,subject,category,content,image,scrap_cnt,read_cnt,nickname,start_day,finally_day) values(null,?,?,?,?,?,0,0,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getImage());
			pstmt.setString(6, dto.getNickname());;
			pstmt.setString(7, dto.getStart_day());
			pstmt.setString(8, dto.getFinally_day());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<ContestDto> getAllConTest(){
		
		List<ContestDto> list=new ArrayList<ContestDto>();
		 
		Connection conn=db.getConnection(); 
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from contest order by connum";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				ContestDto dto=new ContestDto();
				
				dto.setConnum(rs.getString("connum"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject")); 
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setFinally_day(rs.getString("finally_day"));
				dto.setId(rs.getString("id"));
				dto.setScrap_cnt(rs.getInt("scrap_cnt"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setNickname(rs.getString("nickname"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
public ContestDto getData(String connum) {
		
		ContestDto dto=new ContestDto();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from contest where connum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, connum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setConnum(rs.getString("connum"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setImage(rs.getString("image"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setFinally_day(rs.getString("finally_day"));
				dto.setNickname(rs.getString("nickname"));
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public ContestDto getContest(int id) {
		
		ContestDto dto=new ContestDto();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from contest where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setConnum(rs.getString("connum"));
				dto.setId(rs.getString("id"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setFinally_day(rs.getString("finally_day"));
				dto.setScrap_cnt(rs.getInt("scrap_cnt"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setNickname(rs.getString("nickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void upReadCount(String connum) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update contest set read_cnt=read_cnt+1 where connum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, connum);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}