package vo;

import java.util.Date;

public class CartVO {
	
	private int no;
	private Date regdate;
	private ItemVO item;
	private UserVO user;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public ItemVO getItem() {
		return item;
	}
	public void setItem(ItemVO item) {
		this.item = item;
	}
	public UserVO getUser() {
		return user;
	}
	public void setUser(UserVO user) {
		this.user = user;
	}
}
