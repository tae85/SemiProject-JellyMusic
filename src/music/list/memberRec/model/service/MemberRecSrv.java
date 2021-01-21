package music.list.memberRec.model.service;


import static common.jdbcDriver.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import music.list.memberRec.model.dao.MemberRecDao;
import music.list.memberRec.model.vo.MemberRecVO;

public class MemberRecSrv {
	private String mem_id;

	public List<MemberRecVO> setMemberRecAll(){
		Connection conn = getConnection();
		List<MemberRecVO> rvo = new MemberRecDao().setMemberRecAll(conn, mem_id);
		close(conn);
		return rvo;
		
	}
	
}