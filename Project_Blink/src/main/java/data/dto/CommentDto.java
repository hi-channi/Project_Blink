package data.dto;

import java.sql.Timestamp;

public class CommentDto {

	private String cnum;
	private String id;
	private String bnum;
	private String content;
	private Timestamp write_day;
	
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBnum() {
		return bnum;
	}
	public void setBnum(String bnum) {
		this.bnum = bnum;
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
