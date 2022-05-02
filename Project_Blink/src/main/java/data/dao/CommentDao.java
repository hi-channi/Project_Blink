package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.CommentDto;
import mysql.db.DbConnect;

public class CommentDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void insertComment(CommentDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into comment (cnum,id,bnum,content,write_day) values (null,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getBnum());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체출력
	public List<CommentDto> getAllComment(String cnum)
	{
		List<CommentDto> list=new Vector<CommentDto>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from comment where bnum=? order by cnum";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cnum);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				CommentDto dto=new CommentDto();
				dto.setCnum(rs.getString("cnum"));
				dto.setId(rs.getString("id"));
				dto.setBnum(rs.getString("bnum"));
				dto.setContent(rs.getString("content"));
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
	//삭제
	public void deleteComment(String cnum)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from comment where cnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cnum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
