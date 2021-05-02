package domain;

public class Blog {
	private long no; // 블로그 아이디 (식별자)
	private String title; // 블로그 제목
	private String content; // 블로그 내용
	private String filepath; // 블로그 첨부 이미지
	private String blogger; // 블로그 작성자
	private String reg_date_time; // 블로그 작성일 : 날짜와 시간
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
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
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getBlogger() {
		return blogger;
	}
	public void setBlogger(String blogger) {
		this.blogger = blogger;
	}
	public String getReg_date_time() {
		return reg_date_time;
	}
	public void setReg_date_time(String reg_date_time) {
		this.reg_date_time = reg_date_time;
	}
	@Override
	public String toString() {
		return "Blog [id=" + no + ", title=" + title + ", content=" + content + ", filepath=" + filepath + ", blogger="
				+ blogger + ", regDateTime=" + reg_date_time + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (no ^ (no >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Blog other = (Blog) obj;
		if (no != other.no)
			return false;
		return true;
	}	
}
