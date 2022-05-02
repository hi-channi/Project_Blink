package data.dto;

public class ContestDto {

	private String connum;
	private String category;
	private String subject; 
	private String content;
	private String image;
	private String id;
	private int scrap_cnt;
	private int read_cnt;
	private String nickname;
	private String start_day;
	private String finally_day; 
	private int Ddays;
	
	public int getDdays() {
		return Ddays;
	}
	public void setDdays(int ddays) {
		Ddays = ddays;
	}
	public String getConnum() {
		return connum;
	}
	public void setConnum(String connum) {
		this.connum = connum;
	}
	public String getCategory() {
		return category;
	}
	
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getFinally_day() {
		return finally_day;
	}
	public void setFinally_day(String finally_day) {
		this.finally_day = finally_day;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getImage() { 
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getScrap_cnt() {
		return scrap_cnt;
	}
	public void setScrap_cnt(int scrap_cnt) {
		this.scrap_cnt = scrap_cnt;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
}