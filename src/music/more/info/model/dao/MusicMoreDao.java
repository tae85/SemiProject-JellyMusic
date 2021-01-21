package music.more.info.model.dao;

import static common.jdbcDriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import music.more.comment.model.vo.MusicCommentVO;
import music.more.info.model.vo.MusicMoreVO;

public class MusicMoreDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 음원 소개
	
	public List<MusicMoreVO> getMusicInfo(Connection conn, String mu_no){
		List<MusicMoreVO> list = new ArrayList<MusicMoreVO>();
		String sql = "select mu_no, m.art_no, al_no, mu_name, m.f_no, art_name, af.f_name from music m \n" + 
				"    left outer join artist a on m.art_no=a.art_no \n" + 
				"    left outer join allfile af on m.f_no = af.f_no\n" + 
				"where mu_no=?";
		try {
			System.out.println(mu_no);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mu_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MusicMoreVO vo = new MusicMoreVO();
					vo.setMu_no(rs.getString("mu_no"));
					vo.setMu_name(rs.getString("mu_name"));
					vo.setArt_no(rs.getString("art_no"));
					vo.setArt_name(rs.getString("art_name"));
					vo.setAl_no(rs.getString("al_no")); 
					vo.setF_no(rs.getString("f_no"));
					vo.setF_name(rs.getString("f_name"));
					list.add(vo);
				}while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	// 가사
	public List<MusicMoreVO> getLyrics(Connection conn, String mu_no){
		List<MusicMoreVO> list = new ArrayList<MusicMoreVO>();
		String sql = "select * from music where mu_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mu_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MusicMoreVO vo = new MusicMoreVO();
					vo.setMu_name(rs.getString("mu_name"));
					vo.setMu_ly(rs.getString("mu_ly"));
					vo.setF_no(rs.getString("f_no"));
					list.add(vo);
				}while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// 수록 앨범
	public List<MusicMoreVO> getIncludeAl(Connection conn, String mu_no){
		List<MusicMoreVO> list = new ArrayList<MusicMoreVO>();
		String sql = "select al_name, art_name, al_no, art_no, f.f_no, al_release, f.f_name from \n" + 
				"(select distinct al_name, art_name, al.al_no, art.art_no, al.f_no, al_release from music m   \n" + 
				"    left outer join album al on m.al_no = al.al_no\n" + 
				"    left outer join artist art on m.art_no = art.art_no\n" + 
				"    where m.mu_no=?) a\n" + 
				"    left outer join allfile f on a.f_no = f.f_no";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mu_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MusicMoreVO vo = new MusicMoreVO();
					vo.setAl_no(rs.getString("al_no"));
					vo.setAl_name(rs.getString("al_name"));
					vo.setArt_no(rs.getString("art_no"));
					vo.setArt_name(rs.getString("art_name"));
					vo.setF_no(rs.getString("f_no"));
					vo.setF_name(rs.getString("f_name"));
					vo.setAl_release(rs.getDate("al_release"));
					list.add(vo);
				}while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
		
	// 싱글
	public List<MusicMoreVO> getSingles(Connection conn, String mu_no){
		List<MusicMoreVO> list = new ArrayList<MusicMoreVO>();
		String sql = "select distinct al_name, art_name, al_no, art_no, a.f_no, f_name  from \n" + 
				"(select distinct al_name, art_name, al.al_no, art.art_no, al.f_no  from album al\n" + 
				"    left outer join music m on m.al_no = al.al_no\n" + 
				"    left outer join artist art on m.art_no = art.art_no\n" + 
				"    where art.art_no=(select art_no from music where mu_no=?)) a\n" + 
				"left outer join allfile f on a.f_no = f.f_no";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mu_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MusicMoreVO vo = new MusicMoreVO();
					vo.setAl_no(rs.getString("al_no"));
					vo.setAl_name(rs.getString("al_name"));
					vo.setArt_no(rs.getString("art_no"));
					vo.setArt_name(rs.getString("art_name"));
					vo.setF_no(rs.getString("f_no"));
					vo.setF_name(rs.getString("f_name"));
					/*
					 * vo.setAl_no(rs.getString("al_no")); vo.setArt_no(rs.getString("art_no"));
					 * vo.setF_no(rs.getString("f_no"));
					 */
					list.add(vo);
				}while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// 관련된 음악
	public List<MusicMoreVO> getRelated(Connection conn, String mu_no){
		List<MusicMoreVO> list = new ArrayList<MusicMoreVO>();
		String sql = "select * from \n" + 
				"    (select ROWNUM rnum, mu.* from \n" + 
				"        (select m.mu_no, mu_name, a.art_no, art_name, album.al_no, mu_mood, mu_every_play, al_name, album.f_no, f_name from music m "
				+ "			join artist a on m.art_no=a.art_no join album on m.al_no = album.al_no join allfile af on af.f_no=m.f_no "
				+ "		where m.mu_mood=(select mu_mood from music where mu_no=?) \n" + 
				"          order by mu_every_play desc) mu)\n" + 
				"where rnum >= 1 and rnum <= 5";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mu_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MusicMoreVO vo = new MusicMoreVO();
					vo.setMu_no(rs.getString("mu_no"));
					vo.setMu_name(rs.getString("mu_name"));
					vo.setArt_no(rs.getString("art_no"));
					vo.setArt_name(rs.getString("art_name"));
					vo.setAl_no(rs.getString("al_no"));
					vo.setMu_mood(rs.getInt("mu_mood"));
					vo.setMu_every_play(rs.getInt("mu_every_play"));
					vo.setAl_name(rs.getString("al_name"));
					vo.setF_no(rs.getString("f_no"));
					vo.setF_name(rs.getString("f_name"));
					list.add(vo);
				}while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// 댓글 	
	public List<MusicCommentVO> getCommentAll(Connection con, String mu_no){
		List<MusicCommentVO> list = new ArrayList<MusicCommentVO>();
		String sql = "select * from musiccomment where mu_no=? order by mu_date desc"; //댓글이 달리면 해당 ref 같은 글이 최상위로 올라오게 한다.
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mu_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					MusicCommentVO vo = new MusicCommentVO();
					vo.setMem_id(rs.getString("mem_id"));
					vo.setMu_no(rs.getString("mu_no"));
					vo.setMu_co_no(rs.getInt("mu_co_no"));
					vo.setMu_cont(rs.getString("mu_cont"));
					vo.setMu_ref(rs.getInt("mu_ref"));
					vo.setMu_step(rs.getInt("mu_step"));
					vo.setMu_level(rs.getInt("mu_level"));
					vo.setMu_likes(rs.getInt("mu_likes"));
					vo.setMu_hates(rs.getInt("mu_hates"));
					vo.setMu_report(rs.getInt("mu_report"));
					vo.setMu_date(rs.getDate("mu_date"));
					list.add(vo);
				} while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
}
