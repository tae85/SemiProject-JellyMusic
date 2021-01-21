package music.musicsearch.model.service;

import static common.jdbcDriver.JDBCTemplate.close;
import static common.jdbcDriver.JDBCTemplate.getConnection;
import java.sql.Connection;
import java.util.List;

import music.musicsearch.model.vo.MusicSearchVO;
import music.musicsearch.model.dao.MusicSearchDao;


public class MusicSearchSrv {
	public List<MusicSearchVO>getMusicSearchAll(){
		Connection conn = getConnection();
		List<MusicSearchVO> result = new MusicSearchDao().getMusicSearchAll(conn);
		close(conn);
		return result;

	
	
}
}
