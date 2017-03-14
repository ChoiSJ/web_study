package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.noticeReVO;
import vo.noticeVO;

public class noticeDAO {
	
	public ArrayList<noticeVO> searchNotice(noticeVO nvo, int begin, int end) throws SQLException {
		ArrayList<noticeVO> noticeList = new ArrayList<>();
		String sql = "select no, title, content, regdate, gno, count, imp"
				+ "	from ("
				+" select row_number() over (order by no desc) rn,"
				+" no, title, content, regdate, gno, count, imp"
				+" from semi_notice)"
				+ "	where "+nvo.getTitle()+" like '%'||?||'%' and rn>=? and rn <=?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, nvo.getContent());
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			noticeVO nlist = new noticeVO();
			nlist.setNo(rs.getInt("no"));
			nlist.setTitle(rs.getString("title"));
			nlist.setContent(rs.getString("content"));
			nlist.setRegdate(rs.getDate("regdate"));
			nlist.setCount(rs.getInt("count"));
			nlist.setImp(rs.getString("imp"));
			noticeList.add(nlist);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return noticeList;
	}
	public int noticeReCount(int no)throws SQLException{
		/*공지사항 공지글 댓글 현황 조사(댓글 갯수)*/
		String sql = "select count(*) cnt from SEMI_NOTICE_REPLY where no=?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		int noticeCount = 0;
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			noticeCount = rs.getInt("cnt");
		}
		rs.close();
		pstmt.close();
		con.close();
		return noticeCount;
	}
	public void delnoticeReply(int rno)throws SQLException{
		/*공지사항 댓글삭제*/
		String sql = "delete from semi_notice_reply "
				+ "where rno = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, rno);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}
	public void addcount(int no)throws SQLException{
		/*조회수 증가*/
		String sql = "update semi_notice set count = count+1 where no=?";
		Connection con= ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	public int getSeq() throws SQLException{
		/*페이지네이션 관련*/
		String sql="select notice_seq.nextval seq from dual";
		int no = 0;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		no = rs.getInt("seq");
		
		rs.close();
		pstmt.close();
		con.close();
		return no;
	}
	public noticeVO getBlogByNo(int no)throws SQLException{
		/*게시판 번호에 해당되는 정보 반환*/
		String sql = "select no, title, content, regdate, gno, count, writer"
				+" from semi_notice"
				+" where no =?";
		noticeVO notice = null;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
	
		while(rs.next()){
			notice = new noticeVO();
			notice.setNo(rs.getInt("no"));
			notice.setTitle(rs.getString("title"));
			notice.setContent(rs.getString("content"));
			notice.setRegdate(rs.getDate("regdate"));
			notice.setGno(rs.getInt("gno"));
			notice.setCount(rs.getInt("count"));
			notice.setWriter(rs.getString("writer"));
		}
	
		rs.close();
		pstmt.close();
		con.close();
		return notice;
	}
	public void addBlog(noticeVO notice)throws SQLException{
		/*공지사항 글 추가*/
		String sql = "insert into semi_notice(no, title, content, gno, writer, imp, count)"
					+" values(?,?,?,?,?,?,0)";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, notice.getNo());
		pstmt.setString(2, notice.getTitle());
		pstmt.setString(3, notice.getContent());
		pstmt.setInt(4, notice.getGno());
		pstmt.setString(5, notice.getWriter());
		pstmt.setString(6, notice.getImp());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public ArrayList<noticeVO> getnoticelist() throws SQLException{
		String sql = "select no, title, content, regdate, gno, count, imp"
					+" from semi_notice"
					+" where imp = 'y'"
					+" order by gno desc, no asc";
		ArrayList<noticeVO>noticelist = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			noticeVO vo = new noticeVO();
			vo.setNo(rs.getInt("no"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setRegdate(rs.getDate("regdate"));
			vo.setGno(rs.getInt("gno"));
			vo.setCount(rs.getInt("count"));
			noticelist.add(vo);	
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return noticelist;
	}
	
	public ArrayList<noticeVO> getnoticelistForMain() throws SQLException{
		String sql = "select no, title, content, regdate, gno, count, imp"
				+" from semi_notice"
				+" order by gno desc, no asc";
		ArrayList<noticeVO>noticelist = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			noticeVO vo = new noticeVO();
			vo.setNo(rs.getInt("no"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setRegdate(rs.getDate("regdate"));
			vo.setGno(rs.getInt("gno"));
			vo.setCount(rs.getInt("count"));
			noticelist.add(vo);	
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return noticelist;
	}
	
	public int getTotalRows()throws SQLException{
		String sql = "select count(*) cnt from semi_notice";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int totalRows = 0;
		
		if(rs.next()){
			
			totalRows = rs.getInt("cnt");
			
		}
		rs.close();
		pstmt.close();
		con.close();
		return totalRows;
	}
	
	public int getImpTotalRows()throws SQLException{
		String sql = "select count(*) cnt from semi_notice"
				+ "	where imp='y'";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int totalRows = 0;
		
		if(rs.next()){
			
			totalRows = rs.getInt("cnt");
			
		}
		rs.close();
		pstmt.close();
		con.close();
		return totalRows;
	}
	public int getSearchTotalRows(String title, String content)throws SQLException{
		String sql = "select count(*) cnt from semi_notice"
				+ " where "+title+" like '%'||?||'%'";
	
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, content);
		ResultSet rs = pstmt.executeQuery();
		int totalRows = 0;
		
		if(rs.next()){
			
			totalRows = rs.getInt("cnt");
			
		}
		rs.close();
		pstmt.close();
		con.close();
		return totalRows;
	}
	public ArrayList<noticeVO> getnoticeListPaging(int begin, int end)throws Exception{
		String sql = "select no, title, content, regdate, gno, count"
					+" from("
					+" select row_number() over (order by no desc) rn,"
					+" no, title, content, regdate, gno, count"
					+" from semi_notice)"
					+" where rn>=? and rn <=?";
		ArrayList<noticeVO> pagelist = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			noticeVO nvo = new noticeVO();
			nvo.setNo(rs.getInt("no"));
			nvo.setTitle(rs.getString("title"));
			nvo.setContent(rs.getString("content"));
			nvo.setRegdate(rs.getDate("regdate"));
			nvo.setGno(rs.getInt("gno"));
			nvo.setCount(rs.getInt("count"));
			pagelist.add(nvo);		
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return pagelist;
	}
	
	 public void addReply(noticeReVO revo) throws SQLException{
		String sql = "insert into semi_notice_reply(no, user_id, user_name, content, rno)"
				+" values(?,?,?,?,notice_re_seq.nextval)";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, revo.getNo());
		pstmt.setString(2, revo.getUserId());
		pstmt.setString(3, revo.getUserName());
		pstmt.setString(4, revo.getContent());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	 
	// 관리자가 공지 게시판의 글을 삭제하는 sql
	public void deleteNotice(int no) throws SQLException {
		String sql = "delete from semi_notice "
				+ "where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 관리자가 공지글을 업데이트 하는 sql
	public void modifyNotice(String title, String content, int no) throws SQLException {
		String sql = "update semi_notice "
				+ "set title = ?, content = ?, regdate = sysdate "
				+ "where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<noticeReVO> getNoticeReList(int no) throws SQLException{
		String sql = "select no, user_id, user_name, content, regdate, rno"
				+" from semi_notice_reply"
				+" where no =?";
		ArrayList<noticeReVO> noticeReList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			noticeReVO revo = new noticeReVO();
			revo.setNo(rs.getInt("no"));
			revo.setContent(rs.getString("content"));
			revo.setUserId(rs.getString("user_id"));
			revo.setUserName(rs.getString("user_name"));
			revo.setRegdate(rs.getDate("regdate"));
			revo.setRno(rs.getInt("rno"));
			noticeReList.add(revo);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return noticeReList;
	}
}
