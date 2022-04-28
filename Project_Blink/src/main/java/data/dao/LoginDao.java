package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.db.DbConnect;

public class LoginDao {
	
	DbConnect db=new DbConnect();
	
	//nickname를 통해 name값을 얻는다
	public String getName(String email)
	{
		String name = "";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where email=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}
	
	
	
	//nickname에 맞는 pw인지를 확인
	public boolean isLogin(String email,String pw)
	{
		boolean flag = false;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where email=? and pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
		
	}

}