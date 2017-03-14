package demo1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

public class BookDAO {
	
	static final String INSERT_SQL = "insert into tb_book "
			+ "(no, title, author, publisher, price, pubdate) "
			+ "values (book_seq.nextval, ?, ?, ?, ?, to_date(?, 'yyyy-mm-dd')) ";
	
	static final String SELECT_SQL = "select * from tb_book where publisher = ? ";
	
	public void addBook(String title, String author, String publisher,
			int price, String pubdate) throws SQLException {
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, publisher);
		pstmt.setInt(4, price);
		pstmt.setString(5, pubdate);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<BookVO> searchBooks(String publisher) throws SQLException {
		ArrayList<BookVO> bookList = new ArrayList<BookVO>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(SELECT_SQL);
		pstmt.setString(1, publisher);
		ResultSet rs = pstmt.executeQuery();
		
		
		while (rs.next()) {
			BookVO vo = new BookVO();
			vo.setNo(rs.getInt("no"));
			vo.setTitle(rs.getString("title"));
			vo.setAuthor(rs.getString("author"));
			vo.setPublisher(rs.getString("publisher"));
			vo.setPrice(rs.getInt("price"));
			vo.setPubdate(rs.getDate("pubdate"));
			
			bookList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return bookList;
	}
}
