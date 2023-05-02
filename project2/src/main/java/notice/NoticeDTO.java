package notice;

import java.sql.Date;

public class NoticeDTO {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private Date write_date;
	private int readcount;
	private String ip;
	private String filename;
	private int filesize;
	
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
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
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
		return "NoticeDTO [num=" + num + ", writer=" + writer + ", subject=" + subject + ", content=" + content
				+ ", write_date=" + write_date + ", readcount=" + readcount + ", ip=" + ip + ", filename=" + filename
				+ ", filesize=" + filesize + "]";
	}
	public NoticeDTO() {
		
	}
	public NoticeDTO(int num, String writer, String subject, String content, Date write_date, int readcount, String ip,
			String filename, int filesize) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.write_date = write_date;
		this.readcount = readcount;
		this.ip = ip;
		this.filename = filename;
		this.filesize = filesize;
	}
}
