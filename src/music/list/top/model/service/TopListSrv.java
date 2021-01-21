package music.list.top.model.service;

import static common.jdbcDriver.JDBCTemplate.close;
import static common.jdbcDriver.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import music.list.top.model.dao.TopListDao;
import music.list.top.model.vo.TopListVO;

public class TopListSrv {
	public List<TopListVO> getTopListAll(){
		Connection conn = getConnection();
		List<TopListVO> result = new TopListDao().getTopListAll(conn);
		close(conn);
		return result;
	}

}
