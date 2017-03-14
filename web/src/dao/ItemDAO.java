package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.CartVO;
import vo.ItemVO;

public class ItemDAO {
	
	public void deleteCartItem(int cartNo) throws SQLException {
		String sql = "delete from tb_cart where cart_no = ? ";
				
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cartNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<CartVO> getCartItemsByUser(String userId) throws SQLException {
		String sql = "select A.cart_no, B.item_no, B.item_name, B.item_maker, "
				+ "B.item_price, A.regdate "
				+ "from tb_cart A, tb_item B "
				+ "where A.item_no = B.item_no "
				+ "and A.user_id = ? ";
		ArrayList<CartVO> cartItems = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			CartVO cart = new CartVO();
			cart.setNo(rs.getInt("cart_no"));
			cart.setRegdate(rs.getDate("regdate"));
			
			ItemVO item = new ItemVO();
			item.setNo(rs.getInt("item_no"));
			item.setName(rs.getString("item_name"));
			item.setMaker(rs.getString("item_maker"));
			item.setPrice(rs.getInt("item_price"));
			
			cart.setItem(item);
			cartItems.add(cart);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return cartItems;
	}
	
	public void addCart(int itemNo, String userId) throws SQLException {
		String sql = "insert into tb_cart (cart_no, item_no, user_id, regdate) "
				+ "values (comm_seq.nextval, ?, ?, sysdate) ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, itemNo);
		pstmt.setString(2, userId);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<ItemVO> getAllItems() throws SQLException {
		String sql = "select item_no, item_name, item_maker, item_price, item_pubdate "
				+ "from tb_item "
				+ "order by item_no asc ";
		
		ArrayList<ItemVO> items = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ItemVO item = new ItemVO();
			item.setNo(rs.getInt("item_no"));
			item.setName(rs.getString("item_name"));
			item.setMaker(rs.getString("item_maker"));
			item.setPrice(rs.getInt("item_price"));
			item.setPubdate(rs.getDate("item_pubdate"));
			
			items.add(item);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return items;
	}
}
