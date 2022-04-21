package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.TestDto;
import mysql.db.DbConnect;

public class TestDao {
	
	DbConnect db=new DbConnect();
	
	public List<TestDto> getAllData() {
		List<TestDto> list = new Vector<TestDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from test order by num";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TestDto dto = new TestDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setGitname(rs.getString("gitname"));
				dto.setStartday(rs.getTimestamp("startday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
}
