package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ProgramApplyVO;

public class ProgramApplyDAO {

	
	public void addApplyProgram(ProgramApplyVO apply) throws SQLException {
		
		String sql = "insert into semi_program_apply( "
				+ " apply_no, user_id, program_no, user_story, "
				+ "	count_ticket, apply_tel)"
				+ " values(apply_seq.nextval,?,?,?,?,?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, apply.getUserId());
		pstmt.setInt(2, apply.getProgramNo());
		pstmt.setString(3, apply.getUserStory());
		pstmt.setInt(4, apply.getCountTicket());
		pstmt.setString(5, apply.getApplyTel());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<ProgramApplyVO> getAllApplyListById(String userId) throws SQLException {
		String sql = "select apply_no, user_id, program_no, apply_date, result,"
				+ " user_story, count_ticket, apply_tel "
				+ " from semi_program_apply "
				+ " where user_id = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProgramApplyVO> applyList = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		while (rs.next()) {
			ProgramApplyVO apply = new ProgramApplyVO();
			apply.setApplyNo(rs.getInt("apply_no"));
			apply.setUserId(rs.getString("user_id"));
			apply.setProgramNo(rs.getInt("program_no"));
			apply.setApplyDate(dateFormat.format(rs.getDate("apply_date")));
			apply.setResult(rs.getString("result"));
			apply.setUserStory(rs.getString("user_story"));
			apply.setCountTicket(rs.getInt("count_ticket"));
			apply.setApplyTel(rs.getString("apply_tel"));
			
			applyList.add(apply);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return applyList;
	}
	
	// 신청취소하는 sql
	public void removeApply(int applyNo) throws SQLException {
		String sql = "delete from semi_program_apply "
				+ " where apply_no = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, applyNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 방청신청한 회원정보 불러오기
	public ArrayList<ProgramApplyVO> getUserListByProNo(int proNo) throws SQLException {
		String sql = "select apply_no, user_id, program_no, apply_date, result, user_story, count_ticket, apply_tel"
				+ " from semi_program_apply"
				+ " where program_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, proNo);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProgramApplyVO> userList = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		while (rs.next()) {
			ProgramApplyVO apply = new ProgramApplyVO();
			apply.setApplyNo(rs.getInt("apply_no"));
			apply.setUserId(rs.getString("user_id"));
			apply.setProgramNo(rs.getInt("program_no"));
			apply.setApplyDate(dateFormat.format(rs.getDate("apply_date")));
			apply.setResult(rs.getString("result"));
			apply.setUserStory(rs.getString("user_story"));
			apply.setCountTicket(rs.getInt("count_ticket"));
			apply.setApplyTel(rs.getString("apply_tel"));
			
			userList.add(apply);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return userList;
	}
	
	// 당첨
	public void successPro(int applyNo) throws SQLException {
		String sql = "update semi_program_apply"
				+ " set result = '당첨'"
				+ " where apply_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, applyNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 탈락
	public void failPro(int applyNo) throws SQLException {
		String sql = "update semi_program_apply"
				+ " set result = '다음기회에'"
				+ " where apply_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, applyNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public int countTicket(int applyNo) throws SQLException {
		int countTicket = 0;
		String sql = "select count_ticket"
				+ " from semi_program_apply"
				+ " where apply_no = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, applyNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			countTicket = rs.getInt("count_ticket");
		}
		
		rs.close();
		pstmt.close();
		con.close();

		return countTicket;
	}
	
	public String getResult(int applyNo) throws SQLException {
		String result = "";
		String sql = "select result"
				+ " from semi_program_apply"
				+ " where apply_no = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, applyNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			result = rs.getString("result");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return result;
	}
}