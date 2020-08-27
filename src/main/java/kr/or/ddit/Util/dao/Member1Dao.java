package kr.or.ddit.Util.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;

import kr.or.ddit.Util.DBUtil;

public class Member1Dao {

	private static Member1Dao memberDao = new Member1Dao();

	private Member1Dao() {

	}

	public static Member1Dao getInstance() {

		return memberDao;

	}

	public JSONArray getCountAddress() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		JSONArray jsonArray = new JSONArray();
		JSONArray colNameArray = new JSONArray(); // 컬 타이틀 설정

		colNameArray.add("100이하");
		colNameArray.add("총 인원 수");
		jsonArray.add(colNameArray);

		try {

			con = DBUtil.getConnection();
			sql = "select is_100, count(*) cnt from IQ_STATISTICS GROUP BY is_100 having is_100 < 100 order by cnt";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONArray rowArray = new JSONArray();

				rowArray.add(rs.getInt("is_100"));
				rowArray.add(rs.getInt("cnt"));
				jsonArray.add(rowArray);

			}// while

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			DBUtil.close(con, pstmt, rs);
		}

		return jsonArray;
	}
}
