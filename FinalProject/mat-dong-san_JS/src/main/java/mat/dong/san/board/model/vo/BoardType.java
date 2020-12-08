package mat.dong.san.board.model.vo;

public class BoardType {
	private int bcId;
	private String bCategory;

	public BoardType(int bcId, String bCategory) {
		super();
		this.bcId = bcId;
		this.bCategory = bCategory;
	}
	
	public int getBcId() {
		return bcId;
	}
	public void setBcId(int bcId) {
		this.bcId = bcId;
	}
	public String getbCategory() {
		return bCategory;
	}
	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	@Override
	public String toString() {
		return "BoardType [bcId=" + bcId + ", bCategory=" + bCategory + "]";
	}
	
	
	
	
}	
