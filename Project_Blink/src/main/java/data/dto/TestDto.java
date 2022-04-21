package data.dto;

import java.sql.Timestamp;

public class TestDto {
	private String num;
	private String name;
	private String gitname;
	private Timestamp startday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGitname() {
		return gitname;
	}
	public void setGitname(String gitname) {
		this.gitname = gitname;
	}
	public Timestamp getStartday() {
		return startday;
	}
	public void setStartday(Timestamp startday) {
		this.startday = startday;
	}	
}
