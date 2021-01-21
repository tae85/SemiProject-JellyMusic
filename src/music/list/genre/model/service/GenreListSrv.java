package music.list.genre.model.service;

import static common.jdbcDriver.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import music.list.genre.model.dao.GenreListDao;
import music.list.genre.model.vo.GenreListVO;

public class GenreListSrv {
	public List<GenreListVO> setGenreListAll(){
		Connection conn = getConnection();
		List<GenreListVO> gvo =new GenreListDao().setGenreListAll(conn);
		close(conn);
		return gvo;
	}
	
}
