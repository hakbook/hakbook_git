package movie.dto;

import java.sql.Date;

public class MovieDTO {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private Date reg_date;
	private int readcount;
	private String ip;
	private String filename;
	private int filesize;
	private String ext;
	private String show;
	
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
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
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	
	@Override
	public String toString() {
		return "MovieDTO [num=" + num + ", writer=" + writer + ", subject=" + subject + ", content=" + content
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ip=" + ip + ", filename=" + filename 
				+ ", filesize=" + filesize + ", ext=" + ext + "]";
	}
}