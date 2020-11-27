package mat.dong.san.search.model.vo;

import java.util.ArrayList;

public class SearchRoomFilter {
	private ArrayList<String> roomType;
	private ArrayList<String> tradeType;
	private int minCharter;
	private int maxCharter;
	private int minMonthly;
	private int maxMonthly;
	private ArrayList<String> buildType;
	private String parkType;
	private String petType;
	private String eleType;
	private String searchInput;
	
	public SearchRoomFilter() {
		roomType = new ArrayList<String>();
		roomType.add("원룸");
		roomType.add("투룸");
		roomType.add("쓰리룸");
		
		tradeType = new ArrayList<String>();
		tradeType.add("월세");
		tradeType.add("전세");
		
		buildType = new ArrayList<String>();
		buildType.add("단독주택");
		buildType.add("다가구주택");
		buildType.add("빌라");
		buildType.add("상가주택");
		
		maxCharter = 10000000;
		maxMonthly = 10000000;
		parkType = "무관";
		petType = "무관";
		eleType = "무관";
	}

	

	public SearchRoomFilter(ArrayList<String> roomType, ArrayList<String> tradeType, int minCharter, int maxCharter,
			int minMonthly, int maxMonthly, ArrayList<String> buildType, String parkType, String petType,
			String eleType, String searchInput) {
		super();
		this.roomType = roomType;
		this.tradeType = tradeType;
		this.minCharter = minCharter;
		this.maxCharter = maxCharter;
		this.minMonthly = minMonthly;
		this.maxMonthly = maxMonthly;
		this.buildType = buildType;
		this.parkType = parkType;
		this.petType = petType;
		this.eleType = eleType;
		this.searchInput = searchInput;
	}



	public ArrayList<String> getRoomType() {
		return roomType;
	}

	public void setRoomType(ArrayList<String> roomType) {
		this.roomType = roomType;
	}

	public ArrayList<String> getTradeType() {
		return tradeType;
	}

	public void setTradeType(ArrayList<String> tradeType) {
		this.tradeType = tradeType;
	}

	public int getMinCharter() {
		return minCharter;
	}

	public void setMinCharter(int minCharter) {
		this.minCharter = minCharter;
	}

	public int getMaxCharter() {
		return maxCharter;
	}

	public void setMaxCharter(int maxCharter) {
		this.maxCharter = maxCharter;
	}

	public int getMinMonthly() {
		return minMonthly;
	}

	public void setMinMonthly(int minMonthly) {
		this.minMonthly = minMonthly;
	}

	public int getMaxMonthly() {
		return maxMonthly;
	}

	public void setMaxMonthly(int maxMonthly) {
		this.maxMonthly = maxMonthly;
	}

	public ArrayList<String> getBuildType() {
		return buildType;
	}

	public void setBuildType(ArrayList<String> buildType) {
		this.buildType = buildType;
	}

	public String getParkType() {
		return parkType;
	}

	public void setParkType(String parkType) {
		this.parkType = parkType;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getEleType() {
		return eleType;
	}

	public void setEleType(String eleType) {
		this.eleType = eleType;
	}
	
	public String getSearchInput() {
		return searchInput;
	}

	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}



	@Override
	public String toString() {
		return "SearchRoomFilter [roomType=" + roomType + ", tradeType=" + tradeType + ", minCharter=" + minCharter
				+ ", maxCharter=" + maxCharter + ", minMonthly=" + minMonthly + ", maxMonthly=" + maxMonthly
				+ ", buildType=" + buildType + ", parkType=" + parkType + ", petType=" + petType + ", eleType="
				+ eleType + ", searchInput=" + searchInput + "]";
	}


	
	
}
