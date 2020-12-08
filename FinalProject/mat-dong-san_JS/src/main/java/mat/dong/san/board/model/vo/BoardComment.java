package mat.dong.san.board.model.vo;

import java.sql.Date;

public class BoardComment {
	private int bcId;
	private String bcContent;
	private Date bcRegD;
	private String usId;
	private int bId;
	private String bType;
	
	public BoardComment() {}

	public BoardComment(int bcId, String bcContent, Date bcRegD, String usId, int bId, String bType) {
		super();
		this.bcId = bcId;
		this.bcContent = bcContent;
		this.bcRegD = bcRegD;
		this.usId = usId;
		this.bId = bId;
		this.bType = bType;
	}

	public int getBcId() {
		return bcId;
	}

	public void setBcId(int bcId) {
		this.bcId = bcId;
	}

	public String getBcContent() {
		return bcContent;
	}

	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}

	public Date getBcRegD() {
		return bcRegD;
	}

	public void setBcRegD(Date bcRegD) {
		this.bcRegD = bcRegD;
	}

	public String getUsId() {
		return usId;
	}

	public void setUsId(String usId) {
		this.usId = usId;
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
		return "BoardComment [bcId=" + bcId + ", bcContent=" + bcContent + ", bcRegD=" + bcRegD + ", usId=" + usId
				+ ", bId=" + bId + ", bType=" + bType + "]";
	}
	
	
	
	
}
