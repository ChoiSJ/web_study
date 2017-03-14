package dao;

import java.sql.SQLException;
import java.util.List;

import util.SqlMapperUtil;
import vo.BoardVO;

public class BoardDAO {
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> getAllBoards() throws SQLException {
		return SqlMapperUtil.getSqlMapper().queryForList("getAllBoards");
	}
	
	public void deleteBoard(int no) throws SQLException {
		SqlMapperUtil.getSqlMapper().delete("deleteBoard", no);
	}
	
	public void addBoard(BoardVO board) throws SQLException {
		SqlMapperUtil.getSqlMapper().insert("addBoard", board);
	}
	
	public BoardVO getBoardByNo(int no) throws SQLException {
		return (BoardVO) SqlMapperUtil.getSqlMapper().queryForObject("getBoardByNo", no);
	}
	
	public void modifyBoardByNo(BoardVO board) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("modifyBoardByNo", board);
	}
	
	public void plusLikeCount(int no) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("plusLikeCount", no);
	}
}
