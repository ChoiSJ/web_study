package vo;

import java.sql.Date;

public class ReviewReVO {
	private int reviewNo;
	private int reviewRno;
	private String userId;
	private String userName;
	private String content;
	private Date regdate;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public int getReviewRno() {
		return reviewRno;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getContent() {
		return content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public void setReviewRno(int reviewRno) {
		this.reviewRno = reviewRno;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
