package test.todo.dto;

import java.util.Date;

public class TodoDto {
	private int num;
	private String work;
	private Date regdate;
	
	public TodoDto() {}

	public TodoDto(int num, String work, Date regdate) {
		super();
		this.num = num;
		this.work = work;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
