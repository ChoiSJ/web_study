package vo;

import java.sql.Date;

public class noticeVO {
	private int no;
	private String title;
	private String content;
	private int count;
	private int gno;
	private Date regdate;
	private String writer;
	private String imp;
	
	
	public void setImp(String imp) {
		this.imp = imp;
	}
	public String getImp() {
		return imp;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriter() {
		return writer;
	}
	public int getNo() {
		return no;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public int getCount() {
		return count;
	}
	public int getGno() {
		return gno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
