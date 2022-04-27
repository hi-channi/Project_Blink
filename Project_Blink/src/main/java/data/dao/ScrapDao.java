package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.ScrapDto;
import mysql.db.DbConnect;

public class ScrapDao {
	DbConnect db=new DbConnect();
	
	// 스크랩북(scrap)에 공모전 추가
	public void insertScrap(ScrapDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into scrap values (null,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getConnum());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 스크랩북 출력(Join)
		public List<HashMap<String, String>> getScrapbook(String id) {
			List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// 스크랩번호(PK), 공모전 제목, 공모전 번호, 공모전 이미지, 스크랩북에 추가한 날짜(id)
			String sql = "select s.snum, c.subject, c.connum, c.image, s.sday from scrap s,"
					+ "contest c, member m where s.snum=c.snum and s.id=c.id and m.id=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("snum", rs.getString("snum"));
					map.put("subject", rs.getString("subject"));
					map.put("connum", rs.getString("connum"));
					map.put("image", rs.getString("image"));
					map.put("sday", rs.getString("sday"));

					list.add(map);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}
		
		// 스크랩한 공모전 삭제
		public void deleteScrap(String snum) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			String sql = "delete from scrap where snum=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, snum);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
		
}
