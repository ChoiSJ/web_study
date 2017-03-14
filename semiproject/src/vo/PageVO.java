package vo;

public class PageVO {
	private int prev;
	private int next;
	private int nowNo;
	
	public void setNowNo(int nowNo) {
		this.nowNo = nowNo;
	}
	public int getNowNo() {
		return nowNo;
	}
	public int getPrev() {
		return prev;
	}
	public int getNext() {
		return next;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public void setNext(int next) {
		this.next = next;
	}	
}
