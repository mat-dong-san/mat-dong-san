package com.dong.san.board.model.vo;

import java.sql.Date;

public class Board {
	private int bId;
	private String bTitle;
	private String bContent;
	private String bType;
	private Date bRegD;
	private String bDelYN;
	private String usId;
	
	public Board() {}
	
	public Board(String bTitle, String bContent) {
		this.bTitle = bTitle;
		this.bContent = bContent;
	}

	public Board(int bId, String bTitle, String bContent, String bType, Date bRegD, String bDelYN, String usId) {
		this.bId = bId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bType = bType;
		this.bRegD = bRegD;
		this.bDelYN = bDelYN;
		this.usId = usId;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public Date getbRegD() {
		return bRegD;
	}

	public void setbRegD(Date bRegD) {
		this.bRegD = bRegD;
	}

	public String getbDelYN() {
		return bDelYN;
	}

	public void setbDelYN(String bDelYN) {
		this.bDelYN = bDelYN;
	}

	public String getUsId() {
		return usId;
	}

	public void setUsId(String usId) {
		this.usId = usId;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bType=" + bType + ", bRegD="
				+ bRegD + ", bDelYN=" + bDelYN + ", usId=" + usId + "]";
	}

	
	
	
	
}


