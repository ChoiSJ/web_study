package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.QnaReplyVO;
import vo.QnaVO;

public class QnaDAO {
	
	public ArrayList<QnaVO> getListForPaging(int begin, int end) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, ISANSWER"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, ISANSWER"
					+" from SEMI_QNABOARD)"
					+" where rn >= ? and rn <= ?";
		
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaVO qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setTitle(rs.getString("title"));
			qna.setContent(rs.getString("content"));
			qna.setWriter(rs.getString("writer"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setCount(rs.getInt("count"));
			qna.setIsAnswer(rs.getInt("ISANSWER"));
	
			qnaList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaList;
	}
	
	public ArrayList<QnaVO> getListForPagingSerchByContent(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, isanswer"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, isanswer"
					+" from SEMI_QNABOARD)"
					+" where rn >= ? and rn <= ? and instr(CONTENT, ?) > 0";
		
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		pstmt.setString(3, value);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaVO qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setTitle(rs.getString("title"));
			qna.setContent(rs.getString("content"));
			qna.setWriter(rs.getString("writer"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setCount(rs.getInt("count"));
			qna.setIsAnswer(rs.getInt("isanswer"));
	
			qnaList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaList;
	}
	
	public ArrayList<QnaVO> getListForPagingSerchByTitle(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, isanswer"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, isanswer"
					+" from SEMI_QNABOARD)"
					+" where rn >= ? and rn <= ? and instr(TITLE, ?) > 0";
		
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		pstmt.setString(3, value);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaVO qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setTitle(rs.getString("title"));
			qna.setContent(rs.getString("content"));
			qna.setWriter(rs.getString("writer"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setCount(rs.getInt("count"));
			qna.setIsAnswer(rs.getInt("isanswer"));
	
			qnaList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaList;
	}
	
	public ArrayList<QnaVO> getListForPagingSerchByWriter(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, isanswer"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, isanswer"
					+" from SEMI_QNABOARD)"
					+" where rn >= ? and rn <= ? and instr(WRITER, ?) > 0";
		
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		pstmt.setString(3, value);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaVO qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setTitle(rs.getString("title"));
			qna.setContent(rs.getString("content"));
			qna.setWriter(rs.getString("writer"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setCount(rs.getInt("count"));
			qna.setIsAnswer(rs.getInt("isanswer"));
	
			qnaList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaList;
	}
	
	public ArrayList<QnaVO> getListForPagingSerchByTitleNContent(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, isanswer"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, isanswer"
					+" from SEMI_QNABOARD)"
					+" where rn >= ? and rn <= ? and ( instr(TITLE, ?) > 0 OR instr(CONTENT, ?) > 0 )";
		
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		pstmt.setString(3, value);
		pstmt.setString(4, value);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaVO qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setTitle(rs.getString("title"));
			qna.setContent(rs.getString("content"));
			qna.setWriter(rs.getString("writer"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setCount(rs.getInt("count"));
			qna.setIsAnswer(rs.getInt("isanswer"));
	
			qnaList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaList;
	}

	public int getTotalRows() throws SQLException {
		String sql = "select count(*) cnt from SEMI_QNABOARD";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	public int getSearchContentRows(String value) throws SQLException {
		String sql = "SELECT count(*) cnt FROM SEMI_QNABOARD s WHERE instr(s.CONTENT, ?) > 0 and (s.isanswer = 0 OR s.isanswer is null)";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	public int getSearchTitleRows(String value) throws SQLException {
		String sql = "SELECT count(*) cnt FROM SEMI_QNABOARD s WHERE instr(s.TITLE, ?) > 0 and (s.isanswer = 0 OR s.isanswer is null)";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	public int getSearchWriterRows(String value) throws SQLException {
		String sql = "SELECT count(*) cnt FROM SEMI_QNABOARD s WHERE instr(s.WRITER, ?) > 0 and (s.isanswer = 0 OR s.isanswer is null)";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	public int getSearchTitleNContentRows(String value) throws SQLException {
		String sql = "SELECT count(*) cnt FROM SEMI_QNABOARD s WHERE (instr(s.TITLE, ?) > 0 or instr(s.CONTENT, ?) > 0) and (s.isanswer = 0 OR s.isanswer is null)";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		pstmt.setString(2, value);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	
	public ArrayList<QnaVO> getReplyList(int isanswer) throws SQLException {
		String sql = "SELECT s.no, s.isanswer, s.WRITER,to_char(s.regdate, 'yyyy-mm-dd hh24:mi:ss') regdate,s.CONTENT"
				+ " FROM SEMI_QNABOARD s"
				+ " WHERE s.isanswer = ? and s.isanswer != 0 and s.isanswer is not null"
					+" ORDER BY s.NO";
		
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, isanswer);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaVO qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setIsAnswer(rs.getInt("isanswer"));
			qna.setWriter(rs.getString("WRITER"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setContent(rs.getString("CONTENT"));
			
			qnaList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaList;
	}
	
	public QnaReplyVO getQnaReply(int value) throws SQLException {
		String sql = "SELECT s.no, s.localno, s.WRITER,to_char(s.regdate, 'yyyy-mm-dd hh24:mi:ss') regdate,s.CONTENT"
				+ " FROM SEMI_QNABOARD_reply s WHERE s.localno = ?"
				+ " ORDER BY s.NO";
		
		QnaReplyVO qnaReply = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, value);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			qnaReply = new QnaReplyVO();
			qnaReply.setNo(rs.getInt("no"));
			qnaReply.setLocalNo(rs.getInt("localno"));
			qnaReply.setWriter(rs.getString("WRITER"));
			qnaReply.setRegdate(rs.getString("regdate"));
			qnaReply.setContent(rs.getString("CONTENT"));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaReply;
	}
	
	public QnaVO getQnaByNo(int no) throws SQLException {
		this.addCount(no);
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM SEMI_QNABOARD where no = ?");
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		QnaVO qna = null;
		while (rs.next()) {
			qna = new QnaVO();
			qna.setNo(rs.getInt("no"));
			qna.setTitle(rs.getString("title"));
			qna.setContent(rs.getString("content"));
			qna.setWriter(rs.getString("writer"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setCount(rs.getInt("count"));
			qna.setIsAnswer(rs.getInt("isanswer"));
		}
			
		rs.close();
		pstmt.close();
		con.close();
		
		return qna;
	}
	
	public void addQna(QnaVO qna) throws SQLException {
		String INSERT_SQL = "INSERT INTO SEMI_QNABOARD (NO, TITLE, CONTENT, WRITER, REGDATE, COUNT, isanswer)"
							+" VALUES(qnabd_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, qna.getTitle());
		pstmt.setString(2, qna.getContent());
		pstmt.setString(3, qna.getWriter());
		pstmt.setInt(4, qna.getCount());
		pstmt.setInt(5, qna.getIsAnswer());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void modifyQna(QnaVO qna) throws SQLException {
		String INSERT_SQL = "UPDATE SEMI_QNABOARD SET TITLE = ?, CONTENT = ? WHERE NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, qna.getTitle());
		pstmt.setString(2, qna.getContent());
		pstmt.setInt(3, qna.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void modifyQnaReply(QnaReplyVO qnaReply) throws SQLException {
		String INSERT_SQL = "UPDATE SEMI_QNABOARD_REPLY SET CONTENT = ? WHERE NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, qnaReply.getContent());
		pstmt.setInt(2, qnaReply.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/*
	 *    NO        NUMBER,
   		CONTENT   VARCHAR2 (1000),
   		WRITER    VARCHAR2 (100),
   		REGDATE   DATE,
   		LOCALNO   NUMBER
	 */
	
	public void addQnaReply(QnaReplyVO qna) throws SQLException {
		String INSERT_SQL = "INSERT INTO SEMI_QNABOARD_REPLY (NO, CONTENT, WRITER, REGDATE, LOCALNO)"
							+" VALUES(qnabdreply_seq.nextval, ?, ?, sysdate, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, qna.getContent());
		pstmt.setString(2, qna.getWriter());
		pstmt.setInt(3, qna.getLocalNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void addCount(int no) throws SQLException {
		String INSERT_SQL = "UPDATE SEMI_QNABOARD SET COUNT = nvl(COUNT,0)+1 WHERE NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void deleteQna(int no) throws SQLException {
		String INSERT_SQL = "DELETE FROM SEMI_QNABOARD WHERE NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void deleteQnaReply(int no) throws SQLException {
		String INSERT_SQL = "DELETE FROM SEMI_QNABOARD_REPLY WHERE NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void updateReplyByNo(int no, int gno) throws SQLException {
		String sql = "update semi_qnaboard set isVisible = 'No' where no = ? and gno = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setInt(2, gno);
			
		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	}
	
	public ArrayList<QnaReplyVO> getQnaReplyList(int gno) throws SQLException {
		String sql = "SELECT s.no, s.gno, s.WRITER, to_char(s.regdate, 'yyyy-mm-dd hh24:mi:ss') regdate, s.CONTENT, s.ISVISIBLE isvisible"
				+ " FROM SEMI_QNABOARD_REPLY s"
				+ " WHERE s.GNO = ? and s.gno != 0 and s.gno is not null"
				+" ORDER BY s.NO";
		
		ArrayList<QnaReplyVO> qnaReList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, gno);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			QnaReplyVO qna = new QnaReplyVO();
			qna.setNo(rs.getInt("no"));
			qna.setGno(rs.getInt("gno"));
			qna.setWriter(rs.getString("WRITER"));
			qna.setRegdate(rs.getString("regdate"));
			qna.setContent(rs.getString("CONTENT"));
			qna.setIsVisible(rs.getString("isvisible"));
			
			qnaReList.add(qna);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return qnaReList;
	}
}