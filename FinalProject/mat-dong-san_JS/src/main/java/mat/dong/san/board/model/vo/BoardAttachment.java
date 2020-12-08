package mat.dong.san.board.model.vo;

import java.sql.Date;

public class BoardAttachment {
	private int baId;
	private String baOrName;
	private String baChName;
	private Date baUpD;
	private String baDelYN;
	private int bId;
	private String bType;
	
	
	public BoardAttachment() {}

	public int getBaId() {
		return baId;
	}

	public void setBaId(int baId) {
		this.baId = baId;
	}

	public String getBaOrName() {
		return baOrName;
	}

	public void setBaOrName(String baOrName) {
		this.baOrName = baOrName;
	}

	public String getBaChName() {
		return baChName;
	}

	public void setBaChName(String baChName) {
		this.baChName = baChName;
	}

	public Date getBaUpD() {
		return baUpD;
	}

	public void setBaUpD(Date baUpD) {
		this.baUpD = baUpD;
	}

	public String getBaDelYN() {
		return baDelYN;
	}

	public void setBaDelYN(String baDelYN) {
		this.baDelYN = baDelYN;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	@Override
	public String toString() {
		return "BoardAttachment [baId=" + baId + ", baOrName=" + baOrName + ", baChName=" + baChName + ", baUpD="
				+ baUpD + ", baDelYN=" + baDelYN + ", bId=" + bId + ", bType=" + bType + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
