package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.AnswerDto;
import mysql.db.DbConnect;

public class AnswerDao {

	DbConnect db = new DbConnect();
	
	
	//insert
		public void insertAnswer(AnswerDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="insert into answer (id,qnum,content,write_day) values (?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getQnum());
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
		
		//전체출력
		public List<AnswerDto> getAllAnswer(String qnum)
		{
			List<AnswerDto> list = new Vector<AnswerDto>();
		
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			
			String sql = "select * from answer where qnum=? order by anum";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, qnum);
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					AnswerDto dto = new AnswerDto();
					
					dto.setAnum(rs.getString("anum"));
					dto.setId(rs.getString("id"));
					dto.setQnum(rs.getString("qnum"));
					dto.setContent(rs.getString("content"));
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
		
		//삭제
		
		public void deleteAnswer(String anum)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from answer where anum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, anum);
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		

}
