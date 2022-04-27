package data.dto;

import java.sql.Timestamp;

public class ScrapDto {
	
	private String snum;
	private String connum;
	private String id;
	private Timestamp add_day;
	
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getConnum() {
		return connum;
	}
	public void setConnum(String connum) {
		this.connum = connum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getAdd_day() {
		return add_day;
	}
	public void setAdd_day(Timestamp add_day) {
		this.add_day = add_day;
	}
	
}
