package vo;

import java.sql.Date;

public class noticeReVO {
	private int no;
	private String content;
	private int rno;
	private String userId;
	private String userName;
	private Date regdate;
	
	public int getNo() {
		return no;
	}
	public String getContent() {
		return content;
	}
	public int getRno() {
		return rno;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
