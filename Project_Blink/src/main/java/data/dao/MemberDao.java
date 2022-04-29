package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
import data.dto.QuestionDto;
import mysql.db.DbConnect;

public class MemberDao {
	
	DbConnect db = new DbConnect();
	
	//아이디체크
	public boolean isIdCheck(String id)
	{
		boolean b = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String sql = "select * from member where id=?";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
				
			rs= pstmt.executeQuery();
				
			if(rs.next())
				b = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return b;
		}
		
		
	//insert	
	public void insertMember(MemberDto dto)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into member values (null, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_type());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getPw());
			pstmt.setString(5, dto.getContact());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getEmail());
			pstmt.setString(8, dto.getCompany());
					
			pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
	
	//비밀번호 체크
	public boolean checkPass(String nickname, String pw)
	{
	boolean b = false;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String sql = "select * from member where nickname=? and pw=?";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, pw);
			
			rs= pstmt.executeQuery();
				
			if(rs.next())
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return b;
	}
	//로그인
	public int isIdPass(String nickname, String pw){
	
	int idx = 0; //경우의 수
			
	Connection conn = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
			
	String sql = "select * from member where nickname=?";
			
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
				
		rs = pstmt.executeQuery();
				
		if(rs.next()) {
			//비번 비교
			if(rs.getString("pw").equals(pw))
				idx = 1;
			else
				idx = 2;
		} else {
			idx = 3;
		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return idx;
		}	


	//로그인에 해당하는 아이디 가져오기
	public String getId(String email)
	{
		
		String myid="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where email=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				myid=rs.getString("id");
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}				
		return myid;
	}
	
	
	
	public String getNickname(String id)
	{
		String nickname = "";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				nickname = rs.getString("nickname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return nickname;
	}
	
	public String getMembertype(String id)
	{
		String member_type = "";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				member_type = rs.getString("member_type");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return member_type;
	}
		
}
