package review;

import java.sql.Date;

public class ReviewDTO {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private Date review_date;
	private int readcount;
	private String ip;
	private String filename;
	private int filesize;
	//getter,setter,toString,생성자 2개
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "ReviewDTO [num=" + num + ", writer=" + writer + ", subject=" + subject + ", content=" + content
				+ ", review_date=" + review_date + ", readcount=" + readcount + ", ip=" + ip + ", filename=" + filename
				+ ", filesize=" + filesize + "]";
	}
	public ReviewDTO() {
	}
	public ReviewDTO(int num, String writer, String subject, String content, Date review_date, int readcount, String ip,
			String filename, int filesize) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.review_date = review_date;
		this.readcount = readcount;
		this.ip = ip;
		this.filename = filename;
		this.filesize = filesize;
	}
}
