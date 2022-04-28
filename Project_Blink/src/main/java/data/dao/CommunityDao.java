package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.CommunityDto;
import mysql.db.DbConnect;

public class CommunityDao {

	DbConnect db=new DbConnect();
	
	//insert
		public void insertCommunity(CommunityDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="insert into communityboard (id,subject,content,write_day) values (?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		//totalCount
		public int getTotalCount()
		{
			int n=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from communityboard";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					n=rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return n;
		}
		
		//전체출력...페이지에서 필요한 만큼만 리턴
		public List<CommunityDto> getList(int start,int perpage)
		{
			List<CommunityDto> list=new Vector<CommunityDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from communityboard order by bnum desc limit ?,?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, perpage);
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					CommunityDto dto=new CommunityDto();
					
					dto.setBnum(rs.getString("bnum"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setRead_cnt(rs.getInt("read_cnt"));
					dto.setLike_cnt(rs.getInt("like_cnt"));
					dto.setWrite_day(rs.getTimestamp("write_day"));
					
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
		
		//num에해당하는 dto반환
		public CommunityDto getData(String bnum)
		{
			CommunityDto dto=new CommunityDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from communityboard where bnum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, bnum);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					dto.setBnum(rs.getString("bnum"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
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
		
	
	
	//조회수증가
		public void updateReadCount(String bnum)
		{
			String sql="update communityboard set read_cnt="
					+ "read_cnt+1 where bnum=?";
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, bnum);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
	//삭제메소드
		public void deleteCommunity(String bnum)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from communityboard where bnum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, bnum);
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
	//수정메소드
		public void updateCommunity(CommunityDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update communityboard set subject=?,content=? where bnum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getBnum());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		//추천클릭시 추천수 증가
		public void updateLike_cnt(String bnum)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update communityboard set like_cnt=like_cnt+1 where bnum=?";
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, bnum);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
	
				
}
