package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import data.dto.QuestionDto;
import mysql.db.DbConnect;

public class QuestionDao {
	
	DbConnect db=new DbConnect();
	
	//insert
	public void insertQuestion(QuestionDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into question (id,subject,content,write_day) values (?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			//실행
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
		
		String sql="select count(*) from question";
		
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
	
	//전체 데이터를 리스트에 담아서 리턴
	public List<QuestionDto> getAllDatas()
	{
		List<QuestionDto> list = new Vector<QuestionDto>();
	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		String sql = "select * from question order by qnum desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				QuestionDto dto = new QuestionDto();
				
				dto.setQnum(rs.getString("qnum"));
				dto.setContent(rs.getString("content"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setWrite_day(rs.getTimestamp("write_day"));
				
				//list추가
				list.add(dto);
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	} 
	

	
	//전체출력...페이지에서 필요한 만큼만 리턴
	public List<QuestionDto> getList(int start,int perpage)
	{
		List<QuestionDto> list=new Vector<QuestionDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from question order by qnum desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				QuestionDto dto = new QuestionDto();
				dto.setQnum(rs.getString("qnum"));
				dto.setContent(rs.getString("content"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
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
	//qnum에 해당하는 데이터 리턴
	public QuestionDto getData(String qnum)
	{
		QuestionDto dto = new QuestionDto();
	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		String sql = "select * from question where qnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, qnum);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				
				dto.setQnum(rs.getString("qnum"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setSubject(rs.getString("subject"));
				dto.setWrite_day(rs.getTimestamp("write_day"));
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	

	//수정
	
		public void updateQuestion(QuestionDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update question set content=?, subject=? where qnum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getContent());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getQnum());

				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
	
	
	//삭제
	
	public void deleteQuestion(String qnum)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from question where qnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, qnum);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}
