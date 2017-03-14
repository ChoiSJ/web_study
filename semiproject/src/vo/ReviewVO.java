package vo;

import java.sql.Date;

public class ReviewVO {
	private int no;
	private int score;
	private String userId;
	private String userName;
	private String title;
	private String content;
	private String fileName;
	private String programName;
	private Date regdate;
	
	
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getProgramName() {
		return programName;
	}
	public int getNo() {
		return no;
	}
	public int getScore() {
		return score;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getFileName() {
		return fileName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
