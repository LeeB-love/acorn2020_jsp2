package test.dto;

import java.util.Date;

public class QnaDto {
	private int num;
	private String name;
	private String contents;
	private Date regdate;
	
	public QnaDto(){}

	public QnaDto(int num, String name, String contents, Date regdate) {
		super();
		this.num = num;
		this.name = name;
		this.contents = contents;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
