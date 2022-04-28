package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import data.dto.ReviewDto;
import mysql.db.DbConnect;

public class ReviewDao {

	DbConnect db=new DbConnect();
	
	public void insertReview(ReviewDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into review (id,subject,content,image,link,write_day) values (?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImage());
			pstmt.setString(5, dto.getLink());
			//실행
			pstmt.execute();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체 데이타 리스트에 리턴
	public List<ReviewDto> getAllDatas(){
		List<ReviewDto> list=new Vector<ReviewDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from review order by rnum desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				ReviewDto dto=new ReviewDto();
				dto.setRnum(rs.getString("rnum"));
				dto.setId(rs.getString("id"));
				dto.setConnum(rs.getString("connum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setLink(rs.getString("link"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setLike_cnt(rs.getInt("like_cnt"));
				dto.setWrite_day(rs.getTimestamp("write_day"));
				
				//list추가
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//조회수 1증가
	public void updateReadCount(String rnum)
	{
		String sql="update review set read_cnt="
				+"read_cnt+1 where rnum=?";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, rnum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//num에 해당하는 데이터 리턴
	public ReviewDto getData(String rnum)
	{
		ReviewDto dto=new ReviewDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from review where rnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, rnum);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setRnum(rs.getString("rnum"));
				dto.setId(rs.getString("id"));
				dto.setConnum(rs.getString("connum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setLink(rs.getString("link"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setLike_cnt(rs.getInt("like_cnt"));
				dto.setWrite_day(rs.getTimestamp("write_day"));
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
		//수정
	
	public void updateReview(ReviewDto dto)
	{
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update review set id=?,subject=?,content=?,image=?,link=? where rnum=?";
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImage());
			pstmt.setString(5, dto.getLink());
			pstmt.setString(6, dto.getRnum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//삭제
	public void deleteReview(String rnum)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from review where rnum=?";
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, rnum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	//1.페이징 처리
	public int getTotalCount() {
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from review";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				n=rs.getInt(1);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return n;
	}
	
	//2.페이징처리에 필요한 리스트만 보내기
	public List<ReviewDto> getList(int start, int perpage)
	{
		List<ReviewDto> list=new Vector<ReviewDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from review order by rnum desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				ReviewDto dto=new ReviewDto();
				dto.setRnum(rs.getString("rnum"));
				dto.setId(rs.getString("id"));
				dto.setConnum(rs.getString("connum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setLink(rs.getString("link"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setLike_cnt(rs.getInt("like_cnt"));
				dto.setWrite_day(rs.getTimestamp("write_day"));
				
				//list추가
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
		
	}
	//추천클릭시 추천수 증가..ajax
		public void updateLike_cnt(String rnum)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update review set like_cnt=like_cnt+1 where rnum=?";
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, rnum);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
}
