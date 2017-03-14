package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.PageVO;
import vo.ReviewReVO;
import vo.ReviewVO;

public class ReviewDAO {
	public PageVO prevNextPage(int cno) throws SQLException{
		PageVO pvo = new PageVO();
		String sql = "select *"
				+ "	from (select no,"
				+ " LAG(no,1,0) over(order by no desc) as next,"
				+ " LEAD(no,1,0) over(order by no desc) as prev,"
				+ " row_number() over (order by no desc) as rno"
				+ " from SEMI_REVIEW)"
				+ " where no = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cno);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			pvo.setNext(rs.getInt("next"));
			pvo.setPrev(rs.getInt("prev"));
			pvo.setNowNo(rs.getInt("rno"));
		}
		
		rs.close();
		pstmt.close();
		con.close();		
		return pvo;
	}
	
	public ArrayList<ReviewVO> searchReview(ReviewVO rvo, int begin, int end) throws SQLException {
		ArrayList<ReviewVO> reviewList = new ArrayList<>();
		String sql = "select no, title, content, regdate, userid, program, username, score"
				+" from ("
				+" select row_number() over (order by no desc) rn,"
				+" no, title, content, regdate, userid, program, username, score"
				+" from semi_review"
				+" where "+rvo.getTitle()+" like '%'||?||'%')"
				+" where rn>=? and rn <=?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, rvo.getContent());
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			ReviewVO rlist = new ReviewVO();
			rlist.setNo(rs.getInt("no"));
			rlist.setTitle(rs.getString("title"));
			rlist.setContent(rs.getString("content"));
			rlist.setUserId(rs.getString("userid"));
			rlist.setProgramName(rs.getString("program"));
			rlist.setUserName(rs.getString("username"));
			rlist.setScore(rs.getInt("score"));
			rlist.setRegdate(rs.getDate("regdate"));
			reviewList.add(rlist);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewList;
	}
	
	public ArrayList<ReviewVO> searchReviewWriter(ReviewVO rvo, int begin, int end) throws SQLException {
		ArrayList<ReviewVO> reviewList = new ArrayList<>();
		String sql = "select no, title, content, regdate, userid, program, username, score"
				+" from ("
				+" select row_number() over (order by no desc) rn,"
				+" no, title, content, regdate, userid, program, username, score"
				+" from semi_review"
				+" where "+rvo.getTitle()+" = ?)"
				+" rn>=? and rn <=?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, rvo.getContent());
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			ReviewVO rlist = new ReviewVO();
			rlist.setNo(rs.getInt("no"));
			rlist.setTitle(rs.getString("title"));
			rlist.setContent(rs.getString("content"));
			rlist.setUserId(rs.getString("userid"));
			rlist.setProgramName(rs.getString("program"));
			rlist.setUserName(rs.getString("username"));
			rlist.setScore(rs.getInt("score"));
			rlist.setRegdate(rs.getDate("regdate"));
			reviewList.add(rlist);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewList;
	}
	
	public int getSearchTotalRows(String title, String content)throws SQLException{
		String sql = "select count(*) cnt from semi_review"
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
	
	public int getSearchTotalRowsWriter(String title, String content)throws SQLException{
		String sql = "select count(*) cnt from semi_review"
				+ " where "+title+" = ?";
	
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
	
	public void reviewEdit(ReviewVO rvo) throws SQLException{
		String sql = "update semi_review"
				+ "	set title = ?,"
				+ "	content = ?,"
				+ " program = ?,"
				+ "	filename = ?,"
				+ "	score = ?"
				+ " where no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt  = con.prepareStatement(sql);
		pstmt.setString(1, rvo.getTitle());
		pstmt.setString(2, rvo.getContent());
		pstmt.setString(3, rvo.getProgramName());
		pstmt.setString(4, rvo.getFileName());
		pstmt.setInt(5, rvo.getScore());
		pstmt.setInt(6, rvo.getNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public int getReviewReplyCount(int no) throws SQLException{
		String sql = "select count(*) cnt from semi_review_reply where no=?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		int reviewReCount = 0;
		
		while(rs.next()){
			reviewReCount = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewReCount;
	}
	
	public ArrayList<ReviewReVO> getReviewReList(int no) throws SQLException {
		String sql = "select no, user_id, user_name, content, regdate, rno"
				+" from semi_review_reply"
				+" where no =?"
				+" order by regdate";
		ArrayList<ReviewReVO> reviewReList = new  ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			ReviewReVO revo = new ReviewReVO();
			revo.setReviewNo(rs.getInt("no"));
			revo.setContent(rs.getString("content"));
			revo.setUserId(rs.getString("user_id"));
			revo.setUserName(rs.getString("user_name"));
			revo.setRegdate(rs.getDate("regdate"));
			revo.setReviewRno(rs.getInt("rno"));
			reviewReList.add(revo);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewReList;
	}
	
	public void addReply(ReviewReVO review) throws SQLException{
		String sql ="insert into semi_review_reply(no, user_id, user_name, content, rno)"
					+" values(?,?,?,?,reviewbd_re_seq.nextval)";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review.getReviewNo());
		pstmt.setString(2, review.getUserId());
		pstmt.setString(3, review.getUserName());
		pstmt.setString(4, review.getContent());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public ReviewVO getReviewByNo(int no) throws SQLException{
		String sql ="select no, title, content, userid, username, program, score, filename, regdate"
					+" from semi_review"
					+" where no=?";
		ReviewVO rvo = null;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			rvo = new ReviewVO();
			rvo.setNo(rs.getInt("no"));
			rvo.setTitle(rs.getString("title"));
			rvo.setContent(rs.getString("content"));
			rvo.setUserId(rs.getString("userid"));
			rvo.setUserName(rs.getString("username"));
			rvo.setScore(rs.getInt("score"));
			rvo.setProgramName(rs.getString("program"));
			rvo.setRegdate(rs.getDate("regdate"));
			rvo.setFileName(rs.getString("filename"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return rvo;
	}
	public int getTotalRows()throws SQLException{
		String sql = "select count(*) cnt from semi_review";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int totalRows = 0;
		
		if(rs.next()){
			
			totalRows = rs.getInt("cnt");
			
		}
		
		return totalRows;
	}
	
	public int getSeq() throws SQLException{
		/*페이지네이션 관련*/
		String sql="select review_seq.nextval seq from dual";
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
	
	public void addReview(ReviewVO rvo)throws SQLException{
		String sql = "insert into semi_review(no, title, content, program, userid, username, score, filename)"
					+" values(reviewbd_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, rvo.getTitle());
		pstmt.setString(2, rvo.getContent());
		pstmt.setString(3, rvo.getProgramName());
		pstmt.setString(4, rvo.getUserId());
		pstmt.setString(5, rvo.getUserName());
		pstmt.setInt(6, rvo.getScore());
		pstmt.setString(7, rvo.getFileName());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public ArrayList<ReviewVO> reviewList() throws SQLException{
		String sql = "select no, title, content, userid, username, program, score, filename, regdate"
					+" from semi_review";
		ArrayList<ReviewVO> rvolist = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			ReviewVO rvo = new ReviewVO();
			rvo.setNo(rs.getInt("no"));
			rvo.setTitle(rs.getString("title"));
			rvo.setContent(rs.getString("content"));
			rvo.setUserId(rs.getString("userid"));
			rvo.setUserName(rs.getString("username"));
			rvo.setScore(rs.getInt("score"));
			rvo.setProgramName(rs.getString("program"));
			rvo.setRegdate(rs.getDate("regdate"));
			rvo.setFileName("filename");
			rvolist.add(rvo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return rvolist;
	}
	
	// 관리자용 리뷰게시판 프로그램 리스트용 sql
	public ArrayList<ReviewVO> getReviewProgramList() throws SQLException {
		String sql = "select distinct program from semi_review ";
		ArrayList<ReviewVO> programList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ReviewVO vo = new ReviewVO();
			vo.setProgramName(rs.getString("program"));
			
			programList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return programList;
	}
	
	// 관리자용 리뷰게시판 프로그램 리뷰용 sql
	public ArrayList<ReviewVO> getReviewList(String programName, String artistName) throws SQLException {
		String sql = "select no, filename, title, content, regdate, count, score, username, userid, program "
				+ "from semi_review "
				+ "where program like '%' || ? || '%' and program like '%' || ? || '%' "
				+ "order by regdate desc ";
		ArrayList<ReviewVO> reviewList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, programName);
		pstmt.setString(2, artistName);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ReviewVO vo = new ReviewVO();
			vo.setNo(rs.getInt("no"));
			vo.setFileName(rs.getString("filename"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setRegdate(rs.getDate("regdate"));
			vo.setScore(rs.getInt("score"));
			vo.setUserName(rs.getString("username"));
			vo.setUserId(rs.getString("userid"));
			vo.setProgramName(rs.getString("program"));
			
			reviewList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewList;
	}
	
	public ArrayList<ReviewVO> getReviewListPaging(int begin, int end)throws Exception{
		String sql = "select no, title, content, userid, username, program, score, filename, regdate"
					+" from("
					+" select row_number() over (order by no desc) rn,"
					+" no, title, content, userid, username, program, score, filename, regdate"
					+" from semi_review)"
					+" where rn>=? and rn <=?";
		ArrayList<ReviewVO> pagelist = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			ReviewVO rvo = new ReviewVO();
			rvo.setNo(rs.getInt("no"));
			rvo.setTitle(rs.getString("title"));
			rvo.setContent(rs.getString("content"));
			rvo.setUserId(rs.getString("userid"));
			rvo.setUserName(rs.getString("username"));
			rvo.setScore(rs.getInt("score"));
			rvo.setProgramName(rs.getString("program"));
			rvo.setRegdate(rs.getDate("regdate"));
			rvo.setFileName("filename");
			pagelist.add(rvo);		
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return pagelist;
	}
	
	public void delReviewReply(int rno)throws SQLException{
		/*리뷰게시판 댓글삭제*/
		String sql = "delete from semi_review_reply "
				+ "where rno = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, rno);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}
	
	public void delReview1(int no)throws SQLException{
		/*리뷰게시판 글삭제*/
		String sql = "delete from semi_review"
				+ " where no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		 /* 
		  * 댓글까지 지워짐
		  *	delReview2(no);
		  */
		
		pstmt.close();
		con.close();
	}
	
	public void delReview2(int no)throws SQLException{
		/*리뷰게시판 댓글삭제*/
		String sql = "delete from semi_review_reply "
				+ "where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();	
	}
}
