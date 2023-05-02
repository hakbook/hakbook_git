package movie.dto;

import java.sql.Date;

public class MovieScoreDTO {
	private int score_num;
	private int movie_num;
	private String writer;
	private String content;
	private int score;
	private double avg;
	private Date score_date;
	
	public int getScore_num() {
		return score_num;
	}
	public void setScore_num(int score_num) {
		this.score_num = score_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getScore_date() {
		return score_date;
	}
	public void setScore_date(Date score_date) {
		this.score_date = score_date;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	@Override
	public String toString() {
		return "MovieScoreDTO [score_num=" + score_num + ", movie_num=" + movie_num + ", writer=" + writer
				+ ", content=" + content + ", score=" + score + ", avg=" + avg + ", score_date="
				+ score_date + "]";
	}
}
