package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.FreeVO;

public class FreeDAO {
	
	public ArrayList<FreeVO> getListForPaging(int begin, int end) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, GNO"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, GNO"
					+" from SEMI_FREEBOARD WHERE gno = 0 or gno is null)"
					+" where rn >= ? and rn <= ?";
		
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO free = new FreeVO();
			free.setNo(rs.getInt("no"));
			free.setTitle(rs.getString("title"));
			free.setContent(rs.getString("content"));
			free.setWriter(rs.getString("writer"));
			free.setRegdate(rs.getString("regdate"));
			free.setCount(rs.getInt("count"));
			free.setGno(rs.getInt("gno"));
	
			freeList.add(free);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}
	
	public ArrayList<FreeVO> getListForPagingSerchByContent(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, GNO"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, GNO"
					+" from SEMI_FREEBOARD WHERE (gno = 0 or gno is null) and instr(CONTENT, ?) > 0)"
					+" where rn >= ? and rn <= ?";
		
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO free = new FreeVO();
			free.setNo(rs.getInt("no"));
			free.setTitle(rs.getString("title"));
			free.setContent(rs.getString("content"));
			free.setWriter(rs.getString("writer"));
			free.setRegdate(rs.getString("regdate"));
			free.setCount(rs.getInt("count"));
			free.setGno(rs.getInt("gno"));
	
			freeList.add(free);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}
	
	public ArrayList<FreeVO> getListForPagingSerchByTitle(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, GNO"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, GNO"
					+" from SEMI_FREEBOARD WHERE (gno = 0 or gno is null) and instr(TITLE, ?) > 0)"
					+" where rn >= ? and rn <= ?";
		
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO free = new FreeVO();
			free.setNo(rs.getInt("no"));
			free.setTitle(rs.getString("title"));
			free.setContent(rs.getString("content"));
			free.setWriter(rs.getString("writer"));
			free.setRegdate(rs.getString("regdate"));
			free.setCount(rs.getInt("count"));
			free.setGno(rs.getInt("gno"));
	
			freeList.add(free);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}
	
	public ArrayList<FreeVO> getListForPagingSerchByWriter(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, GNO"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" 		 NO, TITLE, CONTENT, WRITER, regdate, COUNT, GNO"
					+" 		 from SEMI_FREEBOARD "
					+ "		 WHERE (gno = 0 or gno is null) and instr(WRITER, ?) > 0)"
					+" where rn >= ? and rn <= ?";
		
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO free = new FreeVO();
			free.setNo(rs.getInt("no"));
			free.setTitle(rs.getString("title"));
			free.setContent(rs.getString("content"));
			free.setWriter(rs.getString("writer"));
			free.setRegdate(rs.getString("regdate"));
			free.setCount(rs.getInt("count"));
			free.setGno(rs.getInt("gno"));
	
			freeList.add(free);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}
	
	public ArrayList<FreeVO> getListForPagingSerchByTitleNContent(int begin, int end, String value) throws Exception{
		String sql = "SELECT NO, TITLE, CONTENT, WRITER, to_char(regdate, 'yyyy-mm-dd') regdate, COUNT, GNO"
					+" from (SELECT row_number() over (order by no desc) rn,"
					+" NO, TITLE, CONTENT, WRITER, regdate, COUNT, GNO"
					+" from SEMI_FREEBOARD WHERE (gno = 0 or gno is null)  and ( instr(TITLE, ?) > 0 OR instr(CONTENT, ?) > 0 ))"
					+" where rn >= ? and rn <= ?";
		
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, value);
		pstmt.setString(2, value);
		pstmt.setInt(3, begin);
		pstmt.setInt(4, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO free = new FreeVO();
			free.setNo(rs.getInt("no"));
			free.setTitle(rs.getString("title"));
			free.setContent(rs.getString("content"));
			free.setWriter(rs.getString("writer"));
			free.setRegdate(rs.getString("regdate"));
			free.setCount(rs.getInt("count"));
			free.setGno(rs.getInt("gno"));
	
			freeList.add(free);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}

	public int getTotalRows() throws SQLException {
		String sql = "select count(*) cnt from SEMI_FREEBOARD WHERE GNO = 0 OR GNO is null";
		
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
		String sql = "SELECT count(*) cnt FROM SEMI_FREEBOARD s WHERE instr(s.CONTENT, ?) > 0 and (s.GNO = 0 OR s.GNO is null)";
		
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
		String sql = "SELECT count(*) cnt FROM SEMI_FREEBOARD s WHERE instr(s.TITLE, ?) > 0 and (s.GNO = 0 OR s.GNO is null)";
		
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
		String sql = "SELECT count(*) cnt FROM SEMI_FREEBOARD s WHERE instr(s.WRITER, ?) > 0 and (s.GNO = 0 OR s.GNO is null)";
		
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
		String sql = "SELECT count(*) cnt FROM SEMI_FREEBOARD s WHERE (instr(s.TITLE, ?) > 0 or instr(s.CONTENT, ?) > 0) and (s.GNO = 0 OR s.GNO is null)";
		
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
	
	
	public ArrayList<FreeVO> getReplyList(int gno) throws SQLException {
		String sql = "SELECT s.no, s.gno, s.WRITER, to_char(s.regdate, 'yyyy-mm-dd hh24:mi:ss') regdate, s.CONTENT, s.ISVISIBLE isvisible"
				+ " FROM SEMI_FREEBOARD s"
				+ " WHERE s.GNO = ? and s.gno != 0 and s.gno is not null"
					+" ORDER BY s.NO";
		
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, gno);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO free = new FreeVO();
			free.setNo(rs.getInt("no"));
			free.setGno(rs.getInt("gno"));
			free.setWriter(rs.getString("WRITER"));
			free.setRegdate(rs.getString("regdate"));
			free.setContent(rs.getString("CONTENT"));
			free.setIsVisible(rs.getString("isvisible"));
			
			freeList.add(free);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}
	public FreeVO getFreeByNo(int no) throws SQLException {
		this.addCount(no);
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM SEMI_FREEBOARD where no = ?");
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		FreeVO free = new FreeVO();
		while (rs.next()) {
			free.setNo(rs.getInt("no"));
			free.setTitle(rs.getString("title"));
			free.setContent(rs.getString("content"));
			free.setWriter(rs.getString("writer"));
			free.setRegdate(rs.getString("regdate"));
			free.setCount(rs.getInt("count"));
			free.setGno(rs.getInt("gno"));
			free.setFilepath(rs.getString("filepath"));
			free.setFilename(rs.getString("filename"));
		}
			
		rs.close();
		pstmt.close();
		con.close();
		
		return free;
	}
	
	public void addFree(FreeVO free) throws SQLException {
		String INSERT_SQL = "INSERT INTO SEMI_FREEBOARD (NO, TITLE, CONTENT, WRITER, REGDATE, COUNT, GNO, FILENAME, FILEPATH)"
							+" VALUES(freebd_seq.nextval, ?, ?, ?, sysdate, ?, ?, ?, ?)";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, free.getTitle());
		pstmt.setString(2, free.getContent());
		pstmt.setString(3, free.getWriter());
		pstmt.setInt(4, free.getCount());
		pstmt.setInt(5, free.getGno());
		pstmt.setString(6, free.getFilename());
		pstmt.setString(7, free.getFilepath());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void modifyFree(FreeVO free) throws SQLException {
		String INSERT_SQL = "UPDATE SEMI_FREEBOARD SET TITLE = ?, CONTENT = ? WHERE NO = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, free.getTitle());
		pstmt.setString(2, free.getContent());
		pstmt.setInt(3, free.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void addReply(FreeVO free) throws SQLException {
		String INSERT_SQL = "INSERT INTO SEMI_FREEBOARD (NO, TITLE, CONTENT, WRITER, REGDATE, COUNT, GNO)"
							+" VALUES(freebd_seq.nextval, null, ?, ?, sysdate, null, ?)";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, free.getContent());
		pstmt.setString(2, free.getWriter());
		pstmt.setInt(3, free.getGno());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void addCount(int no) throws SQLException {
		String INSERT_SQL = "UPDATE SEMI_FREEBOARD SET COUNT = nvl(COUNT,0)+1 WHERE NO = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void deleteFree(int no) throws SQLException {
		String INSERT_SQL = "DELETE FROM SEMI_FREEBOARD WHERE NO = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 관리자가 자유게시판의 댓글에 "이 글은 블라인드 처리되었습니다." 를 처리하는 sql 
	public void updateReplyByNo(int no, int gno) throws SQLException {
		String sql = "update semi_freeboard set isVisible = 'No' where no = ? and gno = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setInt(2, gno);
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	// 관리자가 관리자용 자유게시판글을 검색하는 sql
	public ArrayList<FreeVO> getFreeByWord(String option, String word) throws SQLException {
		String sql = "select no, title, content, writer, regdate, count, gno, isvisible, filename, filepath "
				+ "from semi_freeboard "
				+ "where "+option+" like '%' || ? || '%' and title is not null "
				+ "order by no desc";
		ArrayList<FreeVO> freeList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, word);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			FreeVO vo = new FreeVO();
			vo.setNo(rs.getInt("no"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWriter(rs.getString("writer"));
			vo.setRegdate(rs.getString("regdate"));
			vo.setCount(rs.getInt("count"));
			vo.setGno(rs.getInt("gno"));
			vo.setIsVisible(rs.getString("isvisible"));
			vo.setFilename(rs.getString("filename"));
			vo.setFilepath(rs.getString("filepath"));
			
			freeList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return freeList;
	}
	
	// 관리자가 검색할 때 10개씩 다시 반환해주는 sql
	
}
