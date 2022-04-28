package data.dto;

import java.sql.Timestamp;

public class CommunityDto {

	private String bnum;
	private String id;
	private String subject;
	private String content;
	private int read_cnt;
	private int like_cnt;
	private Timestamp write_day;
	
	public String getBnum() {
		return bnum;
	}
	public void setBnum(String bnum) {
		this.bnum = bnum;
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
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public Timestamp getWrite_day() {
		return write_day;
	}
	public void setWrite_day(Timestamp write_day) {
		this.write_day = write_day;
	}
	
	
	
	
	
}
