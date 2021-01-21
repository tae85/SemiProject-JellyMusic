package music.musicsearch.model.dao;

import static common.jdbcDriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import music.musicsearch.model.vo.MusicSearchVO;

public class MusicSearchDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<MusicSearchVO>getMusicSearchAll(Connection conn) {
		List<MusicSearchVO> list = new ArrayList<MusicSearchVO>();
		String sql = "select mu_no, mu_name, art.art_no, art_name, mu_ly, al.al_no, al.al_name from music m"
				+ "    left outer join album al on m.al_no = al.al_no"
				+ "    left outer join artist art on m.art_no = art.art_no" + "    where al.al_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					MusicSearchVO vo = new MusicSearchVO();
					vo.setMu_no(rs.getString("mu_no"));
					vo.setMu_name(rs.getString("mu_name"));
					vo.setArt_no(rs.getString("art_no"));
					vo.setArt_name(rs.getString("art_name"));
					vo.setAl_no(rs.getString("al_no"));
					vo.setAl_name(rs.getString("al_name"));
					vo.setMu_ly(rs.getString("mu_ly"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}



}
