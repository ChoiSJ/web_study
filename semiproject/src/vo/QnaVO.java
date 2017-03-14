package vo;

/*
 *    NO         NUMBER,
   TITLE      VARCHAR2 (100),
   CONTENT    VARCHAR2 (1000),
   WRITER     VARCHAR2 (100),
   REGDATE    DATE,
   COUNT      NUMBER,
   ISANSWER   NUMBER (10, 2) DEFAULT 0
 */

public class QnaVO {
	private int no;
	String title, content, writer, regdate;
	private int count, isAnswer;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
	}

	
}
