package data.dto;

import java.sql.Timestamp;

public class MemberDto {
	private int id;
	private String Member_type;
	private String name;
	private String nickname;
	private String pw;
	private String contact;
	private String addr;
	private String email;
	private Timestamp registration_day;
	private String company;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMember_type() {
		return Member_type;
	}
	public void setMember_type(String member_type) {
		Member_type = member_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegistration_day() {
		return registration_day;
	}
	public void setRegistration_day(Timestamp registration_day) {
		this.registration_day = registration_day;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}

}
