package demo3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

public class BoardDAO {
	
	// 새로운 게시글 저장하기
	public void addNewBoard(BoardVO board) throws SQLException {
		String sql = "insert into tb_board (no, title, writer, contents, ip) "
				+ "values (board_seq.nextval, ?, ?, ?, ?) ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContents());
		pstmt.setString(4, board.getIp());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 등록된 모든 게시글을 제공하기
	public ArrayList<BoardVO> getAllBoard() throws SQLException {
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		String sql = "select no, title, regdate "
				+ "from tb_board "
				+ "order by no desc ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BoardVO board = new BoardVO();
			board.setNo(rs.getInt("no"));
			board.setTitle(rs.getString("title"));
			board.setRegdate(rs.getDate("regdate"));
			
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	// 특정 글 번호에 해당하는 게시글을 제공하기
	public BoardVO getBoardByNo(int no) throws SQLException {
		String sql = "select * from tb_board where no = ? ";
		BoardVO board = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			board = new BoardVO();
			board.setNo(rs.getInt("no"));
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setLikes(rs.getInt("likes"));
			board.setContents(rs.getString("contents"));
			board.setRegdate(rs.getDate("regdate"));
			board.setIp(rs.getString("ip"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return board;
	}
	
	// 특정 글 번호에 해당하는 게시글을 삭제하기
	public void removeBoard(int no) throws SQLException {
		String sql = "delete from tb_board where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 제목에 특정 단어가 포함된 게시글을 제공하기
	
}
