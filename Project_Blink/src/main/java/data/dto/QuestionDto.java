package data.dto;

import java.sql.Timestamp;

public class QuestionDto {

	private String qnum;
	private String id;
	private String subject;
	private String content;
	private Timestamp write_day;
	
	public String getQnum() {
		return qnum;
	}
	public void setQnum(String qnum) {
		this.qnum = qnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Timestamp getWrite_day() {
		return write_day;
	}
	public void setWrite_day(Timestamp write_day) {
		this.write_day = write_day;
	}
	

	
}