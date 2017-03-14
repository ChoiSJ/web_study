package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ProgramVO;

public class ProgramDAO {

	public void updateProgram(ProgramVO program) throws SQLException {
		String sql = "update semi_program "
				+ "set program_name = ?, artist_name = ?, program_date = ?, crowd_number = ?, "
				+ "program_description = ?, photo_file = ?, announce_date = ?, is_visible = ? "
				+ "where program_no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, program.getProgramName());
		pstmt.setString(2, program.getArtistName());
		pstmt.setString(3, program.getProgramDate());
		pstmt.setInt(4, program.getCrowdnumber());
		pstmt.setString(5, program.getProgramDescription());
		pstmt.setString(6, program.getPhotofile());
		pstmt.setString(7, program.getAnnounceDate());
		pstmt.setString(8, program.getIsVisible());
		pstmt.setInt(9, program.getProgramNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void addProgram(ProgramVO program) throws SQLException {
		String sql = "insert into semi_program (program_no, program_name,"
				+ " artist_name, program_date, crowd_number, program_description,"
				+ " photo_file, announce_date)"
				+ "	values(program_seq.nextval,?,?,to_date(?),?,?,?,to_date(?))";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, program.getProgramName());
		pstmt.setString(2, program.getArtistName());
		pstmt.setString(3, program.getProgramDate());
		pstmt.setInt(4, program.getCrowdnumber());
		pstmt.setString(5, program.getProgramDescription());
		pstmt.setString(6, program.getPhotofile());
		pstmt.setString(7, program.getAnnounceDate());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<ProgramVO> getAllProgramList() throws SQLException {
		String sql = "select program_no, program_name, artist_name, program_date,"
				+ " crowd_number, program_description, photo_file, announce_date, is_visible "
				+ " from semi_program "
				+ " where is_visible = 'Yes'"
				+ " order by program_date asc";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProgramVO> programList = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		while(rs.next()){
			ProgramVO program = new ProgramVO();
			program.setProgramNo(rs.getInt("program_no"));
			program.setProgramName(rs.getString("program_name"));
			program.setArtistName(rs.getString("artist_name"));
			program.setProgramDate(dateFormat.format(rs.getDate("program_date")));
			program.setCrowdnumber(rs.getInt("crowd_number"));
			program.setProgramDescription(rs.getString("program_description"));
			program.setPhotofile(rs.getString("photo_file"));
			program.setAnnounceDate(dateFormat.format(rs.getDate("announce_date")));
			program.setIsVisible(rs.getString("is_visible"));
			
			programList.add(program);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return programList;
	}
	public ArrayList<ProgramVO> getAllProgramListForMain() throws SQLException {
		String sql = "select program_no, program_name, artist_name, program_date,"
				+ " crowd_number, program_description, photo_file, announce_date, is_visible, main_photo_file "
				+ " from semi_program "
				+ " where is_visible = 'Yes'"
				+ " and main_photo_file is not null"
				+ " order by program_date asc";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProgramVO> programList = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		while(rs.next()){
			ProgramVO program = new ProgramVO();
			program.setProgramNo(rs.getInt("program_no"));
			program.setProgramName(rs.getString("program_name"));
			program.setArtistName(rs.getString("artist_name"));
			program.setProgramDate(dateFormat.format(rs.getDate("program_date")));
			program.setCrowdnumber(rs.getInt("crowd_number"));
			program.setProgramDescription(rs.getString("program_description"));
			program.setPhotofile(rs.getString("photo_file"));
			program.setAnnounceDate(dateFormat.format(rs.getDate("announce_date")));
			program.setIsVisible(rs.getString("is_visible"));
			program.setMainphotoFile(rs.getString("main_photo_file"));
			
			programList.add(program);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return programList;
	}
	public ArrayList<ProgramVO> getAllProgramListForAdmin() throws SQLException {
		String sql = "select program_no, program_name, artist_name, program_date,"
				+ " crowd_number, program_description, photo_file, announce_date, is_visible "
				+ " from semi_program "
				+ " order by program_date asc";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProgramVO> programList = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		while(rs.next()){
			ProgramVO program = new ProgramVO();
			program.setProgramNo(rs.getInt("program_no"));
			program.setProgramName(rs.getString("program_name"));
			program.setArtistName(rs.getString("artist_name"));
			program.setProgramDate(dateFormat.format(rs.getDate("program_date")));
			program.setCrowdnumber(rs.getInt("crowd_number"));
			program.setProgramDescription(rs.getString("program_description"));
			program.setPhotofile(rs.getString("photo_file"));
			program.setAnnounceDate(dateFormat.format(rs.getDate("announce_date")));
			program.setIsVisible(rs.getString("is_visible"));
			
			programList.add(program);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return programList;
	}
	
	public ProgramVO getProgramByNo(int programNo) throws SQLException {
		
		String sql = "select program_no, program_name, artist_name, program_date,"
				+ " crowd_number, program_description, photo_file, announce_date, is_visible "
				+ " from semi_program "
				+ " where program_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, programNo);
		
		ResultSet rs = pstmt.executeQuery();
		ProgramVO program = null;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		while(rs.next()){
			program = new ProgramVO();
			program.setProgramNo(rs.getInt("program_no"));
			program.setProgramName(rs.getString("program_name"));
			program.setArtistName(rs.getString("artist_name"));
			program.setProgramDate(dateFormat.format(rs.getDate("program_date")));
			program.setCrowdnumber(rs.getInt("crowd_number"));
			program.setProgramDescription(rs.getString("program_description"));
			program.setPhotofile(rs.getString("photo_file"));
			program.setAnnounceDate(dateFormat.format(rs.getDate("announce_date")));
			program.setIsVisible(rs.getString("is_visible"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return program;
	}
	
	// 공연 삭제 하는 sql
	public void deleteProgram(int no) throws SQLException {
		String sql = "delete from semi_program "
				+ "where program_no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	// 공연 정원 수 구하기
	public int getCrowdNumber(int programNo) throws SQLException {
		int crowdNo= 0;
		String sql ="select crowd_number "
				+ " from semi_program "
				+ " where program_no = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, programNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			crowdNo = rs.getInt("crowd_number");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return crowdNo;
	}
	
	public void crowdNoUpdate(ProgramVO program) throws SQLException {
		String sql = "update semi_program"
				+ " set crowd_number = ? "
				+ " where program_no = ? ";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, program.getCrowdnumber());
		pstmt.setInt(2, program.getProgramNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
