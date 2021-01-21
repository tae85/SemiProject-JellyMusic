package manager.model.dao;

import static common.jdbcDriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import manager.model.vo.SearchMgMemberVO;

public class SearchMgMemberDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public List<SearchMgMemberVO> memList(Connection conn, int start, int end) throws SQLException, Exception {
		List<SearchMgMemberVO> list = null;
		String sql = "select * from (select rownum rnum, B.* from (select * from member order by mem_id) B)"
				+ " where rnum >=? and rnum <=?";
		// mem_id varchar2(30) ,
		// mem_pwd varchar2(30) not null,
		// mem_name varchar2(30) unique not null,
		// mem_addr varchar2(90) not null,
		// mem_email varchar2(30) not null,
		// mem_phone number(11) not null,
		// mem_sns char(1) not null,
		// mem_name varchar2(30) not null,
		// mem_birth date not null,
		// mem_reg_date date default sysdate,
		// mem_wd_date date,
		// CONSTRAINT PK_MEMID PRIMARY KEY (mem_id),
		// CONSTRAINT CHK_SNS CHECK (mem_sns IN (0, 1))
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			list = new ArrayList<SearchMgMemberVO>();
			do {
				SearchMgMemberVO mvo = new SearchMgMemberVO();
				mvo.setMem_id(rs.getString("mem_id"));
				mvo.setMem_pwd(rs.getString("mem_pwd"));
				mvo.setMem_name(rs.getString("mem_name"));
				mvo.setMem_addr(rs.getString("mem_addr"));
				mvo.setMem_email(rs.getString("mem_email"));
				mvo.setMem_phone(rs.getInt("mem_phone"));
				mvo.setMem_sns(rs.getString("mem_sns").charAt(0));
				mvo.setMem_name(rs.getString("mem_name"));
				mvo.setMem_birth(rs.getDate("mem_birth"));
				mvo.setMem_reg_date(rs.getDate("mem_reg_date"));
				mvo.setMem_wd_date(rs.getDate("mem_wd_date"));
				list.add(mvo);
			} while (rs.next());
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int getBoardCount(Connection conn) throws SQLException, Exception {
		int cnt = 0;
		String sql = "select COUNT(*) from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		close(rs);
		close(pstmt);
		return cnt;
	}

	public List<SearchMgMemberVO> memSearch(Connection conn, String searchWord, int start, int end) throws SQLException, Exception {
		List<SearchMgMemberVO> list = null;
		String sql = "select * " + 
				"    from (select ROWNUM rnum, mem.* from (SELECT m.* " + 
				"    from (select * FROM member WHERE mem_id LIKE ? order by mem_id) m) mem) " + 
				"    where rnum >=? and rnum <=?";
		
		String searchWord1 = "%" + searchWord + "%";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchWord1);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			list = new ArrayList<SearchMgMemberVO>();
			do {
				SearchMgMemberVO mvo = new SearchMgMemberVO();
				mvo.setMem_id(rs.getString("mem_id"));
				mvo.setMem_pwd(rs.getString("mem_pwd"));
				mvo.setMem_name(rs.getString("mem_name"));
				mvo.setMem_addr(rs.getString("mem_addr"));
				mvo.setMem_email(rs.getString("mem_email"));
				mvo.setMem_phone(rs.getInt("mem_phone"));
				mvo.setMem_sns(rs.getString("mem_sns").charAt(0));
				mvo.setMem_name(rs.getString("mem_name"));
				mvo.setMem_birth(rs.getDate("mem_birth"));
				mvo.setMem_reg_date(rs.getDate("mem_reg_date"));
				mvo.setMem_wd_date(rs.getDate("mem_wd_date"));
				list.add(mvo);
			} while (rs.next());
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public int memDelete(Connection conn, int mem_id) throws SQLException, Exception {
		int result = 0;
		String sql = "delete from member where mem_id = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem_id);

		result = pstmt.executeUpdate();

		close(rs);
		close(pstmt);
		return result;
	}
}
